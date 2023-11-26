# Welcome to MkDocs

* Set the input to `0` if CAN message has not been received

``` c linenums="609" hl_lines="7 8"
//=====================================================================================================
// Check CANInput receive time
//=====================================================================================================
for(int i=0; i<PDM_NUM_CAN_INPUTS; i++){
    stCanInputsRx[i].bRxOk = (HAL_GetTick() - stCanInputsRx[i].nLastRxTime) < stCanInputsRx[i].nRxMaxTime;
    //Set CANInput result to 0
    if(!stCanInputsRx[i].bRxOk){
        nCanInputs[i] = 0;
    }
}
```
