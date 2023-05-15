# Setup for FreeRTOS on a Raspberry Pi Pico

This setup was made to lower the barrier-to-entry for programming in the C/CPP Pico SDK

I wrote a bash script called build.sh which will run CMake, Make, find your Pico, and flash it with the compiled code so that all you would need to do is write your code and run this script!
I would recommend creating an alias like "run" in your .bashrc file that calls the script so that you can put it some place safe and reuse for other Pico projects.

This is assuming you have everything required setup in VS Code

The tutorials I followed to properly configure my computer are in the links below:

https://shawnhymel.com/2096/how-to-set-up-raspberry-pi-pico-c-c-toolchain-on-windows-with-vs-code/
https://learnembeddedsystems.co.uk/freertos-on-rp2040-boards-pi-pico-etc-using-vscode

I want to sincerely thank Shawn Hymel from Digikey and MarkS from Learn Embedded Systems for their incredible tutorials. I couldn't have got this working without their work!