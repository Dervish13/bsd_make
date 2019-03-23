#!/bin/sh

#export ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook-3.6 -i provision/inventory/localhost provision/site.yml -c local
