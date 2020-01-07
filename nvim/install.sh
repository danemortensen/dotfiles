#!/bin/bash

SOURCE_FILE=init.vim
TARGET_FILE=~/.config/nvim/init.vim

if [ ! -f "$SOURCE_FILE" ]; then
    echo "$SOURCE_FILE does not exist... exiting"
    exit 1
fi

if [ -e "$TARGET_FILE" ]; then
    echo "$TARGET_FILE already exists... please remove first"
    exit 1
else
    echo "linking $SOURCE_FILE to $TARGET_FILE..."
    ln -s "$SOURCE_FILE" "$TARGET_FILE"
    chmod 644 "$TARGET_FILE"
fi
