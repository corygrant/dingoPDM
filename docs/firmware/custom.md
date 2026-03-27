# Adding Custom Board Support to dingoPDM Firmware

## Overview

This guide walks you through adding support for a custom PDM board to the dingoPDM firmware. By following these steps, you'll build the firmware to run on your custom hardware while reusing existing functionality.

## Hardware

### Pins

The pins you need depend on which Profets (switching devices) you're planning to use.

#### BTS7002-1EPP

| Pin Type       | Count | Name  | Purpose                               |
| -------------- | ----- | ----- | ------------------------------------- |
| Analog Input   | 1     | `IS`  | Current feedback                      |
| Digital Output | 1     | `IN`  | Drive transistor ON/OFF (PWM-enabled) |
| Digital Output | 1     | `DEN` | Enable current sensing                |

#### BTS7008-2EPP Variant

| Pin Type       | Count | Name   | Purpose                                   |
| -------------- | ----- | ------ | ----------------------------------------- |
| Analog Input   | 1     | `IS`   | Current feedback                          |
| Digital Output | 1     | `IN`   | Drive transistor ON/OFF (PWM-enabled)     |
| Digital Output | 1     | `DSEL` | Select which output's current is measured |
| Digital Output | 1     | `DEN`  | Enable current sensing                    |

> **Note:** The BTS7008-2EPP uses a single shared current feedback channel with multiplexing via `DSEL`, while the BTS7002-1EPP has a dedicated feedback pin. All `IN` pins must support PWM; other outputs can use regular GPIO.

### PCB Design

!!! warning "To Do"
    *Schematic recommendations and layout guidelines*

---

## Firmware

The dingoPDM firmware is modular—adding a new board requires minimal changes outside the `boards/` folder. Follow these steps in order:

### Overview

- [ ] Copy and rename an existing board folder
- [ ] Update the `.ld` linker script
- [ ] Configure `board.mk`
- [ ] Define pins in `board.h`
- [ ] Set output count in `port.h`
- [ ] Declare outputs in `hw_devices.cpp`
- [ ] Update message handling in `msg.cpp`
- [ ] Update root `Makefile`
- [ ] Add PWM configuration in `port_pwm.h`
- [ ] Enable timers in `mcuconf.h` (if needed)

---

### Files

#### Linker Script (`.ld`)

**Location:** `boards/your_board_name/`

**Changes needed:**
- Rename the `.ld` file to match your board name exactly

---

#### Board Configuration (`board.mk`)

**Location:** `boards/your_board_name/`

???+ Example

    ```makefile
    # List of all the board related files
    BOARDSRC = ./boards/your_board_name/board.c

    # Required include directories
    BOARDINC = ./boards/your_board_name
    ```

---

#### Pin Definitions (`board.h`)

**Location:** `boards/your_board_name/`

This file initializes all MCU pins and their configurations. Define each pin type with the settings below:

!!! Note
    Refer to ChibiOS documentation on `board.h` configuration

???+ abstract "`IN` Pin Configuration"

    ```c
    Mode     = OUTPUT
    Otype    = PUSHPULL
    Ospeed   = HIGH
    Pupdr    = PULLDOWN
    Odr      = LOW
    Afio     = AF
    ```

???+ abstract "`DEN` Pin Configuration"

    ```c
    Mode     = OUTPUT
    Otype    = PUSHPULL
    Ospeed   = HIGH
    Pupdr    = PULLDOWN
    Odr      = LOW
    Afio     = AF
    ```

???+ abstract "`DSEL` Pin Configuration"

    ```c
    Mode     = OUTPUT
    Otype    = PUSHPULL
    Ospeed   = HIGH
    Pupdr    = PULLDOWN
    Odr      = LOW
    Afio     = AF
    ```

???+ abstract "`IS` Pin Configuration"

    ```c
    Mode     = ANALOG
    Otype    = PUSHPULL
    Ospeed   = LOW
    Pupdr    = FLOATING
    Odr      = LOW
    Afio     = AF
    ```

---

#### Counts (`port.h`)

**Location:** `boards/your_board_name/`

???+ Example

    ```c
    #define PDM_TYPE 2              // 0 = PDM, 1 = PDM-MAX, 2 = your new board
    #define PDM_NUM_OUTPUTS 8       // Total number of Profet outputs on your board
    #define PDM_NUM_INPUTS 2        // Total number of digital inputs on your board
    ```

!!! warning "To Do"

    Setting up and using VarMap

---

#### Output Declarations (`hw_devices.cpp`)

**Location:** `boards/your_board_name/`

