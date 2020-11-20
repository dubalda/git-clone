#!/bin/bash

set -euo pipefail

BRANCH=${GIT_BRANCH:-master}
OUTPUT_DIR=${GIT_BRANCH:-/git}

if [ -z "${GIT_REPO_URL}" ]; then
  echo "Need to set \$GIT_REPO_URL"
  exit
fi

if [ ! -d "${OUTPUT_DIR}" ]; then
  echo "No output directory mounted at ${OUTPUT_DIR}"
  exit 1
fi

if [ -z "${GIT_USERNAME}" ]; then
 echo "Need to set \$GIT_USERNAME"
  exit 1
fi
if [ -z "${GIT_PASSWORD}" ]; then
  echo "Need to set \$GIT_PASSWORD"
  exit 1
fi

git config --global credential.${GIT_REPO_URL}.username ${GIT_USERNAME}
git config --global core.askpass $(echo "${GIT_PASSWORD}")

cd ${OUTPUT_DIR}

echo "$(date '+%Y.%m.%d_%H.%M.%S') Clone branch ${BRANCH} from ${GIT_REPO_URL} to ${OUTPUT_DIR}"

git clone --quiet -b ${BRANCH} --depth 1 $GIT_REPO_URL}
