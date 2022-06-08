#!/bin/bash

source "`ueberzug library`"

COVER="/home/khosraw/Music/songs/"

function add_cover {
  ImageLayer::add [identifier]="img" [x]="2" [y]="1" [path]="$COVER"
}

ImageLayer 0< <(
if [ ! -f "$COVER" ]; then
  cp "$HOME/.ncmpcpp/default_cover.png" "$COVER"
fi
#rerender image when changed
while inotifywait -q -q -e close_write "$COVER"; do
  add_cover
done
)