out=/tmp/results.csv
cd /novo_go_bench

export GOPATH="$(dirname "$(readlink -f "$0")")"
go mod download golang.org/x/crypto >> $out 2>&1
echo "Go performance" >> $out 2>&1
go run ./go_benchmarks.go >> $out 2>&1