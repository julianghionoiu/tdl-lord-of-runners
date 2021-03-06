#!/usr/bin/env bash

SCRIPT_CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

JAVA_BIN="${SCRIPT_CURRENT_DIR}/jre/bin/java"
JAR_FILE="${SCRIPT_CURRENT_DIR}/record/bin/record-and-upload.jar"
PARAM_CONFIG_FILE="${SCRIPT_CURRENT_DIR}/config/credentials.config"
PARAM_STORE_DIR="${SCRIPT_CURRENT_DIR}/record/localstore"
PARAM_SOURCECODE_DIR="${SCRIPT_CURRENT_DIR}"

# For MacOS newer than 11.0.0  - allow the terminal to run the Java runtime
xattr -rd com.apple.quarantine "${SCRIPT_CURRENT_DIR}" >/dev/null 2>&1 || true

echo "Running using packaged JRE:"
set -ex
exec "$JAVA_BIN"                    \
  -Dlogback.enableJansi="true"      \
  -jar "$JAR_FILE"                  \
  "--config" "${PARAM_CONFIG_FILE}" \
  "--store" "${PARAM_STORE_DIR}"    \
  "--sourcecode" "${PARAM_SOURCECODE_DIR}" "$@"