**Key points:**
- Only modify the `#if PDM_TYPE == 2` section (match your PDM_TYPE value)
- Declare outputs in order: `IN`, `DEN`, `DSEL`, `IS`
- `&PWMD` specifies the timer module (must be unique per output)
- `&pwmCfg` references the PWM configuration (defined in `port_pwm.h`)

???+ Example

    ```c
    #if PDM_TYPE == 2
    // Output declarations for your board
    // Each output needs timer assignment and config reference
    #endif
    ```

---

#### CAN/USB Message Handling (`msg.cpp`)

**Location:** `common/` (root-level modification)

Update this file to transmit the status of your new outputs in both CAN and USB streams. Check existing board implementations for the pattern.

---

#### Root Makefile

**Location:** `Makefile` (repository root)

???+ Example "Changes needed"

    ```makefile
    ifeq ($(BOARD),)
        BOARD = your_board_name
    endif
    ```

---

#### PWM Configuration (`port_pwm.h`)

**Location:** `boards/your_board_name/`

**Steps:**
1. Copy an existing PWM configuration and rename it for your board
2. Declare the `.callback` member for each output
3. Add callback functions in two sections:
   - **Output PWM period callbacks** – called when PWM period changes
   - **Output PWM duty cycle callbacks** – called when duty cycle changes

???+ Example "Example callback pattern"

    ```c
    static void your_board_pwm_period_callback(uint16_t value) {
        // Handle period change
    }

    static void your_board_pwm_duty_callback(uint16_t value) {
        // Handle duty cycle change
    }
    ```

---

#### Timer Configuration (`mcuconf.h`)

**Location:** `boards/your_board_name/`

**When needed:**
- Enable new timer peripherals **only if** your PWM configuration uses timers not already enabled
- Check existing boards to see which timers are already configured
- If reusing timers from the reference board, no changes needed

---

## Build and Flash

Once all files are configured:

- **Build the firmware**
   ```bash
   make BOARD=your_board_name
   ```

- **Flash to your STM32**
    - Follow the existing [firmware flashing wiki](https://corygrant.github.io/dingoPDM/firmware/updating/)

---

## Validation Checklist

Before testing your custom board:

- [ ] All pin definitions in `board.h` match your schematic
- [ ] `PDM_NUM_OUTPUTS` matches your physical output count
- [ ] `PDM_NUM_INPUTS` matches your physical input count
- [ ] `PDM_TYPE` is unique and consistent across all files
- [ ] All PWM timer assignments are unique (no conflicts)
- [ ] `msg.cpp` includes your outputs in CAN/USB telemetry
- [ ] `.ld` linker script is renamed correctly
- [ ] Firmware builds without errors: `make BOARD=your_board_name`

---

## Common Issues & Troubleshooting

| Issue                          | Cause                                       | Solution                                                 |
| ------------------------------ | ------------------------------------------- | -------------------------------------------------------- |
| **Linker errors**              | `.ld` file not renamed or path wrong        | Verify `.ld` filename matches board name exactly         |
| **Undefined PDM_TYPE**         | Inconsistent `PDM_TYPE` values across files | Search all files and ensure consistency                  |
| **PWM conflicts**              | Timer assigned to multiple outputs          | Review `hw_devices.cpp` and use unique timers            |
| **Build fails: unknown board** | Root Makefile not updated                   | Add board to `ifeq` block in root `Makefile`             |
| **Outputs not responding**     | Wrong pin configuration                     | Double-check `board.h` pin modes and alternate functions |

---

## Reference: File Structure

```
DingoPDM_FW/
├── Makefile
├── boards/
│   ├── existing_board_1/
│   │   ├── board.c
│   │   ├── board.h
│   │   ├── board.mk
│   │   ├── board_name.ld
│   │   ├── hw_devices.cpp
│   │   ├── mcuconf.h
│   │   ├── port.h
│   │   └── port_pwm.h
│   └── your_board_name/          ← Copy here
│       ├── board.c
│       ├── board.h
│       ├── board.mk
│       ├── your_board_name.ld
│       ├── hw_devices.cpp
│       ├── mcuconf.h
│       ├── port.h
│       └── port_pwm.h
└── common/
    ├── msg.cpp                    ← Update here
    └── ...
```

---

## Next Steps

After building and flashing:

- Verify all outputs turn on/off correctly
- Monitor current feedback (`IS`) pins via CAN/USB telemetry
- Test PWM duty cycle control on `IN` pins
- Validate multiplexing on `DSEL` (BTS7008-2EPP only)

For questions, refer to the main [dingoPDM GitHub repository](https://github.com/corygrant/DingoPDM_FW)

!!! Note
 
    Thanks to **jabbarider** for this write up