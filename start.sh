#!/bin/sh

# enable lcd background lighting
gpio -g mode 18 pwm 
gpio -g mode 18 pwm 
gpio -g pwm 18 1023

# load spi device drivers
sudo modprobe spidev bufsiz=256000
sudo modprobe spi-bcm2708 

# in case something is already running

sudo killall fb
killall startx

# start framebuffer driver and X 
startx &
sleep 10
sudo ./fb &
 
