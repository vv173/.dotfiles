#!/bin/bash

source_dir="/home/vv173/MEGA/PassBackup/"
destination_dir="/home/vv173/.keepass"

/usr/bin/rsync -av "$source_dir" "$destination_dir"
