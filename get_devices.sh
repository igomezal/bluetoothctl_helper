#!/bin/bash

coproc bluetoothctl
echo -e 'scan on\n' >&${COPROC[1]}
sleep 5
echo -e 'scan off\n' >&${COPROC[1]}
echo -e 'devices\nexit' >&${COPROC[1]}
ouput=$(cat <&${COPROC[0]})
output= echo $ouput | sed 's/^.*devices//' | sed 's/\[bluetooth\].*//' | sed 's/Device/\n/g'
echo $output