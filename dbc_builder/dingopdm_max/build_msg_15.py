import cantools
from utils.signal_utils import create_duplicate_signals

def build_msg_15(base_id):
    message = cantools.database.Message(
        frame_id=base_id + 15,
        name="dingoPdmMaxMsg15",
        length=8,
        is_extended_frame=False,
        signals=[]
    )

    output_dc_sigs = create_duplicate_signals("OutputDC", 4, 1, 0, 8, 1, 0, "%")
    message.signals.extend(output_dc_sigs)
    
    return message