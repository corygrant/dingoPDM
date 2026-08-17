# Installing the PEAK PCAN-USB Driver on Linux (with DKMS)

A guide for getting a PEAK-System **PCAN-USB** adapter working on a Debian/Ubuntu/Mint
based Linux machine, and setting it up so it **survives kernel upgrades** automatically.

The PEAK chardev (`pcan`) driver is an out-of-tree kernel module. If you install it with
a plain `make install`, it is compiled against *one specific kernel version*. The next time
your distro installs a new kernel, the module no longer matches and fails to load with an
error like:

```
pcan: disagrees about version of symbol module_layout
```

...and `/dev/pcanusb*` never appears, so tools like `pcanview` can't see the adapter.

Registering the driver with **DKMS** fixes this for good: DKMS automatically recompiles the
module whenever a new kernel is installed.

---

## 1. Prerequisites

Install the build tools, kernel headers for your *running* kernel, and DKMS:

```bash
sudo apt update
sudo apt install build-essential dkms "linux-headers-$(uname -r)"
```

Verify the headers are present (this should print a path, not an error):

```bash
ls -d "/lib/modules/$(uname -r)/build"
```

Plug in the PCAN-USB adapter and confirm the OS sees it on USB:

```bash
lsusb | grep -i peak
# e.g. Bus 005 Device 054: ID 0c72:000c PEAK System PCAN-USB
```

> If `lsusb` doesn't show it, it's a cable/port/hardware problem — fix that first.

---

## 2. Get the driver source

Download the **peak-linux-driver** source tarball from PEAK:
<https://www.peak-system.com/quick/PCAN-Linux-Driver>

Extract it. **IMPORTANT: extract it to a path that contains NO SPACES.**
The Linux kernel build system (kbuild) cannot handle spaces in the module path and the
build will fail with errors like `No rule to make target '.../PEAK'`.

```bash
# Good:
cd ~/Downloads
tar xzf peak-linux-driver-9.0.tar.gz
cd peak-linux-driver-9.0

# Bad (will break the build):
#   ~/Desktop/PEAK Setup/peak-linux-driver-9.0   <-- space in "PEAK Setup"
```

Adjust `9.0` to match the version you downloaded.

---

## 3. (Optional) Quick test build

Before involving DKMS, you can confirm the source compiles against your kernel:

```bash
cd ~/Downloads/peak-linux-driver-9.0
make clean
make
# Check the module matches your running kernel:
modinfo driver/pcan.ko | grep -E 'vermagic|version'
```

The `vermagic:` line must start with your running kernel version
(`uname -r`, e.g. `6.8.0-124-generic`).

---

## 4. Install via DKMS (recommended)

This copies the driver source into the standard DKMS location `/usr/src` and registers it.
With `AUTOINSTALL="yes"` (set in the driver's `dkms.conf`), DKMS will then rebuild the module
automatically on every future kernel upgrade.

Set the version once so the commands below are copy-paste safe:

```bash
VER=9.0   # change to match your downloaded version

# 1. Copy the driver source into the canonical DKMS location
sudo cp -a ~/Downloads/peak-linux-driver-$VER/driver /usr/src/peak-linux-driver-$VER

# 2. Register, build, and install with DKMS
sudo dkms add     -m peak-linux-driver -v $VER
sudo dkms build   -m peak-linux-driver -v $VER
sudo dkms install --force -m peak-linux-driver -v $VER

# 3. (If you previously did a manual `make install`) remove the stale copy
#    so there is a single source of truth, then refresh module dependencies
sudo rm -f "/lib/modules/$(uname -r)/misc/pcan.ko" 2>/dev/null
sudo depmod -a
```

> **Keep `/usr/src/peak-linux-driver-$VER` in place.** That directory is what DKMS rebuilds
> from on every kernel upgrade — don't delete it like a stray download.

---

## 5. Load the driver and verify

```bash
sudo modprobe pcan
```

Check everything is correct:

```bash
# DKMS shows the driver installed for your kernel:
sudo dkms status
#   peak-linux-driver/9.0, 6.8.0-124-generic, x86_64: installed

# modprobe resolves to the DKMS copy (.../updates/dkms/...):
modinfo pcan | grep -E 'filename|vermagic'

# Module is loaded:
lsmod | grep pcan

# Character device exists:
ls -l /dev/pcanusb*
#   crw-rw-rw- 1 root root 510, 32 ... /dev/pcanusb32
```

If `/dev/pcanusb*` exists, the adapter is ready. Launch `pcanview` (or
`pcanview-ncurses`) to confirm you can see CAN traffic.

---

## 6. Confirm it survives a kernel upgrade

After your distro installs a new kernel and you reboot into it, DKMS should have already
rebuilt the module. Verify:

```bash
uname -r                # new kernel version
sudo dkms status        # should list peak-linux-driver for the new kernel
ls -l /dev/pcanusb*     # device should be present
```

No manual rebuild needed. 🎉

---

## Troubleshooting

| Symptom | Cause | Fix |
| --- | --- | --- |
| `pcan: disagrees about version of symbol module_layout` | Module built for a different kernel | Rebuild for the current kernel — that's what DKMS automates (Section 4) |
| `No rule to make target '.../PEAK'` during build | Space in the source path | Move the source to a path with no spaces (Section 2) |
| `/dev/pcanusb*` missing after `modprobe` | Driver didn't load, or USB not detected | Check `dmesg | tail`, `lsusb | grep -i peak`, `lsmod | grep pcan` |
| Build can't find kernel headers | Headers for running kernel not installed | `sudo apt install "linux-headers-$(uname -r)"` |
| Want to use SocketCAN (`can0`) instead | PEAK installer blacklists `peak_usb` | See note below |

### chardev vs. SocketCAN

PEAK's installer blacklists the in-kernel SocketCAN `peak_usb` driver (in
`/etc/modprobe.d/blacklist-peak.conf`) so it doesn't conflict with the `pcan` chardev driver.
This guide installs the **chardev** driver, which exposes `/dev/pcanusbN` and is used by
`pcanview` and PCAN-Basic. If you instead want a SocketCAN `canX` network interface (for
`candump`/`cansend`/`ip link`), you would remove that blacklist and use `peak_usb` — but then
the chardev tools won't work. Pick one based on your tooling.

### Removing the DKMS driver

```bash
sudo dkms remove -m peak-linux-driver -v $VER --all
sudo rm -rf /usr/src/peak-linux-driver-$VER
```
