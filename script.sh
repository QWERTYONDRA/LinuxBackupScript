#!/bin/bash

#Enter folder name here
foldername="moje-slozka"

if [ ! -d "$foldername" ]; then
  mkdir "$foldername"
  if [ $? -ne 0 ]; then
    if [ -w "$(dirname "$foldername")" ]; then
      echo "Error creating folder: no permission to create folder within $(dirname "$foldername")"
      exit 4
    else
      echo "Error creating folder: no permission to create folder"
      exit 1
    fi
  fi
  echo "Folder created: $foldername"
fi

date=$(date +%Y-%m-%d)

tar_filename="${foldername}_backup_${date}.tar.gz"
tar -czf "$tar_filename" "$foldername"

if [ $? -eq 0 ]; then
  echo "Folder compression successful!"
else
  echo "Folder compression failed."
  exit 2
fi

#rm -r "$foldername"

#if [ $? -eq 0 ]; then
#  echo "Folder removed successfully."
#else
#  if [ -w "$(dirname "$foldername")" ]; then
#    echo "Error removing folder: no permission to remove folder within $(dirname "$foldername")"
#    exit 5
#  else
#    echo "Error removing folder: no permission to remove folder"
#    exit 3
#  fi
#fi