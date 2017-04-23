#!/bin/bash

for i in {0..255}
do
 echo 192.168.178.$i
 ping -c 1 192.168.178.$i
done

