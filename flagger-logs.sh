#!/usr/bin/env bash

kubectl -n appmesh-system logs -f deployment/flagger | jq '.msg'
