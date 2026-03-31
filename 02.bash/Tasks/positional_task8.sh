#!/bin/bash

arr=("$@")
orig=("$@")
len=${#arr[@]}

for (( i = 0; i < len; i++ )); do 
    echo "Args$((i+1)): ${orig[i]}"
    arr[i]=$(( arr[i] + ${orig[((i+1)%len)]} ))
done

echo "${arr[@]}"