import cantools
from cantools.database.conversion import LinearConversion

def create_duplicate_signals(base_name, count, start_name, start_bit, length, scale, offset, unit=None):
    signals = []
    for i in range(count):
        signal_name = f"{base_name}_{i+start_name}"
        signal = cantools.database.Signal(
            name=signal_name,
            start=start_bit + i * length,
            length=length,
            byte_order="little_endian",
            is_signed=False,
            conversion=LinearConversion(scale, offset, False),
            unit=unit,
        )
        signals.append(signal)
    return signals