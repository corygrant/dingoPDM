# Introduction

![PCB Design](../images/DingoPDM_PCB_Layout_V7_2.png)

## Components

* 2x Profet `BTS7002-1EPP`
    * 2x 14A outputs 
    * With flyback diodes
* 3x Profet `BTS7008-2EPA`
    * 6x 8A outputs
* 2x Digital Inputs
    * Selectable pullup/pulldown
* `STM32F446RET6` Microcontroller
* 256Kbit `FRAM`
    * Settings storage
* CAN transceiver
    * No terminating resistor
* Board temperature measured using `MCP9808`
* 2x LEDs for power and temperature status
* 2x LEDs for status
* Onboard 12V to 5V to 3.3V regulation
* 2x M6 lug 12V power connection
* 12V voltage measurement
* THT test pads for easy connection of logic analyzer (ex: Saleae leads)
* Deutsch `DT 12 pin` connector

## KiCad

* Designed using `KiCad v7.0.6`

## Open Items

* Test V7.1 thermal performance

## Design Notes

* Prior to V6, the design had a lot of features which meant a lot of parts
* To make the board cheaper, easier to source/produce and quicker to test the design was drastically simplified
* The Deutsch DT connector was selected due to it's popularity, part availability and ease of use
* BTS724 was used on V6, but removed for V7 due to thermal issues. It wouldn't trip until a very high current. 

## MCU Pinout

| MCU Pin | Function                      | Type           |
| ---     | ----------------------------- | -------------- |
| `PA0`   | Output 1 Current Sense (IS)   | Analog Input   |
| `PA1`   | Output 5/6 Current Sense (IS) | Analog Input   |
| `PA2`   | Output 7/8 Current Sense (IS) | Analog Input   |
| `PA3`   | Battery Voltage Sense         | Analog Input   |
| `PA4`   | Output 8 Control Input (IN)   | Digital Output |
| `PA5`   | Output 7/8 Sense Select (DSEL)| Digital Output |
| `PA6`   | Output 7/8 Sense Enable (DEN) | Digital Output |
| `PA7`   | Output 7 Control Input (IN)   | Digital Output |
| `PA8`   | -                             | -              |
| `PA9`   | USB VBUS Sense                | Digital Input  |
| `PA10`  | Input 1                       | Digital Input  |
| `PA11`  | USB D- (DM)                   |                |
| `PA12`  | USB D+ (DP)                   |                |
| `PA13`  | SWDIO                         |                |
| `PA14`  | SWCLK                         |                |
| `PA15`  | -                             | -              |
| `PB0`   | Output 5/6 Sense Enable (DEN) | Digital Output |
| `PB1`   | Output 1 Control Input (IN)   | Digital Output |
| `PB2`   | Output 1 Sense Enable (DEN)   | Digital Output |
| `PB3`   | SWO                           |                |
| `PB4`   | -                             | -              |
| `PB5`   | -                             | -              |
| `PB6`   | I2C1 SCL                      |                |
| `PB7`   | I2C1 SDA                      |                |
| `PB8`   | CAN RX                        |                |
| `PB9`   | CAN TX                        |                |
| `PB10`  | Output 1 Control Input (IN)   | Digital Output |
| `PB12`  | Output 4 Control Input (IN)   | Digital Output |
| `PB13`  | -                             | -              |
| `PB14`  | Output 3/4 Sense Select (DSEL)| Digital Output |
| `PB15`  | Output 3/4 Sense Enable (DEN) | Digital Output |
| `PC0`   | Status LED                    | Digital Output |
| `PC1`   | Error LED                     | Digital Output |
| `PC2`   | Output 2 Current Sense (IS)   | Analog Input   |
| `PC3`   | Output 3/4 Current Sense (IS) | Analog Input   |
| `PC4`   | Output 6 Control Input (IN)   | Digital Output |
| `PC5`   | Output 5/6 Sense Select (DSEL)| Digital Output |
| `PC6`   | Output 3 Control Input (IN)   | Digital Output |
| `PC7`   | Output 2 Sense Enable (DEN)   | Digital Output |
| `PC8`   | Output 2 Control Input (IN)   | Digital Output |
| `PC9`   | Input 2                       | Digital Input  |
| `PC10`  | Extra 1                       | Undefined      |
| `PC11`  | Extra 2                       | Undefined      |
| `PC12`  | -                             | -              |
| `PC13`  | Extra 3                       | Undefined      |
| `PC14`  | -                             | -              |
| `PC15`  | -                             | -              |
| `PD2`   | -                             | -              |
| `PH0`   | Oscillator                    |                |
| `PH1`   | Oscillator                    |                |