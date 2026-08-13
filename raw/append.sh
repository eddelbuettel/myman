#!/bin/bash

newest=$(ls -1tr myman_*.csv | tail -n 1)
#echo "Newest is ${newest}"

# Use the full July set, and append the newest file modulo its header line
# to form a new full csv with a header (from first file) and quoted entries
cat myman_2026-07-25-13-56.csv <(sed -n '2,$p' ${newest})
