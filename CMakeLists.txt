cmake_minimum_required(VERSION 3.12)

# Set pico_sdk path
set(PICO_SDK_PATH "/opt/pico_sdk")
include(pico_sdk_import.cmake)
project(Pico_ePaper_Code)
pico_sdk_init()

# Add subdirectory for compilation
add_subdirectory(lib/Config)
add_subdirectory(lib/LCD)
add_subdirectory(lib/Fonts)
add_subdirectory(lib/GUI)
add_subdirectory(examples)



# Add header file directory
include_directories(examples)
include_directories(./lib/Config)
include_directories(./lib/GUI)
include_directories(./lib/LCD)

# Generate executable file
add_executable(main 
                    main.c
)

# enable usb output, disable uart output
pico_enable_stdio_usb(main 1)
pico_enable_stdio_uart(main 1)

# create map/bin/hex/uf2 file etc.
pico_add_extra_outputs(main)

target_link_libraries(main examples LCD GUI Fonts Config pico_stdlib hardware_spi)