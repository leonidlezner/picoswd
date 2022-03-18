#!/bin/bash

host="192.168.178.194:3333"
build_name="build/main.elf"

#ssh $host "mkdir -p /home/pi/build/"
#scp $build_name $host:/home/pi/build/
#ssh $host "openocd -f interface/raspberrypi-swd.cfg -f target/rp2040.cfg -c \"program $build_name verify reset exit\""


arm-none-eabi-gdb -ex "target extended-remote ${host}" \
                  -ex "monitor reset init" \
                  -ex "load ${build_name}" \
                  -ex "monitor reset run" \
                  -ex "detach" \
                  -ex "q" \
                  "${build_name}"