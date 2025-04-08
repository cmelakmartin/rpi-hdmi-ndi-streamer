# RPi HDMI to NDI Grabber 🎥📡
![Streamer Certified](https://img.shields.io/badge/NDI-ready-brightgreen?style=flat-square)
> Hardware HDMI → NDI encoder on Raspberry Pi with <2s latency.

Turn your Raspberry Pi into a low-latency NDI encoder using:

- HDMI capture stick
- v4l2loopback
- ffmpeg
- v4l2ndi

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
- [ ] You should see `/dev/video0` or similar.

- [ ] Edit `ndi-config.env` to match your resolution, FPS, etc. Don't be shy to scale up if you have powerful RPi. 

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
