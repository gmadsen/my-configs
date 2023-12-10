## configs and minor setup scripts

## Cmds
"list BIOS System Information"
sudo dmidecode  | grep -A3 '^System Information'

## Notes
https://wiki.archlinux.org/title/Dell_XPS_13_(9370)
- turn color on for etc/pacman.conf
- add a script check for not including sudo on cmds that should have it
- i really should have looked up my hardware first thing, as many arch docs pointed out

# ISSUES 
### brightness controls on XPS 13
'sudo vim etc/default/grub' 
replace   GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"  
with      GRUB_CMDLINE_LINUS_DEFAULT=quiet splash acpi_backlight=vendor"
sudo grub-update

- I didn't have all the xorg tools, which includes xbacklight...
sudo pacman -S xorg-apps xorg

Every step required for xbacklight control

Follow these steps:

    $ sudo nano /etc/default/grub and replace the corresponding line with GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_backlight=vendor"
    $ sudo update-grub
    No joking, make sure that the appropriate drivers are actually installed: $ sudo apt install xbacklight xorg xserver-xorg-video-intel
    Issuing $ find /sys -type f -name brightness should yield something like /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-eDP-1/intel_backlight/brightness 
    $ cd /sys/class This directory should contain a soft link called brightness to the brightness device discovered in the previous step. Should it be missing, create it: $ sudo ln -s /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-eDP-1/intel_backlight/brightness /sys/class/brightness
    $ sudo nano /etc/X11/xorg.conf should read:

Section "Device"
    Identifier      "Device0"
    Driver          "intel"
    Option          "Backlight"      "intel_backlight"
EndSection

Section "Monitor"
    Identifier      "Monitor0"
EndSection

Section "Screen"
    Identifier      "Screen0"
    Monitor         "Monitor0"
    Device          "Device0"
EndSection

    The assignment of the physical XF86MonBrightnessDown and XF86MonBrightnessUp keys is explained here for Xubuntu LTS or XFCE users.
    Finally, reboot for these changes to take effect.



## Neovim
- install before copying config
- first time launching couldn't find catppuccin

## order of things
- pacman installs
- rustup curl
- python3?
- need to fig when neovim

- fish mods
- npm
