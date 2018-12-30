#!/bin/bash

coproc bluetoothctl
echo -e "trust $1\n" >&${COPROC[1]}
sleep 5
echo -e "pair $1\nyes\n" >&${COPROC[1]}
sleep 5
echo -e "connect $1\n" >&${COPROC[1]}
echo -e 'exit' >&${COPROC[1]}
ouput=$(cat <&${COPROC[0]})
echo $output
