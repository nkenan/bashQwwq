#!/bin/bash
for i in {0..255}
do
curl http://192.168.0.136/switch/toggle
sleep 0.01
done
