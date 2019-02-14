#!/bin/sh

#export ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook -i provision/inventory/localhost provision/site.yml -c local
