#!/usr/bin/env bash

kubectl -n appmesh-system port-forward svc/appmesh-prometheus 9090 &
pids[${i}]=$!
kubectl -n appmesh-system port-forward svc/appmesh-jaeger 16686 &
pids[${i}]=$!
kubectl -n appmesh-system port-forward svc/grafana-appmesh-grafana 3000 &

for pid in ${pids[*]}; do
    wait $pid
done
