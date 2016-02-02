#!/usr/bin/env bash
# Runs Emacs.app in "no window" mode. Place in PATH ahead of the emacs
# installed by Apple in /usr/bin.

/Applications/Emacs.app/Contents/MacOS/Emacs -nw "$@"
