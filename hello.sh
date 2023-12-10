#!/bin/sh

echo "Hello world, from a sandbox"

if [[ -z "$1" ]]; then
  echo "Error: You need to run this script with a file argument"
  exit 1
fi

echo "Reading file $1"
cat $1
