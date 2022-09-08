#!/bin/bash

# Simple shell script to activate waybar theme.

if [[ ! -d "$1" ]]
then
  echo "Invalid theme '$1'"
  exit
fi

echo "Activating theme '$1'"

if [[ -f "config" ]]
then
  echo "Removing existing symbolic link for config"
  rm "config"
fi

if [[ -f "style.css" ]]
then
  echo "Removing existing symbolic link for style.css ..."
  rm "style.css"
fi

echo "Creating symbolic links ..."
ln -s "$1/style.css" "style.css"
ln -s "$1/config" "config"

echo "Reloading sway ..."
swaymsg reload
