Kubernetes manifests 
====================

> Kubernetes manifests used for demonstrating end-to-end testing in GitOps
> environments.

## Getting started

```bash
# bootstrap repository
flux bootstrap github \
  --components-extra=image-reflector-controller,image-automation-controller \
  --owner=grgate \
  --repository=demo-manifests \
  --path=clusters/kind \
  --read-write-key \
  --personal
```

Sops is used to decrypt/encrypt the GRGate private key, for new setup, use the
following script to generate a new key:
```bash
# generate key
./generate-key.sh

# encrypt key used by the GRGate CLI to interact with Git commit status 
# a GitHub app need to be created before hand, refer to GRGate documentation
sops -e -i ./apps/bases/e2e-runner/github.private-key.sec.pem
```
