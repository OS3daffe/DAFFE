#!/bin/bash
i=0
while true; do
  echo $i
  curl -X POST '145.100.108.226:8080/add?string=foo' -w ' -> %{time_total}\n'
  ((i+=1))
done