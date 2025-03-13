## What Is It?

dingoPDM is an automotive `Power Distribution Module`. 

PDMs can be used in place of fuses, circuit breakers and relays, including flasher and wiper relays. 

Each output channel of the PDM:
 
- Measures the active current and reacts by turning the output off if the current exceeds the limit
- Automatically resets after a cool down period a maximum number of times
- Can be turned on/off using various input sources
- Can be on constantly or with Pulse Width Modulation(PWM)

This makes PDMs a very flexible solution when designing the power system in any automotive application. 

## Features

A key feature of any PDM is flexible configuration to match the target application. 

To meet these needs, dingoPDM includes configurable:

- Outputs
- Digital inputs
- CAN inputs
- Virtual logic inputs
- Counters
- Logic conditions
- Wipers
- Flashers
- Starter disable

All settings on the dingoPDM can be controller by the custom Windows application [DingoConfigurator](../software/introduction.md) 

dingoPDM also includes:

- Cyclic CAN status messages (TX)
- Pulse Width Modulation (PWM)
    - Configurable base frequency
    - Fixed or variable duty cycle
- CAN keypad support (work in progress)
    - Blink Marine
    - Grayhill
- Battery voltage measurement
- Internal temperature sensor
- Status LEDs

## Configuration

The dingoPDM configuration can be accessed using:

- USB-C connected directly to the device, one at a time
- A CAN connection to one or many dingoPDMs at once using a USB to CAN adapter such as [USB2CAN](https://github.com/corygrant/USB2CAN_HW)

Configuration reading/writing and status monitoring are all done using the custom built Windows application [DingoConfigurator](../software/introduction.md) 

## Resources

### GitHub
dingoPDM is split between 3 GitHub repos.

The latest releases can be found on the Releases page for each repo:

- Hardware: [dingoPDM](https://github.com/corygrant/dingoPDM/releases)
- Firmware: [dingoPDM_FW](https://github.com/corygrant/DingoPDM_FW/releases)
- Software: [DingoConfigurator](https://github.com/corygrant/DingoConfigurator/releases)

dingoPDM-Max is split between 2 GitHub repos. 

The latest releases can be found on the Releases page for each repo:

- Hardware: [dingoPDM-Max](https://github.com/corygrant/dingoPDM-Max)
- Firmware: [dingoPDM-Max_FW](https://github.com/corygrant/dingoPDM-Max_FW)

!!! Note
    dingoPDM will ship with the latest firmware release installed at the time of shipping, but new firmware is released frequently. 

    Check the Releases page for a new release when receiving the dingoPDM and follow the [Firwmare Updating](https://corygrant.github.io/dingoPDM/firmware/updating/) instructions. 

### Store

Built and tested dingoPDMs can be purchased through the Dingo Electronics Store. 

All PDMs are assembled, tested and shipped from Virginia :flag_us:

[Dingo Electronics Store](https://dingo-electronics.square.site/)

### Discord

See invite link at the bottom right of the page

!!! Note
    If the link is expired, send a message on the store page 

## Test Config File

When first powering on dingoPDM, whether one received from the store or built yourself, the included test file can be used to verify functionality. 

The test file includes a very basic setup:

- All outputs:
    - Enabled
    - Set to turn on with input 1
    - Set to their max current limit with endless reset
- Input 1 set to: 
    - Pullup
    - Invert
    - Momentary
    
Connect input 1 to ground to turn all outputs on. 

## Changing CAN ID

The CAN Base ID default value is 2000. 

To change this, modify the value in the [DeviceTree](../software/devicetree.md) and press `Update` and then `Burn` to save the setting. 

On the next power up, the CAN Base ID will be updated. 


## Goals

- [X] Learn more about PDMs and high DC current devices
- [X] Learn about developing firmware for a more complex STM32 based project
- [X] Create a low cost device that my friends and I can use in our project cars
- [X] Layout the board to fit simple case designs
    * [X] 3D printed top shell and flat aluminum heatsinks (no machining)
- [X] Use low cost 1oz/0.5oz 4 layer PCBs (low cost 2oz/1oz now available from JLCPCB)
- [X] Share my work with others for reference, inspiration or collaboration. 
- [X] Document the project in a professional way to make it easy to use and access
- [X] Develop an easy to use configuration PC software
- [X] Offer fully built devices for sale

!!! info
    If this project helps you in any way, I'd appreciate a message!

## Project Status

- :green_square: : Complete
- :yellow_square: : In Progess
- :red_square: : Not Started

| Recent Open Items          | Status         |
|----------------------------|----------------|
| Finish case design         | :green_square: |
| Test thermal performance   | :green_square: |
| Support USB C to C cables  | :green_square: |
| Develop dingoPDM-Max       | :green_square: |
| Finish documentation       | :yellow_square:|
| Add device sleep           | :green_square: |
| Add verbose error handling | :green_square: |
| Add keypad support         | :yellow_square:|
| Add PWM output support     | :green_square: |
| Switch-less bootloader     | :green_square: |
| Add soft HMI buttons       | :yellow_square:|
| Finish plots in software   | :yellow_square:|
| Move to ChibiOS            | :green_square: |

## Disclaimer

!!! warning
    Please note that this product has been designed by a hobbyist, not a professional. 
    It is intended for off-road and testing use only. 
    Users should operate the product at their own discretion and risk. 
    The designer explicitly disclaims any responsibility for damage or injury that may result from the use of this product.
