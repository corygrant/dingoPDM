import cantools
from utils.signal_utils import create_duplicate_signals

def build_msg_12(base_id):
    message = cantools.database.Message(
        frame_id=base_id + 12,
        name="dingoPdmMsg12",
        length=8,
        is_extended_frame=False,
        signals=[]
    )

    can_in_val_sigs = create_duplicate_signals("CANInputValue", 4, 21, 0, 16, 1, 0)
    message.signals.extend(can_in_val_sigs)
    return message