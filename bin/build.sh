#!/bin/sh

file=$(readlink -f "$0")
dir=$(dirname $(dirname "$file"))

docker build -t dns ${dir} 