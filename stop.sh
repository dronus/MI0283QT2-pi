#!/bin/sh

# disable lcd background lighting
gpio -g pwm 18 0 


# stop framebuffer driver and X

sudo killall fb
killall startx
 
