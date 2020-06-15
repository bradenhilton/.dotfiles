#!/usr/bin/env bash
#
# notify - sends a notification to dunst on song change using dunstify
#
# requires: nmcpcpp, ffmpeg, dunstify

set -o errexit
set -o nounset

readonly MUSIC_DIR="$HOME/Music"
readonly TMP="/tmp"

get_album_art() {
  readonly song="${MUSIC_DIR}/$1/$2"

  ffmpeg -loglevel quiet -i "${song}" -codec copy "${TMP}/cover.jpg" -y
}

send_notification() {
  dunstify -r 109 -a "ncmpcpp" -i "${TMP}/cover.jpg" "$1" "$2 - $3"
}

main() {
  # get info for current song
  local song_info
  song_info=$(ncmpcpp --current-song "%t|%a|%b|%D|%f")
  readonly song_info

  # parse song info
  local title artist album album_dir file_name
  IFS="|" read -r title artist album album_dir file_name <<< "${song_info}"
  readonly title artist album album_dir file_name

  get_album_art "${album_dir}" "${file_name}"
  send_notification "${title}" "${artist}" "${album}"

  exit 0
}
main
