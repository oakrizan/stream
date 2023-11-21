#!/usr/bin/env bash

set -euo pipefail

source .buildkite/scripts/common.sh

add_bin_path
with_go "${GOLANG_VERSION}"

go mod tidy && git diff --exit-code
make check-fmt
go vet
