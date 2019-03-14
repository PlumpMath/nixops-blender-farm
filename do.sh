#!/bin/sh
export DIGITAL_OCEAN_AUTH_TOKEN=$(pass show misc/digitalocean-token)
export NIXOPS_DEPLOYMENT=renderops
exec $@
