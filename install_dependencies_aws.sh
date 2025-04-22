#!/bin/bash

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

./run_go_benchmarks.sh &
