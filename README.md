MI0283QT2-pi-fb
===============

Raspberry Pi userspace framebuffer driver for MI0283QT display

Based on dgallot's MI0283QT2-pi library. 
See instructions how the display can be connected from dgallot here: http://www.gallot.be/?p=197

This is a userspace framebuffer driver based on dgallot's library. It runs X well, a little slow but quite usable.
The driver is made as a normal userspace process, that scans the original ARM framebuffer for changes and transmits them to the SPI attached display. It takes about 10-15% CPU idling though if no pixels changed.

It compiles with same settings as the original demo sources. The program must be run with sudo.

X must be run at 320×240 resolution to make it work. This can be done by putting the 10-monitors.conf into /usr/share/X11/xorg.conf.d . 

Installation
============
Build and install wiringPi from https://github.com/WiringPi/WiringPi . That will provide the 'gpio' command used to switch the background lighting.

Build this driver: ./make.sh

Install X settings: sudo cp 10-monitors.conf /usr/share/X11/xorg.conf.d

Start the driver and X: ./start.sh

The display should light up and should display the X desktop after some seconds

To stop the driver, run ./stop.sh.

Issues
======
If it don't work, try to get dgallot's original repository demos running first. See instructions here: http://www.gallot.be/?p=197

Switiching the virtual terminals with Ctrl+Alt+F1..F7 leads to display corruption and crashes, as the consoles run in incompatible resolutions if not configured to match the display resolution of 320x240.

For the same reason, the driver should not be run before the X server is up, so there is a sleep in start.sh. If your X takes longer to start, that need to be adjusted. Maybe the fb driver could be run from the X session instead, but that would not be needed any longer if the crash gets fixed. The driver could than be run at any time. 

![framebuffer display](http://42loop.de:8888/garage/uploads/233/raspberrypi_lcd.JPG)