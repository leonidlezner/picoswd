#!/bin/bash

export host="pi@192.168.178.194"
export build_name="build/main.elf"

ssh $host "mkdir -p /home/pi/build/"
scp $build_name $host:/home/pi/build/
ssh $host "openocd -f interface/raspberrypi-swd.cfg -f target/rp2040.cfg -c \"program $build_name verify reset exit\""