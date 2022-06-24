Kubernetes manifests 
====================

> Kubernetes manifests used for demonstrating end-to-end testing in GitOps
> environments.

## Getting started

```bash
flux bootstrap github \
  --owner=grgate \
  --repository=demo-manifests \
  --path=clusters/kind \
  --personal
```
