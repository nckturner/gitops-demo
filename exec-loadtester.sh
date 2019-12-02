#!/usr/bin/env bash
#
# Example loadtester commands:
#
## Fail on 500s
# hey -z 1m -c 5 -q 5 http://podinfo-canary.demo:9898/status/500
#
## Fail on latency
# hey -z 1m -c 5 -q 5 http://podinfo-canary.demo:9898/delay/1
#

kubectl -n demo exec -it $(kubectl -n demo get pods -o name | grep -m1 flagger-loadtester | cut -d'/' -f 2) bash
