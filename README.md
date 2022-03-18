# Sources

https://blog.smittytone.net/2021/02/02/program-raspberry-pi-pico-c-mac/


## MacOS Setup

Needed tools for cross compilation.

```bash
brew install cmake
brew tap ArmMbed/homebrew-formulae
brew install arm-none-eabi-gcc
```

## Pico SDK

```bash
git clone -b master --recurse-submodules https://github.com/raspberrypi/pico-sdk.git
```

## Print UART on Raspberry Pi

```bash
sudo stty 115200 -F /dev/ttyAMA0 
sudo cat /dev/ttyAMA0 
```

## Build OpenOCD for Pico on Raspberry Pi

```bash
git clone https://github.com/raspberrypi/openocd.git --recursive --branch rp2040 --depth=1
cd openocd
./bootstrap
./configure
make -j4
sudo make install
```

## Run openocd on Raspberry Pi

OpenOCD should run on Raspberry Pi, so local GDB can connect to it.

```bash
openocd -f interface/raspberrypi-swd.cfg -f target/rp2040.cfg -c "bindto 0.0.0.0"
```