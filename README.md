# 🧢 RPi HDMI to NDI Streamer [Streamer-Certified™]

![Streamer Certified](https://img.shields.io/badge/NDI-ready-brightgreen?style=flat-square)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)

> Turn your Raspberry Pi into a plug-and-play NDI encoder using HDMI capture + ffmpeg + v4l2loopback + v4l2ndi.  
> Auto-starts on boot. <2s latency. Zero nonsense. All signal. 🎥📡

## 👉Tested on
	- RPi 3B 
	- PremiumCord HDMI capture/grabber


## ✅ Features
- 1280x720 @ 25fps (configurable)
- Low-latency (<1s)
- Auto-start on boot
- NDI stream appears in vMix, OBS, etc.

## 🚀 Setup

### 1. Clone this repo to your Pi

```bash
git clone https://github.com/YOURUSERNAME/rpi-ndi-streamer.git
cd rpi-ndi-streamer
chmod +x start-ndi.sh
```

### 2. Customize your configuration

- [ ] Make sure your grabber is detected:
```bash
v4l2-ctl --list-devices
```
- [ ] You should see `/dev/video0` or similar. Edit in `ndi-config.env` if necessary.

- [ ] **Edit** `ndi-config.env` to match your resolution, FPS, etc. Don't be shy to scale up if you have powerful RPi. 

### 3. Install v4l2loopback + v4l2ndi + ffmpeg

```bash
sudo apt install v4l2loopback-utils ffmpeg
```

### 4. Enable the systemd service

```bash
sudo cp ndi-grabber.service /etc/systemd/system/
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable ndi-grabber.service
sudo systemctl start ndi-grabber.service
```

## 🧢 Credits

Built with love by a Raspberry Pi, HDMI stick, ChatGPT and one very persistent command-line warriror. Streamer-certified™.
