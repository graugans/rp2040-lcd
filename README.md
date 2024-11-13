# Basic information

This routine is verified using the corresponding module with the PICO. 
You can see the corresponding test routine in the examples\ of the project.

## Basic use

You need to execute:
If the directory already exists, you can go directly. If there is no build directory, execute

```sh
mkdir build
```

Enter the build directory and type in the terminal:

```sh
cd build
export PICO_SDK_PATH="/opt/pico_sdk"
```

Where `/opt/pico_sdk` is your installed SDK directory
Execute cmake, automatically generate Makefile file, enter in the terminal:

```sh
cmake -GNinja ..
```

Execute make to generate an executable file, and enter in the terminal:

```sh
ninja
```

Copy the compiled uf2 file to pico

## Directory structure (selection)

If you use our products frequently, we will be very familiar with our program directory structure. We have a copy of the specific function.
The API manual for the function, you can download it on our WIKI or request it as an after-sales customer service. Here is a brief introduction:
Config\: This directory is a hardware interface layer file. You can see many definitions in DEV_Config.c(.h), including:
   type of data;
    GPIO;
    Read and write GPIO;
    Delay: Note: This delay function does not use an oscilloscope to measure specific values.
    Module Init and exit processing:
        void DEV_Module_Init(void);
        void DEV_Module_Exit(void);

**\lib\GUI\:** This directory is some basic image processing functions, in GUI_Paint.c(.h):
    Common image processing: creating graphics, flipping graphics, mirroring graphics, setting pixels, clearing screens, etc.
    Common drawing processing: drawing points, lines, boxes, circles, Chinese characters, English characters, numbers, etc.;
    Common time display: Provide a common display time function;
    Commonly used display pictures: provide a function to display bitmaps;

**\lib\Fonts\:** for some commonly used fonts:
    Ascii:
        Font8: 5*8
        Font12: 7*12
        Font16: 11*16
        Font20: 14*20
        Font24: 17*24
    Chinese:
        font12CN: 16*21
        font24CN: 32*41

**\lib\LCD\:** This directory is the LCD driver function;
**examples\:** This directory is the test program of LCD, you can see the specific usage method in it;
