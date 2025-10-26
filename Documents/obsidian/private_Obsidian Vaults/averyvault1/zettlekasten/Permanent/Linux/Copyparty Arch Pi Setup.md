https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-3
https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-4

you need dosfstools

install arch on pi

login as root

usermod -l avery alarm
usermod -d /home/avery -m avery
passwd avery
  password
passwd root
  password

usermod -aG wheel avery

pacman -Syu

pacman -S sudo
EDITOR=nano visudo

avery  ALL(ALL:ALL) ALL

sudo nano /etc/hostname

install copyparty + cfssl + python-argon2-cffi + python-pillow + ffmpeg +  on pi



use this for config:
[global]
  p: 3923
  e2dsa
  e2ts
  qr
  usernames
  ah-alg: argon2

[accounts]
  avery: +VlLe2u8rb6eNuAlCuuYcjBPJCnOIVuiA
  freak: +XsJKAxQ7SLDDpDF5gpD6ppqS1i6Gehdg

[/pictures/]
  /home/avery/Pictures/pictures/
  accs:
    A: avery
    r: freak

[/group/]
  /home/avery/Downloads/group/
  accs:
    A: avery
    rwmd.: freak



copyparty -c ~/Documents/copyparty.conf

port forward your damn

set the system daemon to run as root

https://www.dwarmstrong.org/zram-swap/