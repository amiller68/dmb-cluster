#!/usr/bin/env bash

# Install dependencies on the host
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i "$INVENTORY_PATH" \
  -u "admin" \
  ./ansible/dependencies.yml