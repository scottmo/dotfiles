#!/usr/bin/env bash

if hash ffmpeg 2>/dev/null; then
    stripAudio() {
        ffmpeg -i $1 -an -vcodec copy $2
    }
fi

if hash mkvmerge 2>/dev/null; then
    # merge mkv and ass
    mergemkvass() {
        for f in *.mkv; do mkvmerge -o "./muxed/$f" "$f" "${f%.mkv}.ass"; done
    }
fi

if hash youtube-dl 2>/dev/null; then
    alias youtubeMp3='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0'
fi
