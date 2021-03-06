cmake_minimum_required(VERSION 3.13)

# initialize the SDK based on PICO_SDK_PATH
# note: this must happen before project()
include(pico-sdk/external/pico_sdk_import.cmake)

project(i2ctryout)

# initialize the Raspberry Pi Pico SDK
pico_sdk_init()

add_executable(main
    src/main.cpp
    src/i2c_demo.cpp
)

# Add pico_stdlib library which aggregates commonly used features
target_link_libraries(main pico_stdlib)

pico_enable_stdio_usb(main 0)
pico_enable_stdio_uart(main 1)

# create map/bin/hex/uf2 file in addition to ELF.
pico_add_extra_outputs(main)

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -DDEBUG")
