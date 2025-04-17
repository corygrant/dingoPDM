## Introduction

To enable changes to the dingoPDM configuration and to persist those changes across a power cycle dingoPDM uses a configuration struct that is read from and written to FRAM over I2C. 

## Read

When dingoPDM is powered on, the first thing it does after initializing ChibiOS and I2C is read the configuration from FRAM over I2C. 

Read sequence:

1. Check the FRAM I2C communication and chip IDs (manufacturer and product ID)
2. Read the configuration starting at address 0
3. Check the version number stored in the configuration matches the current configuration
4. Read the configuration checksum stored at the memory address immediatley following the end of the configuration
5. Calculate the configuration checksum for the current configuration read from FRAM
6. Verify that the checksum stored in FRAM matches the one calculated from the configuration stored in FRAM
7. Continue intialization

## Updating

The values of the dingoPDM configuration are updated using CAN or USB messages. 

The format of these messages can be found in [CAN](./can.md)

There is no special mode required to update configuration values, update settings messages can be sent at any time (besides a fatal error state). 

!!! Note
    When a value is updated using a CAN or USB the value is immediately changed in the dingoPDM firmware

    But, the value will not persist over a power cycle

    To keep the updated value send a Burn message to write the new configuration to FRAM

## Write

To reduce the number of writes to FRAM the configuration is not written to FRAM on configuration changes. 

The updated value is immediately changed in the dingoPDM firmware but a Burn message must be received to write the new configuration to FRAM

The [Burn](./can.md#burn) message is the only way to trigger a write of the current configuration. 

Write sequence:

1. Check the FRAM I2C communication and chip IDs (manufacturer and product ID)
2. Write the configuration starting at address 0
3. Calculate the checksum of the current configuration
4. Write the checksum to the memory address immediatley following the end of the configuration
5. Send the write result out on the Burn response message (0 = fail, 1 = success)
    
## Read Failure

If checking I2C communication and chip IDs fails dingoPDM enters the fatal error state and will not go into run.

If any of the other read steps fail:

- Check for I2C errors
    - Errors = true, go to the fatal error state
- Write the firmware default configuration to FRAM
    - If this fails, check for I2C errors again:
        - Errors = true, go to the fatal error state
    - If this succeeds, go to the fatal error state

!!! Info
    Writing the firmware default configuration on a failure allows dingoPDM to recover from a firmware configuration change. 

    Some firmware updates include a change to the configuration struct which means the configuration stored in FRAM no longer matches what the firmware expects.

    On the next power cycle, FRAM will contain the correct memory values and will pass the version and CRC checks but the configuration will be the default blank configuration.

    Write the new desired configuration with the updated format to the dingoPDM using DingoConfigurator.