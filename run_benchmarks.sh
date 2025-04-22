#!/bin/bash

if [ -z "$1" ]; then
	out=`pwd`/results.csv
else
	out=`pwd`/$1
fi

echo $out

# Install script for Ubuntu 24.04 LTS
sudo apt update
sudo rm -rf /usr/local/go
sudo rm -rf /usr/bin/go
sudo snap install go --classic
sudo ln -s /snap/bin/go /usr/bin/go
git clone https://github.com/geremyCohen/novo_go_bench.git
cd novo_go_bench

go mod download golang.org/x/crypto
go install

export GOPATH="$(dirname "$(readlink -f "$0")")"

echo "Go performance" | tee -a $out
go run ./go_benchmarks.go | tee -a $out
