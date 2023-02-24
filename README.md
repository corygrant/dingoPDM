# DingoPDM
DingoPDM is an Infineon Profet based Power Distribution Module. 

![Top](/Images/DingoPDM_v4_Top.png)

![Bottom](/Images/DingoPDM_v4_Bottom.png)


# Goals
- Learn more about PDMs and high DC current devices
- Learn about developing firmware for a more complex STM32 based project
- Create a low cost device that my friends and I can use in our project cars
- Layout the board to fit simple case designs
    - 3D printed top shell and flat aluminum heatsinks (no machining)
- Use low cost 1oz/0.5oz 4 layer PCBs 
- Share my work with others for reference, inspiration or collaboration. 

If this project does help you in any way, I'd appreciate a message!

# Disclaimer
This is a personal hobby project. I am not a professional. Use at your own risk. 

# Hardware
- 4x Profet BTS7002-1EPP
    - 4x 14A outputs 
    - With flyback diodes
- 4x Profet BTS7008-2EPA
    - 8x 8A outputs
- Profets connected using I2C GPIOs and ADCs
- 8x Digital Inputs
    - Ground switching
    - I2C GPIO
- STM32F303CCT6 Microcontroller
- 256Kbit FRAM 
    - Settings storage
- 32MBit Flash
    - Logging or other purposes
- CAN transceiver
    - Terminating resistor selectable by GPIO output
- Board temperature measured between connectors
- 16x LEDs for output and device status
    - 3x additional LEDs for power and temperature status
- Onboard 12V to 5V to 3.3V regulation
    - 3.3V protected by Infineon ISP752R
- Super capacitor for real time clock
    - 32.768KHz clock included on STM32 for RTC
- M6 lug 12V power connection
- USB-C for:
    - Serial communication
    - Firmware update (DFU)
        - Boot select switch included
- Opto-isolated sleep/wakeup
    - For power shutdown (keyswitch)
    - 12V switched
    - Slider switch included for always on
- 12V voltage measurement
- THT test pads for easy connection of logic analyzer (ex: Saleae leads)
- AMPSeal 14 pin connectors
    - Gold contacts (14A each)

# Connections
| Connector | Pin | Function|
| --------- | --- | ------- |
| A | 1 | Output 5 |
| A | 2 | Output 4 |
| A | 3 | Output 3 |
| A | 4 | Output 2 |
| A | 5 | Output 1 |
| A | 6 | Output 6 |
| A | 7 | Ground |
| A | 8 | Output 2 |
| A | 9 | Output 9 |
| A | 10 | Input 1 |
| A | 11 | Input 2 |
| A | 12 | Input 3 |
| A | 13 | Input 4 |
| A | 14 | On Switch |
| B | 1 | Output 7 |
| B | 2 | Output 8 |
| B | 3 | Output 9 |
| B | 4 | Output 10 |
| B | 5 | Output 11 |
| B | 6 | Output 7 |
| B | 7 | Output 8 |
| B | 8 | Input 5 |
| B | 9 | Output 12 |
| B | 10 | Input 8 |
| B | 11 | Input 7 |
| B | 12 | Input 6 |
| B | 13 | CAN H |
| B | 14 | CAN L |

# Open Items
- Design a new case and heatsink for the V4 board (AMPSeal connectors)

# Issues
- The super cap drains faster than my calculations

# Untested
- Thermal performance at high total loads
- AMPSeal connectors (V3 = DTM, V4 = AMPSeal)
- Opto-isolator on the SYS_WKUP2 pin
- SPI Flash (haven't used it yet)

# Design Notes
- V3 of the board used DTM connectors, the switch to AMPSeal was made to:
    - Get away from the complicated clip design of the DTM PCB connector
        - This made it difficult to 3D print cases as the clips require accurate and strong features
    - Increase the terminal current rating (AMPSeal gold pins are rated much higher) 
    - Get away from the TE DTM case which was fully sealed. That didn't allow for a heatsink to be added that would be externally exposed. 
- The heatsink is designed to be 2 pieces. A spacer/spreader plate and a main plate
    - The spacer plate provides clearance for the THT pins of the AMPSeal connectors and the RedCube terminal while getting as close to the Profets as possible
    - **Note:** the spacer plate should be covered on both sides with a thermal pad material to electricaly isolate the heatsink while still providing a thermal interface (I use 3M 5583S)
    - The main plate holds the case and also sandwiches the spacer plate to the PCB
    - Here's an example of the V3 case:
    - ![Case w/ main plate](/Images/DingoPDM_v3_Case.png)
    - ![Spacer Plate](/Images/DingoPDM_v3_Heatsink.png)
- The LEDs are too close together which makes using light tubes in the case difficult
- A design could be decently waterproofed with some 3D printed TPU seals, but this is something I have not tried as my installation locations are on the interior

# Photos
Some various photos of different versions

![](/Images/DingoPDM_V2_Bare.jpg)

![](/Images/DingoPDM_v2_5.jpg)

![](/Images/DingoPDM_v2_3.jpg)

![](/Images/DingoPDM_v2_4.jpg)

![](/Images/DingoPDM_v2_2.jpg)

![](/Images/DingoPDM_v2_1.jpg)

![](/Images/DingoPDM_v2.jpg)
