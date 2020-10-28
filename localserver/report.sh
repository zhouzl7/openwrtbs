#! /bin/sh

while true
do
  grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf("\x10%d\n", usage)}' | nc -c -u -p1234 10.0.2.2 5000; sleep 1
  ps | echo -n -e "\x11$(cat -)" | nc -c -u -p1234 10.0.2.2 5000; sleep 1
  sleep 28
done
