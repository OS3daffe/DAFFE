#!/bin/bash
i=0
while true; do
  echo $i
  time mongo 145.100.108.227/daffe --eval "db.dummy.insert({s:'foo'})"
  ((i+=1))
done