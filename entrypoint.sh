#!/bin/bash

# Start the Xvfb virtual display
Xvfb :1 -screen 0 1024x768x16 &

# Export the DISPLAY variable
export DISPLAY=:1

# Start the VNC server
x11vnc -forever -usepw -create &

# Run the Topaz Video AI application
/opt/TopazVideoAIBETA/bin/ffmpeg
