out=/tmp/results.csv
cd /novo_go_bench
export GOPATH="$(dirname "$(readlink -f "$0")")"
echo "Go performance" | tee -a $out
go run ./go_benchmarks.go | tee -a $out