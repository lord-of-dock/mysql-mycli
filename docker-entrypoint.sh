#!/bin/bash
[[ -n "${DEBUG:-}" ]] && set -x
set -eu -o pipefail

declare -a MYCLI_OPTS=()

if [[ -n "${MYCLI_MYSQL_ROOT_PASSWORD:-}" ]]; then
    MYCLI_MYSQL_USER=root
    MYCLI_MYSQL_PASSWORD="$MYCLI_MYSQL_ROOT_PASSWORD"
fi

[[ -n "${MYCLI_MYSQL_HOST:-}" ]] && MYCLI_OPTS+=(--host "$MYCLI_MYSQL_HOST")
[[ -n "${MYCLI_MYSQL_USER:-}" ]] && MYCLI_OPTS+=(--user "$MYCLI_MYSQL_USER")
[[ -n "${MYCLI_MYSQL_PASSWORD:-}" ]] && MYCLI_OPTS+=(--password "$MYCLI_MYSQL_PASSWORD")
[[ -n "${MYCLI_MYSQL_DATABASE:-}" ]] && MYCLI_OPTS+=("$MYCLI_MYSQL_DATABASE")

if [[ -x "$1" ]]; then
    exec "$@"
else
    [[ "${1:-}" = "mycli" ]] && shift
    [[ 0 -lt "$#" ]] && MYCLI_OPTS+=("$@")
    [[ 0 -eq "${#MYCLI_OPTS[@]}" ]] && MYCLI_OPTS=(--help)
    exec /usr/local/bin/mycli "${MYCLI_OPTS[@]}"
fi