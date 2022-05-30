#!/usr/bin/env bash
# 2021-07-08 WATERMARK, DO NOT REMOVE - This script was generated from the Kurtosis Bash script template

set -euo pipefail   # Bash "strict mode"
script_dirpath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"



# ==================================================================================================
#                                             Constants
# ==================================================================================================
IMAGE_ORG_AND_REPO="kurtosistech/near-indexer-for-explorer"


# ==================================================================================================
#                                             Main Logic
# ==================================================================================================
if ! commit_hash="$(git rev-parse --short HEAD)"; then
    echo "Error: Couldn't get the current commit hash" >&2
    exit 1
fi

docker_image_name="${IMAGE_ORG_AND_REPO}:${commit_hash}"
if ! docker build -f Dockerfile -t "${docker_image_name}" .; then
    echo "Error: An error occurred building Docker image '${docker_image_name}'" >&2
    exit 1
fi

echo "Successfully built Docker image '${docker_image_name}'"

