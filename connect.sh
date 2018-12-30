#!/bin/bash

coproc bluetoothctl
echo -e "connect $1\n" >&${COPROC[1]}
echo -e 'exit' >&${COPROC[1]}
ouput=$(cat <&${COPROC[0]})
echo $output