#!/bin/sh

ffmpeg -y -i "2018-04-10_23-45-50.mp4" \
-filter_complex \
"[0:a]atrim=3.2:4.3,asetpts=PTS-STARTPTS[a]; \
[0:a]atrim=3.3:3.6,asetpts=PTS-STARTPTS[b]; \
[a][b] concat=n=2:v=0:a=1 [out]" \
-vn -acodec libmp3lame -ab 128k \
-map "[out]" querendo.mp3
