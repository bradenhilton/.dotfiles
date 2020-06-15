#!/usr/bin/env bash
#
# prewal - pre-cache pywal schemes for all image files in a given directory
#
# requires: pywal

set -o errexit
set -o nounset

readonly NAME=$(basename "$0")
readonly VER='2.0'
readonly ARGS=("$@")

usage() {
  cat <<- EOF
  ${NAME} v${VER}

  Pre-cache pywal schemes for all image files in a given directory.

  USAGE: ${NAME} [OPTIONS] "dir"

  OPTIONS:
      -v, --version           show the script version number and exit
      -a, --alpha             alpha value to use (only effects urxvt)
      -h, --help              show this message and exit

  EXAMPLES:
      Pre-cache all image files in the Pictures directory:
      ${NAME} "~/Pictures"

      Pre-cache all image files in the Downloads folder with 70% opacity
      ${NAME} -a 70 "~/Pictures"
EOF
  exit 0
}

version() {
  echo "${NAME} version ${VER}"
  exit 0
}

cache_schemes() {
  local dir="$1"

  shopt -s nullglob
  shopt -s nocaseglob

  for image in "$WALLPAPERSDIR"/*.{jpg,jpeg,png}
  do
      echo "creating scheme for $(basename "$image")"
      wal -n -s -q -t -e -i "$image"
  done

  shopt -u nocaseglob
  shopt -u nullglob

  echo "done"
  exit 0
}

parse_args() {
  if [[ ! "${#ARGS[]}" -eq 1 ]]; then
    usage
  fi

  case "${ARGS[0]}" in
    -v|--version)
      version
      ;;
    -h|--help)
      usage
      ;;
    *)
      usage
      ;;
  esac
}

main() {
  parse_args
}
main
