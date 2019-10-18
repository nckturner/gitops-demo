sync:
	git add -A && \
	git commit -m "sync" && \
	git push origin master && \
	fluxctl sync --k8s-fwd-ns flux
