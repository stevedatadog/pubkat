#!/bin/bash
[ -z $KATACODA_DIR ] && echo "You must set the KATACODA_DIR environment variable." && exit 1

[ $# == 0 ] && echo "Usage: pubkat [source path] [optional commit message]" && exit 1

[ "$1" == "" ] && echo "No source path provided." && exit 1

# Expand relative paths, if any
SOURCE=$(cd "$1" && pwd)

if grep -q $KATACODA_DIR <<< $SOURCE; then
  echo "Not intended for use in your Katacoda scenario directory." && exit 1
fi

[ ! -d "$SOURCE" ] && echo "Can't find source path." && exit 1

START=$PWD
EMOJIS=(😺 😸 😹 😻 😼 😽 🙀 😿 😾)
EMOJI=${EMOJIS[$RANDOM % ${#EMOJIS[@]}]};
MSG=${2:-"$EMOJI"}
DEST="$KATACODA_DIR/$(basename $SOURCE)"

[ ! -d "$DEST" ] && echo "Can't find destination path. Please create $DEST and try again." && exit 1

echo "Pushing $1 to katacoda..."
rm -rf $DEST/*
cp -r $SOURCE/* $DEST/

cd $DEST
git add .
git commit -m "$MSG"
git push origin main
cd $START
