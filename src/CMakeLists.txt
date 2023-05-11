
set(TARGET target)

file(GLOB SRC *.c)

add_executable(${TARGET}
    ${SRC}
)

# pull in common dependencies
target_link_libraries(${TARGET}
    pico_stdlib
    freertos
)

# enable usb output, disable uart output
pico_enable_stdio_usb(${TARGET} 1)
pico_enable_stdio_uart(${TARGET} 0)

# create map/bin/hex/uf2 file etc.
pico_add_extra_outputs(${TARGET})