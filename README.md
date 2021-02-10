# FabLab-OctoPi
Octopi setup and configuration
*note - this configuration was for a RPi 3B. RPi 4s may require additional configuration.

## Required Hardware
Raspberry Pi 4 4GB
https://www.digikey.com/en/products/detail/raspberry-pi/RASPBERRY-PI-4B-4GB/10258781
~16GB Micro SD Card
RPi Case (or similar)
5v/2A micro USB (Prusa power supply not recommended)
Ethernet cable

## Basic Setup
### Download OctoPi
Download OctoPi from https://octoprint.org/download/

### Flash image to SD card using an etcher
Flash the image from something like [Balena etcher](https://www.balena.io/etcher/)

## Preparing RPi
Connect keyboard, monitor, power, ethernet
Login: pi, raspberry
`Sudo apt-get update`
`Sudo raspi-config`
Enable ssh
*strongly recommended to change the default password*

### Get the RPi's IP
`ifconfig` *or* `hostname -I` (capitalization is important)

Record this IP

## Connect to the RPi
Connect ethernet, power
SSH to the IP you found using port 22
login : pi, raspberry (or changed password)

[More security considerations](https://www.raspberrypi.org/documentation/configuration/security.md)

## Increasing swapfile (Important!)
Installing addons will eat up your swap memory, so allocate more
`sudo nano /etc/dphys-swapfile`

`CONF_SWAPSIZE=1024`

`sudo /etc/init.d/dphys-swapfile stop`

`sudo /etc/init.d/dphys-swapfile start`

This may degrade SD card lifetime, but not doing this slows the Pi down to a nearly unusable speed

## [ClamAV](https://dennissutantoblog.wordpress.com/2020/04/17/how-to-setup-clamav-antivirus-on-your-raspberry-pi/)
`Sudo apt install clamav`

Follow instructions for “Setting up for automatic scanning”

running/updating clamav will show an error in the logs for clamd.conf, so run

`sudo apt-get install clamav-daemon`
  
The daemon uses multiple cores to run virus scans, where clamscan uses one.


## [Firewall](https://help.ubuntu.com/community/UFW)
[Configuration guide](https://www.linode.com/docs/guides/configure-firewall-with-ufw/)

`sudo apt-get install ufw`

`sudo ufw logging high`

`sudo ufw allow 80/tcp`

`sudo ufw allow ssh`

`sudo ufw enable`

`sudo ufw status verbose`


## [SMTP](https://iotdesignpro.com/projects/sending-smtp-email-using-raspberry-pi)

`sudo apt-get install ssmtp`

Configure file at /etc/ssmtp/ssmtp.conf with email info


##Prusa MK3S Configuration

![alt text](https://github.com/BenMagana/FabLab-OctoPi/blob/main/img/Mk3S_Config.png?raw=true)
