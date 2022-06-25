Kubernetes manifests 
====================

> Kubernetes manifests used for demonstrating end-to-end testing in GitOps
> environments.

## Getting started

```bash
flux bootstrap github \
  --components-extra=image-reflector-controller,image-automation-controller \
  --owner=grgate \
  --repository=demo-manifests \
  --path=clusters/kind \
  --read-write-key \
  --personal
```
