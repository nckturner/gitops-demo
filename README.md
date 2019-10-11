# gitops-demo

Sync repo:

```sh
git add -A && \
git commit -m "sync" && \
git push origin master && \
fluxctl sync --k8s-fwd-ns flux
```

Tail Flagger logs:

```sh
kubectl -n appmesh-system logs deploy/flagger -f | jq .msg
```

Test rollback based on HTTP errors

```sh
kubectl -n prod exec -it deploy/flagger-loadtester bash

hey -z 1m -q 10 -c 2 http://podinfo.prod:9898/status/500
```

Test rollback based on HTTP latency

```sh
kubectl -n prod exec -it deploy/flagger-loadtester bash

hey -z 1m -q 10 -c 2 http://podinfo.prod:9898/delay/1
```