#!/usr/bin/env bash
# Generate private key and create sops-gpg secret in Kubernetes
set -e

KEY_NAME="grgate-kind"
KEY_COMMENT="flux secrets"

gpg --batch --full-generate-key <<EOF
%no-protection
Key-Type: 1
Key-Length: 4096
Subkey-Type: 1
Subkey-Length: 4096
Expire-Date: 0
Name-Comment: ${KEY_COMMENT}
Name-Real: ${KEY_NAME}
EOF

export KEY_FP=$(gpg --list-secret-keys "${KEY_NAME}" | head -n 2 | tail -n 1 | sed 's/\s//g')
gpg --export-secret-keys --armor "${KEY_FP}" |
  kubectl create secret generic sops-gpg \
    --namespace=flux-system \
    --from-file=sops.asc=/dev/stdin
