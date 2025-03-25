import cantools
from utils.signal_utils import create_duplicate_signals

def build_msg_10(base_id):
    message = cantools.database.Message(
        frame_id=base_id + 10,
        name="dingoPdmMsg10",
        length=8,
        is_extended_frame=False,
        signals=[]
    )

    can_in_val_sigs = create_duplicate_signals("CANInputValue", 4, 13, 0, 16, 1, 0)
    message.signals.extend(can_in_val_sigs)
    return message