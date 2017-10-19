#!/bin/bash
set -x 
stty -F /dev/ttyACM0 raw -echo -echoe -echok -echoctl -echoke
cat /dev/ttyACM0