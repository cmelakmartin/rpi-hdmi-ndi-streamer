# 🧢 RPi HDMI to NDI Streamer [Streamer-Certified™]

![NDI Ready](https://img.shields.io/badge/NDI-ready-brightgreen?style=flat-square)
![Works with vMix](https://img.shields.io/badge/vMix-compatible-blue?style=flat-square)
![Works with OBS](https://img.shields.io/badge/OBS-compatible-success?style=flat-square)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)

> Turn your Raspberry Pi into a plug-and-play NDI encoder using HDMI capture + ffmpeg + v4l2loopback + v4l2ndi.  
> Auto-starts on boot. <2s latency. Zero nonsense. All signal. 🎥📡

## 👉Tested on
	- RPi 3B, RPi 4B
	- PremiumCord HDMI capture/grabber


## ✅ Features
- 1280x720 @ 25fps (configurable, RPi 4 1920x1080 easily)
- Low-latency (RPi 3B <2s, RPi 4B <1s)
- Auto-start on boot
- NDI stream appears in vMix, OBS, etc.

## 🚀 Setup

### 1. Clone this repo to your Pi

```bash
git clone https://github.com/cmelakmartin/rpi-hdmi-ndi-streamer.git
cd rpi-hdmi-ndi-streamer
chmod +x start-ndi.sh
cd ~
git clone https://github.com/lplassman/V4L2-to-NDI.git
cd V4L2-to-NDI
sudo bash ./easy-install-rpi-aarch64.sh
```

### 2. Customize your configuration

- [ ] Connect the grabber and make sure it is detected:
```bash
v4l2-ctl --list-devices
```
- [ ] You should see `/dev/video0` or similar. Edit in `ndi-config.env` if necessary.

- [ ] **Edit** `ndi-config.env` to match your resolution, FPS, etc. Don't be shy to scale up if you have powerful RPi. 

### 3. Install v4l2loopback + v4l2ndi + ffmpeg

```bash
sudo apt-get update
sudo apt install v4l2loopback-utils ffmpeg
```

### 4. Enable the systemd service

```bash
mkdir -p ~/.config/systemd/user
cp ndi-grabber.service ~/.config/systemd/user/
systemctl --user daemon-reload
systemctl --user enable ndi-grabber.service
systemctl --user start ndi-grabber.service
```

## 🧢 Credits

Built with love by a Raspberry Pi, HDMI stick, ChatGPT and one very persistent command-line warrior. Streamer-certified™.
