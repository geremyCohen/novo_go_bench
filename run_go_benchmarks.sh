out=/tmp/results.csv
cd /novo_go_bench

export GOPATH="$(dirname "$(readlink -f "$0")")"
export GOCACHE=/root/.cache/go-build

echo "go path is $(GOPATH)" >> $out
echo "go cache is $(GOCACHE)" >> $out

go mod download golang.org/x/crypto >> $out 2>&1
echo "Go performance" >> $out 2>&1
go run ./go_benchmarks.go >> $out 2>&1