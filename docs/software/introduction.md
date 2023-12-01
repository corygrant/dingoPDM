# Welcome to MkDocs

++ctrl+r++

``` c# title="Read Message 10" linenums="1"
private void ReadMessage10(byte[] data)
{
    Flashers[0].InputValue = Convert.ToBoolean(data[1] & 0x01);
    Flashers[1].InputValue = Convert.ToBoolean((data[1] & 0x02) >> 1);
    Flashers[2].InputValue = Convert.ToBoolean((data[1] & 0x04) >> 2);
    Flashers[3].InputValue = Convert.ToBoolean((data[1] & 0x08) >> 3);

    Flashers[0].Value = Convert.ToBoolean(data[0] & 0x01) && Flashers[0].Enabled && Flashers[0].InputValue;
    Flashers[1].Value = Convert.ToBoolean((data[0] & 0x02) >> 1) && Flashers[1].Enabled && Flashers[1].InputValue;
    Flashers[2].Value = Convert.ToBoolean((data[0] & 0x04) >> 2) && Flashers[2].Enabled && Flashers[2].InputValue;
    Flashers[3].Value = Convert.ToBoolean((data[0] & 0x08) >> 3) && Flashers[3].Enabled && Flashers[3].InputValue;
}
```

![PDM Main](../images/DingoConfigurator_PDM_Main.png)

![PDM Settings](../images/DingoConfigurator_PDM_Settings.png)