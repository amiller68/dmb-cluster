#!/usr/bin/env bash

# Start the nginx server on the host 
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i "$INVENTORY_PATH" \
  -u "admin" \
  -e "email=$EMAIL" \
  ./ansible/admin/nginx.yml