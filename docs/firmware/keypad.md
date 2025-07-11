## Introduction

dingoPDM supports up to 2 CANopen keypads per device as the keypad CANopen master node. 
 
As the keypads CANopen master node dingoPDM will:

- Send the start transmitting message
- Set the backlight color
- Set the button colors or LEDs

Each keypad needs only 1 CANopen master node. 

Additional keypad CANopen messages can be configured as CAN inputs without needing to be the CANopen master node. 


### Models

!!! Warning
    Only CANopen keypads are currently supported

- :green_square: : Tested
- :yellow_square: : Supported, Untested
- :blue_square: : Supported in the future
- :red_square: : Unsupported
  
| Brand          | Model            | Protocol  |     Status      |
| :------------- | :--------------- | :-------- | :-------------: |
| `Blink Marine` | `PKP-1600-SI`    | `CANopen` | :yellow_square: |
| `Blink Marine` | `PKP-2200-SI`    | `CANopen` | :yellow_square: |
| `Blink Marine` | `PKP-2300-SI`    | `CANopen` | :yellow_square: |
| `Blink Marine` | `PKP-2400-SI`    | `CANopen` | :yellow_square: |
| `Blink Marine` | `PKP-2500-SI`    | `CANopen` | :yellow_square: |
| `Blink Marine` | `PKP-2600-SI`    | `CANopen` | :green_square:  |
| `Blink Marine` | `PKP-3500-SI`    | `CANopen` | :yellow_square: |
| `Blink Marine` | `PKP-3500-SI-MT` | `CANopen` | :yellow_square: |
| `Blink Marine` | `PKP-1200-LI`    | `CANopen` | :yellow_square: |
| `Blink Marine` | `PKP-1500-LI`    | `CANopen` | :yellow_square: |
| `Blink Marine` | `PKP-2200-LI`    | `CANopen` | :yellow_square: |
| `Blink Marine` | `PKP-2400-LI`    | `CANopen` | :yellow_square: |

!!! Note
    If you've tested one of the :yellow_square: marked models above please let me know

## Initial Setup

### Setting Node ID

### Setting Transmit Rate

## Blink Marine

### Backlight

### Button Backlight

### Dial

## Grayhill

### Button LEDs