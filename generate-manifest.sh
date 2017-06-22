#!/bin/bash

set -e

which spruce > /dev/null 2>&1 || {
  echo "Aborted. Please install spruce by following https://github.com/geofffranks/spruce#installation" 1>&2
  exit 1
}

dir="$(dirname $0)"

spruce merge \
  --prune meta --prune terraform_outputs --prune cloudfoundry_outputs \
  "$dir/admin-ui-deployment.yml" \
  "$@"
