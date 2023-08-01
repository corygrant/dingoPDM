# DingoPDM
DingoPDM is an Infineon Profet based Power Distribution Module. 

![Top](/Images/DingoPDMTop_V6.png)

![Bottom](/Images/DingoPDMBottom_V6.png)


# Goals
- Learn more about PDMs and high DC current devices
- Learn about developing firmware for a more complex STM32 based project
- Create a low cost device that my friends and I can use in our project cars
- Layout the board to fit simple case designs
    - 3D printed top shell and flat aluminum heatsinks (no machining)
- Use low cost 1oz/0.5oz 4 layer PCBs (low cost 2oz/1oz now available from JLCPCB)
- Share my work with others for reference, inspiration or collaboration. 

If this project does help you in any way, I'd appreciate a message!

# Disclaimer
This is a personal hobby project. I am not a professional. Use at your own risk. 

# Hardware
- 2x Profet BTS7002-1EPP
    - 2x 14A outputs 
    - With flyback diodes
- 1x Profet BTS7008-2EPA
    - 2x 8A outputs
- 1x Profet BTS724G
    - 4x 3A outputs
- 2x Digital Inputs
- STM32F303CCT6 Microcontroller
- 256Kbit FRAM 
    - Settings storage
- CAN transceiver
    - No terminating resistor
- Board temperature measured using MCP9808
- 2x LEDs for power and temperature status
- Onboard 12V to 5V to 3.3V regulation
- 2x M6 lug 12V power connection
- 12V voltage measurement
- THT test pads for easy connection of logic analyzer (ex: Saleae leads)
- Deutsch DT 12 pin connector

# Connections
| Pin | Function| Current |
| --- | ------- | ------- |
| 1 | Output 8  | 3A  |
| 2 | Output 7  | 3A  |
| 3 | Output 6  | 3A  |
| 4 | Output 5  | 3A  |
| 5 | CAN L     |     |
| 6 | CAN H     |     |
| 7 | Output 1  | 14A |
| 8 | Input 1   |     |
| 9 | Output 4  | 8A  |
| 10 | Output 3 | 8A  |
| 11 | Input 2  |     |
| 12 | Output 2 | 14A |

# Open Items
- Test V6
- Redo case design for V6

# Untested
- V6 boards have been ordered but haven't been tested

# Design Notes
- Prior to V6, the design had a lot of features which meant a lot of parts
- To make the board cheaper, easier to source/produce and quicker to test the design was drastically simplified
- The Deutsch DT connector was selected due to it's popularity, part availability and ease of use

# Case
**V6 case design in progress**

V5 Case/Heatsink design
- 3D Printed (Case and Faceplate)
- Flat aluminum heatsink plate
- Flat aluminum baseplate
- The heatsink is designed to be 2 pieces. A heatsink plate and a baseplate
    - The heatsink plate provides clearance for the THT pins of the AMPSeal connectors and the RedCube terminal while getting as close to the Profets as possible
    - **Note:** the heatsink plate should be covered on both sides with a thermal pad material to electricaly isolate the heatsink while still providing a thermal interface (I use 3M 5583S)
    - The baseplate holds the case and also sandwiches the spacer plate to the PCB

![](/Images/CaseV5/DingoPDM_V5_Case1.png)

![](/Images/CaseV5/DingoPDM_V5_Case2.png)

![](/Images/CaseV5/DingoPDM_V5_Case3.png)

![](/Images/CaseV5/DingoPDM_V5_Case4.png)

# Photos
Some various photos of different versions

![](/Images/DingoPDM_V2_Bare.jpg)

![](/Images/DingoPDM_v2_5.jpg)

![](/Images/DingoPDM_v2_3.jpg)

![](/Images/DingoPDM_v2_4.jpg)

![](/Images/DingoPDM_v2_2.jpg)

![](/Images/DingoPDM_v2_1.jpg)

![](/Images/DingoPDM_v2.jpg)
