#!/bin/bash

# === CONFIG ===
source "$(dirname "$0")/ndi-config.env"

# === LOAD LOOPBACK ===
sudo modprobe -r v4l2loopback 2>/dev/null
sudo modprobe v4l2loopback video_nr=30 card_label="VirtualNDI" width=$WIDTH height=$HEIGHT pixfmt=YUYV exclusive_caps=0 sustain_framerate=1

sleep 1

# === START FFMPEG ===
ffmpeg -fflags nobuffer -thread_queue_size $THREAD_QUEUE_SIZE -avoid_negative_ts make_zero \
-f v4l2 -input_format mjpeg -video_size ${WIDTH}x${HEIGHT} -framerate $FPS \
-i $DEVICE_IN -pix_fmt yuyv422 -vcodec rawvideo \
-f v4l2 $DEVICE_OUT &

FFMPEG_PID=$!

# === WAIT FOR /dev/video30 BUFFER TO BE READY ===
echo "Waiting for valid frame buffer on $DEVICE_OUT..."
for i in {1..10}; do
  BUFSIZE=$(v4l2-ctl --get-fmt-video -d $DEVICE_OUT 2>/dev/null | grep "Size Image" | awk '{print $4}')
  if [ "$BUFSIZE" -gt 0 ]; then
    echo "Detected buffer size: $BUFSIZE"
    break
  fi
  sleep 1
done

# === START NDI ===
v4l2ndi -d $DEVICE_OUT -f -x $WIDTH -y $HEIGHT -n 30 -e 1 --threaded -v "$NDI_NAME"
