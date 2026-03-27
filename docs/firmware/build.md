Building dingoPDM firmware locally on your machine

!!! Note
    dingoPDM firmware is already pre-built and ready for use on [the release page](https://github.com/corygrant/DingoPDM_FW/releases)

## Linux

### ARM Toolchain

Download the relevant ARM toolchain from the [ARM website](https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads)

> x86_64 Linux hosted cross toolchains

> AArch32 bare-metal target (arm-none-eabi)

> `arm-gnu-toolchain-14.3.rel1-x86_64-arm-none-eabi.tar.xz`

The ARM toolchain needs to be on your PATH in order to use it on your machine. 

- Extract to a folder on your machine
- Put the folder on your PATH (example with version 14.2 and folder in /opt/):
    - `nano ~/.bashrc`
    - Place this at the bottom of the `.bashrc` file
        - `export PATH="/opt/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi/bin:$PATH"`
    - Save and close nano
    - Restart terminal (or run `source ~/.bashrc`)
    - Validate with `arm-none-eabi-gcc -v`

### OpenOCD

OpenOCD can be installed using: `sudo apt install openocd`

Validate with `openocd -v`


## Windows

### ARM Toolchain

Download the relevant ARM toolchain from the [ARM website](https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads)

> Windows (mingw-w64-x86_64) hosted cross toolchains

> AArch32 bare-metal target (arm-none-eabi)  

> `arm-gnu-toolchain-14.3rel1-mingw-w64-x86_64-arm-none-eabi.zip`

The ARM toolchain needs to be on your PATH in order to use it on your machine. 

- Unzip to a folder on your machine
- Put the folder on your PATH:
    - Open Environment Variables (Windows key, type Environment Variables)
    - Add the path to the `/bin` folder to your PATH variable
    - Open terminal
    - Validate with `arm-none-eabi-gcc -v`
        - If you receive an error, restart your terminal (or VS Code if using VS Code)

### OpenOCD

I've found that the easiest way to use OpenOCD on Windows is to use the xPack OpenOCD packages. 

- Download the xPack OpenOCD package [from the repo](https://github.com/xpack-dev-tools/openocd-xpack/releases)
    - Example `xpack-openocd-0.11.0-1-win32-x64.zip`
    - **Note: I've only been able to get v0.11 to work on my machine**
- Unzip to a folder on your machine
- Put the `/bin` folder on your PATH (same process as ARM toolchain above)
- Validate with `openocd -v`
    - If you receive an error, restart your terminal (or VS Code if using VS Code)



### Make

Use MSYS2 to add make and other Linux tools to Windows

- Install from the [MSYS2 site](https://www.msys2.org/#installation)
- Add the MSYS2 `usr/bin` folder to PATH
    - `C:\msys64\usr\bin`
- Check by running `pacman -V`
    - Note the capital -V
    - If you receive an error, restart your terminal (or VS Code if using VS Code)
- Install make using `pacman -S make'

## VS Code

The dingoPDM firmware repo includes VS Code settings to make working with the firmware easier. 

### Setup

The path to your ARM toolchain must be set in these settings files so VS Code can find the toolchain. 

- `c_cpp_properties.json`
    - Change `compilerPath` to the toolchain `/bin` path on your machine
    - Note that there are two configurations: `STM32-ChibiOS-Windows` and `STM32-ChibiOS-Linux`, make sure you're editing the correct configuration
- `settings.json`
    - Find the correct configuration: `windows` or `linux`
    - Edit `cortex-debug.armToolchainPath` to the toolchain `/bin` path on your machine
    - If on Windows, edit `cortex-debug.openocdPath` to the OpenOCD `.exe` path on your machine

### Build

To build the firmware in VS Code, press ++ctrl+shift+b++

VS Code will ask you which board type to build for, select the board type and press ++enter++

### Debug

To debug the firmware, press ++ctrl+shift+d++

Select the debug type from the dropdown based on the board type

Press ++f5++ to start debugging with OpenOCD
