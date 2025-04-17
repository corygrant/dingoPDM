# Functionality

dingoPDM includes the ability to control a simple DC wiper motor. 

## Wiring

To wire the wiper motor to the dingoPDM, a [WiperModule](https://dingo-electronics.square.site/product/wipermodule/4) or similar relay setup is required. 

The relays are used to correctly isolate the slow and fast motor windings. 

See [Wiper Connections](../hardware/connections.md#wipers) for more information. 

## Outputs

To control the wiper motor, dingoPDM uses 2 outputs. 

These outputs are available in the var map and can be set to any outputs. 

- Slow output
- Fast output

## Inputs

### Park Switch

To correctly control the wiper motor, dingoPDM requires 1 input to be wired to the park switch of the wiper motor. 

The parked position logic level can be changed using the `Park Stop Level` setting.

### Slow In

- Slow input = true
    - Wiper motor runs at slow speed
- Slow input = false
    - Motor moves to the park position. 

### Fast In

- Fast input = true
    - Wiper motor runs at fast speed
- Fast input = false
    - Motor moves to the park position. 

### Intermittent In

When the intermittent input is true, the wiper motor runs at slow speed and pauses at the end of every cycle. After the pause is elapsed, the motor does another cycle and repeats. 

The intermittent time can be set as a fixed value or a variable value depending on the [mode](#modes). 

### Wash In

On the rising edge of the wash input the wiper motor runs at slow speed (unless previously running at fast speed). 

When the input goes false, the wiper motor continues to run for the number of cycles set in Wash/Wipe cycles.

After completing the cycles the wiper motor parks.

!!! Tip
    To control a washer pump motor, use the `Wash In` variable as the output variable for a dingoPDM output wired to the pump motor

### Swipe In

On the rising edge of the swipe input the wiper motor runs at fast speed for one cycle and then parks. 

### Speed In

When in the `IntIn` or `MixIn` mode this numeric input is used to set the speed from the speed map. 

### On in

When in `MixIn` mode the on input controls whether the motor is running or not. 

## Modes

A dingoPDM wiper can be controlled using a few different modes. 

- `DigIn`
- `IntIn`
- `MixIn`

### DigIn

In `DigIn` mode the wiper motor is controlled with simple digital inputs. 

Intermittent pause delay is set the value in `Intermit 1` and is not variable. 

Required inputs:

- `Park In`
- `Slow In`

Optional inputs:

- `Fast In`
- `Inter In`
- `Swipe In`
- `Wash In`

Unused inputs:

- `On In`
- `Speed In`

### IntIn

In `IntIn` mode the wiper motor is controlled using a numeric input value.

This could be a CAN input value or a Counter value. 

The value of the numeric input is mapped to the values set in `Wiper Speed Map`

!!! Example
    - `Speed 0` = `Park`
    - `Speed 1` = `Slow`
    - `Speed 2` = `Fast`
    - `Speed 3` = `Inter1`
    - `Speed 4` = `Inter2`
    - `Speed 5` = `Inter3`
    - `Speed 6` = `Inter4`
    - `Speed 7` = `Inter5`

      `Speed In` value sets motor to:

      - `Speed In` = 2
          - `Fast`
      - `Speed In` = 5
          - `Intermittent` with a delay of `Intermit 3`

The numeric input value can be any value between 0 and 7, all values do not have to be provided.

>Note: One value must always be `Park` or the motor will never stop

Required inputs:

- `Park In`
- `Speed In`

Optional inputs:

- `Swipe In`
- `Wash In`

Unused inputs:

- `Slow In`
- `Fast In`
- `Inter In`
- `On In`

### MixIn

`MixIn` mode is similar to `IntIn` mode but with the addition of `On In`. 

The speed map works the same as `IntIn` mode but `Park` is not required as a possible speed. 

The wiper motor uses the `On In` to control whether the motor is running:

- `On In` = On
    - Motor running
- `On In` = Off
    - Motor parking/parked

Required inputs:

- `Park In`
- `Speed In`
- `On In`

Optional inputs:

- `Swipe In`
- `Wash In`

Unused inputs:

- `Slow In`
- `Fast In`
- `Inter In`

## States

dingoPDM wipers can be in one of these states:

- `Parked`
    - At the park position
    - Waiting for inputs to change state
    - Slow = off
    - Fast = off
- `Parking`
    - Inputs off, moving to the park position
    - Outputs = previous state (slow or fast)
- `Slow`
    - Slow input on
    - Slow = on
    - Fast = off
- `Fast`
    - Fast input on
    - Slow = off
    - Fast = on
- `IntermittentPause`
    - Intermittent input on
    - At the park position
    - Waiting for intermittent delay to expire
    - Slow = off
    - Fast = off
- `IntermittentOn`
    - Intermittent input on
    - Motor moving at slow speed
    - Slow = on
    - Fast = off
- `Wash`
    - Wash input on or (off and wipes not complete)
    - Outputs = previous state (slow or fast)
- `Swipe`
    - Swipe input on
    - Motor moving at fast speed
    - Slow = off
    - Fast = on