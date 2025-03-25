import cantools
from utils.signal_utils import create_duplicate_signals
from cantools.database.conversion import LinearConversion

def build_msg_0(base_id):
    message = cantools.database.Message(
        frame_id=base_id + 0,
        name="dingoPdmMsg0",
        length=8,
        is_extended_frame=False,
        signals=[]
    )

    dig_input_sigs = create_duplicate_signals("DigitalInput", 2, 1, 0, 1, 1, 0)
    message.signals.extend(dig_input_sigs)

    device_states = {
        0: "Run",
        1: "Sleep",
        2: "Overtemp",
        3: "Error"
    }
    dev_state_sig = cantools.database.Signal(   
        name="DeviceState",
        start=8,
        length=4,
        byte_order="little_endian",
        is_signed=False,
        minimum=0,
        maximum=3
    )
    dev_state_sig.choices = device_states
    message.signals.append(dev_state_sig)

    pdm_types = {
        0: "dingoPDM",
        1: "dingoPDM-Max"
    }
    pdm_type_sig = cantools.database.Signal(   
        name="PDMType",
        start=12,
        length=4,
        byte_order="little_endian",
        is_signed=False,
        minimum=0,
        maximum=15
    )
    pdm_type_sig.choices = pdm_types
    message.signals.append(pdm_type_sig)

    total_current_sig = cantools.database.Signal(   
        name="TotalCurrent",
        start=16,
        length=16,
        byte_order="little_endian",
        is_signed=False,
        conversion=LinearConversion(0.1, 0, False),
        minimum=0,
        maximum=655.35,
        unit="A"
    )
    message.signals.append(total_current_sig)

    battery_voltage_sig = cantools.database.Signal(
        name="BatteryVoltage",
        start=32,
        length=16,
        byte_order="little_endian",
        is_signed=False,
        conversion=LinearConversion(0.1, 0, False),
        minimum=0,
        maximum=655.35,
        unit="V"
    )
    message.signals.append(battery_voltage_sig)

    board_temp_sig = cantools.database.Signal(
        name="BoardTemperature",
        start=48,
        length=16,
        byte_order="little_endian",
        is_signed=False,
        conversion=LinearConversion(0.1, 0, False),
        minimum=0,
        maximum=215,
        unit="degC"
    )
    message.signals.append(board_temp_sig)
    
    return message