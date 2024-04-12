
![dingoPDM](../images/pdm.jpg){ width="1115" }

## Settings

![dingoPDMsettings](../images/pdmSettings.jpg){ width="1513" }

## CAN Input

### Enable

The CAN Input is enabled and evaluated in the device. 
Setting the unused inputs to not enabled reduces the amount of processing time on the device. 

### ID

### Low Byte

### High Byte

### Operator

### Mask

### Mode

### Examples


## Virtual Input

### Enable

The Virtual Input is enabled and evaluated in the device. 
Setting the unused inputs to not enabled reduces the amount of processing time on the device. 

### Not

### Variable

### Condition

### Mode

### Examples


## WiperModule

To control a wiper motor directly from dingoPDM a WiperModule is required. 
The WiperModule uses 3 relays to properly control the slow, fast and brake functions of a wiper motor. 
The internal connections are made based on the slow input (which also supplies all power to the motor) and the fast input. 
The ground and park signals are passed through the module. 

Information about the WiperModule can be found here: [WiperModule](https://github.com/corygrant/WiperModule)

![WiperModuleConnections](../images/WiperModuleStatesWhite.svg#only-dark){ .off-glb }
![WiperModuleConnections](../images/WiperModuleStatesBlack.svg#only-light){ .off-glb }

## Wiper

### Enable

The Wiper is enabled and evaluated in the device. 
Setting the unused Wiper to not enabled reduces the amount of processing time on the device. 

### State

### Speed

### Slow

### Fast

### Mode

### Slow In

### Fast in

### Intermittent In

### On In

### Speed In

### Park In

### Park Stop Level

### Swipe In

### Wash In

### Wash/Wipe Cycles


## Wiper Speed Map

### Speed 0-7


## Wiper Intermittent Time

### Intermittent Time 1- 6


## Flasher

### Enable

The Flasher is enabled and evaluated in the device. 
Setting the unused Flahser to not enabled reduces the amount of processing time on the device. 

### Single

### Input

### Output

### On Time

### Off Time


## Starter Disable

### Enable

The Starter Disable is enabled and evaluated in the device. 
Setting the unused Starter Disable to not enabled reduces the amount of processing time on the device. 

### Input

### O1-8