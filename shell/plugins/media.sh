#!/usr/bin/env sh

if hash ffmpeg 2>/dev/null; then
    function stripAudio {
        ffmpeg -i $1 -an -vcodec copy $2
    }
fi

if hash mkvmerge 2>/dev/null; then
    function mergemkvass {
        for f in *.mkv; do mkvmerge -o "./muxed/$f" "$f" "${f%.mkv}.ass"; done
    }
fi

if hash youtube-dl 2>/dev/null; then
    function youtubeMp3 {
        youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 "$1"
    }
fi
