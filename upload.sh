#!/bin/sh

scp build/main.elf pi@192.168.178.194:/home/pi/build/

ssh pi@192.168.178.194 "openocd -f interface/raspberrypi-swd.cfg -f target/rp2040.cfg -c \"program build/main.elf verify reset exit\""