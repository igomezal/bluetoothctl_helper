#!/bin/bash

coproc bluetoothctl
echo -e "disconnect $1\n" >&${COPROC[1]}
sleep 5
echo -e 'exit' >&${COPROC[1]}
ouput=$(cat <&${COPROC[0]})
echo $output