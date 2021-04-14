#!/bin/bash
[ -z $KATACODA_DIR ] && echo "You must set the KATACODA_DIR environment variable." && exit 1

[ $# == 0 ] && echo "Usage: pubkat [source path] [optional commit message]" && exit 1

[ "$1" == "" ] && echo "No source path provided." && exit 1

# Expand relative paths, if any
SOURCE=$(cd "$1" && pwd)

[ ! -d "$SOURCE" ] && echo "Can't find source path." && exit 1

START=$PWD
MSG=${2:-"Another commit"}
DEST="$KATACODA_DIR/$(basename $SOURCE)"

[ ! -d "$DEST" ] && echo "Can't find destination path. Please create $DEST and try again." && exit 1

echo "Pushing $1 to katacoda..."
rm -rf $DEST/*
cp -r $SOURCE/* $DEST/

cd $DEST
git add .
git commit -m "$MSG"
git push origin master
cd $START
