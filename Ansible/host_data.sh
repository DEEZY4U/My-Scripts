#!/bin/bash/
export ANSIBLE_GATHERING=explicit
ansible all -a "uptime" -i inventory
# --- playbook.yml ---
# - hosts: all
#   tasks:
#     - shell: cat /etc/redhat-release
ansible-playbook -i inventory playbook.yml -vv

