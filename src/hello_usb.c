// Standard includes
#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include "pico/stdlib.h"

// Your project specific includes which are in ../include
#include "who.h"

void print_task(){
    while(1){ // Every task needs to go into an endless loop
        printf("Hello world\n"); // Standard libc function
        whoami(); // Custom function from ../include

        // Every task needs a call to a function which gives up 
        // control of the cpu such as vTaskDelay()
        vTaskDelay(1000 / portTICK_PERIOD_MS); // Sleep 1s
    }
}

int main(){
    // Initialize USB as stdio
    stdio_init_all();

    xTaskCreate(print_task, // Create a task called print_task()
                "Print task", // Description of task
                256, // Stack size
                NULL, // Task's parameters
                1, // Priority
                NULL); // Task handle

    // Start operating system
    vTaskStartScheduler();

    while(1){
        // Dead loop
    }
}