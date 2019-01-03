#!/usr/bin/env bash

set -xe

SCRIPT_CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RUN_TEMP_DIR="${SCRIPT_CURRENT_DIR}/run_tmp"
rm -Rf "${RUN_TEMP_DIR}"
mkdir -p "${RUN_TEMP_DIR}"

# Read input
if [ $# -ne 2 ]; then
  echo "Syntax is: $0 language platform"
  exit 1
fi
TARGET_LANGUAGE="$1"
TARGET_PLATFORM="$2"

# Extract
BUNDLE_ZIP="${SCRIPT_CURRENT_DIR}/build/runner-for-${TARGET_LANGUAGE}-${TARGET_PLATFORM}.zip"
unzip "${BUNDLE_ZIP}" -d "${RUN_TEMP_DIR}"

# Invoke JRE
"${RUN_TEMP_DIR}/accelerate_runner/record_screen_and_upload.sh" --run-self-test