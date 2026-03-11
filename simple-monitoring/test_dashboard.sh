#!/bin/bash

echo "Generating CPU load..."
stress --cpu 4 --timeout 60 & 

echo "Generating disk I/O load..."
dd if=/dev/zero of=testfile bs=1M count=500 oflag=direct & 

echo "Waiting for Netdata to capture metrics..."
sleep 10

echo "Test load generated. Check the Netdata dashboard at http://localhost:19999"
