#! /bin/bash

### basic instructions before the scrip starts:

### 1.) flash usb drive w/ arch
### 2.) go into bios and make usb boot the priority (and disable secure boot)
### 3.) boot into the iso
### 4.) setup wifi
###     - iwctl
###     - device list
###     - station <wifi device> scan
###     - station <wifi device> get-networks
###     - station <wifi device> connect <SSID>
###     - exit
###     - ping google.com
### 5.) then execute archinstall
### 6.) format drives with btrfs,
###     enable timeshift for btrfs snapshotting,
###     enable swap on zram,
###     get multilib,
###     get a minimal install,
###     enable audio (pipewire),
###     enable NewtorkManager,
###     get linux-zen,
###     get packages: ( chezmoi git sl wget ),
###     set timezone
###     and dont chroot
echo
echo "Hello! this is the install script of AveryOS"
echo
echo "(just a preconfigured arch install)"
echo "press enter to continue"
read
echo
echo "this isnt going to be a passive install so you have to stay here..."
echo "but lets do this!"
echo "starting in"
echo "5..."
sleep 1
echo "4..."
sleep 1
echo "3..."
sleep 1
echo "2..."
sleep 1
echo "1..."
sleep 1
echo "0..."
sleep 1


echo
echo "are we online?"
wget -q --tries=10 --timeout=20 --spider http://google.com
if [[ $? -eq 0 ]]; then
    echo "Online"
else
    echo "Offline... connect to the internet!!!"
    exit
fi


echo
echo "making personal home directories"
mkdir ~/Documents
mkdir ~/Downloads
mkdir ~/Pictures


echo
echo "installing yay... yay!"
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/


echo
echo "making sure chezmoi is installed"
yay -S chezmoi


echo
echo "initiating chezmoi"
mkdir ~/.local/share/chezmoi
cd ~/.local/share/chezmoi
chezmoi init --apply https://github.com/averydumbtre/dotfiles.git
###   first time setup:
### - - -
###   chezmoi init
###   chezmoi add ~/file
###   chezmoi cd
###   git add .
###   git commit -m "Initial commit"
###   git remote add origin https://averydumbtre:GITHUBDEVELCLASSICTOKEN@github.com/averydumbtre/dotfiles.git
###   git remote set-url origin https://averydumbtre:GITHUBDEVELCLASSICTOKEN@github.com/averydumbtre/dotfiles.git
###   git branch -M main
###   git push -u origin main


echo
echo "installing required packages"
cd ~/.local/share/chezmoi/
cat Packages/Required_Packages.txt | yay -S -


cd ~/.local/share/chezmoi/
echo
read -p "do you wish to install Common Utility packages? (yes you do)   [Y/n] " yn0
case $yn0 in
    y ) echo "do you want to edit the packagefile before it gets installed?";
        read -p "(it will be uneditied when the script ends)            [y/N] " yn1;
        case $yn1 in
            y ) cp Packages/CommonUtils_Packages.txt Packages/CommonUtils_Packages_TEMP.txt
                vim Packages/CommonUtils_Packages_TEMP.txt;
                cat Packages/CommonUtils_Packages_TEMP.txt | yay -S -;
                rm Packages/CommonUtils_Packages_TEMP.txt;;
            n ) cat Packages/CommonUtils_Packages.txt | yay -S -;;
            * ) cat Packages/CommonUtils_Packages.txt | yay -S -;;
        esac;;
    n ) echo "sure";;
    * ) cat Packages/CommonUtils_Packages.txt | yay -S -;;
esac


cd ~/.local/share/chezmoi/
echo
read -p "do you wish to install Optional Utility packages? (less common apps and stuffs)   [Y/n] " yn0
case $yn0 in
    y ) echo "do you want to edit the packagefile before it gets installed? (yes you do)";
        read -p "(it will be uneditied when the script ends)            [y/N] " yn1;
        case $yn1 in
            y ) cp Packages/OptionalUtils_Packages.txt Packages/OptionalUtils_Packages_TEMP.txt
                vim Packages/OptionalUtils_Packages_TEMP.txt;
                cat Packages/OptionalUtils_Packages_TEMP.txt | yay -S -;
                rm Packages/OptionalUtils_Packages_TEMP.txt;;
            n ) cat Packages/OptionalUtils_Packages.txt | yay -S -;;
            * ) cat Packages/OptionalUtils_Packages.txt | yay -S -;;
        esac;;
    n ) echo "sure";;
    * ) cat Packages/OptionalnUtils_Packages.txt | yay -S -;;
esac


cd ~/.local/share/chezmoi/
echo
read -p "do you wish to install Goofy packages? (:3)                    [Y/n] " yn0
case $yn0 in
    y ) echo "do you want to edit the packagefile before it gets installed?";
        read -p "(it will be uneditied when the script ends)            [y/N] " yn1;
        case $yn1 in
            y ) cp Packages/Goofy_Packages.txt Packages/Goofy_Packages_TEMP.txt
                vim Packages/Goofy_Packages_TEMP.txt;
                cat Packages/Goofy_Packages_TEMP.txt | yay -S -;
                rm Packages/Goofy_Packages_TEMP.txt;;
            n ) cat Packages/Goofy_Packages.txt | yay -S -;;
            * ) cat Packages/Goofy_Packages.txt | yay -S -;;
        esac;;
    n ) echo "sure";;
    * ) cat Packages/Goofy_Packages.txt | yay -S -;;
esac


cd ~/.local/share/chezmoi/
echo
read -p "do you wish to install Nvidia Drivers? (even if you already installed them this is a good idea)  [Y/n] " yn0
case $yn0 in
    y ) echo "do you want to edit the packagefile before it gets installed?";
        read -p "(it will be uneditied when the script ends)            [y/N] " yn1;
        case $yn1 in
            y ) cp Packages/NvidiaDriver_Packages.txt Packages/NvidiaDriver_Packages_TEMP.txt
                vim Packages/NvidiaDriver_Packages_TEMP.txt;
                cat Packages/NvidiaDriver_Packages_TEMP.txt | yay -S -;
                rm Packages/NvidiaDriver_Packages_TEMP.txt;;
            n ) cat Packages/NvidiaDriver_Packages.txt | yay -S -;;
            * ) cat Packages/NvidiaDriver_Packages.txt | yay -S -;;
        esac;;
    n ) echo "sure";;
    * ) cat Packages/NvidiaDriver_Packages.txt | yay -S -;;
esac


cd ~/.local/share/chezmoi/
echo
read -p "do you wish to install Intel Drivers? (even if you already installed them this is a good idea)  [Y/n] " yn0
case $yn0 in
    y ) echo "do you want to edit the packagefile before it gets installed?";
        read -p "(it will be uneditied when the script ends)            [y/N] " yn1;
        case $yn1 in
            y ) cp Packages/IntelDriver_Packages.txt Packages/IntelDriver_Packages_TEMP.txt
                vim Packages/IntelDriver_Packages_TEMP.txt;
                cat Packages/IntelDriver_Packages_TEMP.txt | yay -S -;
                rm Packages/IntelDriver_Packages_TEMP.txt;;
            n ) cat Packages/IntelDriver_Packages.txt | yay -S -;;
            * ) cat Packages/IntelDriver_Packages.txt | yay -S -;;
        esac;;
    n ) echo "sure";;
    * ) cat Packages/IntelDriver_Packages.txt | yay -S -;;
esac


cd ~/.local/share/chezmoi/
echo
read -p "do you wish to install Obscure Bloatware? (large packages i couldnt in good consciece add to common utils)  [Y/n] " yn0
case $yn0 in
    y ) echo "do you want to edit the packagefile before it gets installed?   (jesus, yes you do)";
        read -p "(it will be uneditied when the script ends)            [y/N] " yn1;
        case $yn1 in
            y ) cp Packages/Bloat_Packages.txt Packages/Bloat_Packages_TEMP.txt
                vim Packages/Bloat_Packages_TEMP.txt;
                cat Packages/Bloat_Packages_TEMP.txt | yay -S -;
                rm Packages/Bloat_Packages_TEMP.txt;;
            n ) cat Packages/Bloat_Packages.txt | yay -S -;;
            * ) cat Packages/Bloat_Packages.txt | yay -S -;;
        esac;;
    n ) echo "sure";;
    * ) cat Packages/Bloat_Packages.txt | yay -S -;;
esac


echo
echo "which Display manager do you want to install?"
echo "options are:"
echo
echo "* None"
echo "* Hyprland"
read -p "> " DispOpt
case $DispOpt in
    None ) echo "cool, i respect it";
           display="none";;
    none ) echo "cool, i respect it";
           display="none";;
    Hyprland ) cat Packages/Hyprland_Packages.txt | yay -S -;
               echo;
               read -p "are you on a pc or laptop?  (pc/lap) " pclap;
               case $pclap in
                    pc ) rm ~/.config/hypr/hyprland.conf
                         echo -e "##source = /home/avery/.config/hypr/hyprLAPTOP.conf \nsource = /home/avery/.config/hypr/hyprPC.conf \nsource = /home/avery/.config/hypr/hyprGENERAL.conf" >> ~/.config/hypr/hyprland.conf;;
                    Pc ) rm ~/.config/hypr/hyprland.conf
                         echo -e "##source = /home/avery/.config/hypr/hyprLAPTOP.conf \nsource = /home/avery/.config/hypr/hyprPC.conf \nsource = /home/avery/.config/hypr/hyprGENERAL.conf" >> ~/.config/hypr/hyprland.conf;;
                    lap ) rm ~/.config/hypr/hyprland.conf
                          echo -e "source = /home/avery/.config/hypr/hyprLAPTOP.conf \n##source = /home/avery/.config/hypr/hyprPC.conf \nsource = /home/avery/.config/hypr/hyprGENERAL.conf" >> ~/.config/hypr/hyprland.conf;;
                    Lap ) rm ~/.config/hypr/hyprland.conf
                          echo -e "source = /home/avery/.config/hypr/hyprLAPTOP.conf \n##source = /home/avery/.config/hypr/hyprPC.conf \nsource = /home/avery/.config/hypr/hyprGENERAL.conf" >> ~/.config/hypr/hyprland.conf;;
                    laptop ) rm ~/.config/hypr/hyprland.conf
                             echo -e "source = /home/avery/.config/hypr/hyprLAPTOP.conf \n##source = /home/avery/.config/hypr/hyprPC.conf \nsource = /home/avery/.config/hypr/hyprGENERAL.conf" >> ~/.config/hypr/hyprland.conf;;
                    Laptop ) rm ~/.config/hypr/hyprland.conf
                             echo -e "source = /home/avery/.config/hypr/hyprLAPTOP.conf \n##source = /home/avery/.config/hypr/hyprPC.conf \nsource = /home/avery/.config/hypr/hyprGENERAL.conf" >> ~/.config/hypr/hyprland.conf;;
               esac;
               display="hyprland";;
    hyprland ) cat Packages/Hyprland_Packages.txt | yay -S -;
               echo;
               read -p "are you on a pc or laptop?  (pc/lap) " pclap;
               case $pclap in
                    pc ) rm ~/.config/hypr/hyprland.conf
                         echo -e "##source = /home/avery/.config/hypr/hyprLAPTOP.conf \nsource = /home/avery/.config/hypr/hyprPC.conf \nsource = /home/avery/.config/hypr/hyprGENERAL.conf" >> ~/.config/hypr/hyprland.conf;;
                    Pc ) rm ~/.config/hypr/hyprland.conf
                         echo -e "##source = /home/avery/.config/hypr/hyprLAPTOP.conf \nsource = /home/avery/.config/hypr/hyprPC.conf \nsource = /home/avery/.config/hypr/hyprGENERAL.conf" >> ~/.config/hypr/hyprland.conf;;
                    lap ) rm ~/.config/hypr/hyprland.conf
                          echo -e "source = /home/avery/.config/hypr/hyprLAPTOP.conf \n##source = /home/avery/.config/hypr/hyprPC.conf \nsource = /home/avery/.config/hypr/hyprGENERAL.conf" >> ~/.config/hypr/hyprland.conf;;
                    Lap ) rm ~/.config/hypr/hyprland.conf
                          echo -e "source = /home/avery/.config/hypr/hyprLAPTOP.conf \n##source = /home/avery/.config/hypr/hyprPC.conf \nsource = /home/avery/.config/hypr/hyprGENERAL.conf" >> ~/.config/hypr/hyprland.conf;;
                    laptop ) rm ~/.config/hypr/hyprland.conf
                             echo -e "source = /home/avery/.config/hypr/hyprLAPTOP.conf \n##source = /home/avery/.config/hypr/hyprPC.conf \nsource = /home/avery/.config/hypr/hyprGENERAL.conf" >> ~/.config/hypr/hyprland.conf;;
                    Laptop ) rm ~/.config/hypr/hyprland.conf
                             echo -e "source = /home/avery/.config/hypr/hyprLAPTOP.conf \n##source = /home/avery/.config/hypr/hyprPC.conf \nsource = /home/avery/.config/hypr/hyprGENERAL.conf" >> ~/.config/hypr/hyprland.conf;;
               esac;
               display="hyprland";;
    * ) echo "uhhh... i gues no display manager?";
        display="none";;
esac


case $display in
    none ) echo;;
    hyprland ) hyprctl monitors
               echo "whats your monitor? (DP-1)"-
               read -p "> " monitor;
               echo "what do you want as your wallpaper? (~/Documents/wallpaper.png)";
               read -p "> " wallpaper;
               echo -e "\n wallpaper = $monitor, $wallpaper" >> ~/.config/hypr/hyprpaper.conf;;
esac


## commented out password getting code...
##echo
##echo "hey im sorry, i need your Root Password for something"
##echo "trust me here...   (editing files in /etc)"
##read -p "> " dskfjh
##read -p "again:> " fsdgkh
##if [ $dskfjh = $fsdgkh ]; then
##    echo "nice!"
##else
##    echo "you fucked upppp"
##    exit
##fi

sudo -i echo "bleh"
sudo -i rm /etc/ly/config.ini
sudo -i cp ~/.local/share/chezmoi/ly/config.ini /etc/ly/config.ini
sudo -i systemctl enable ly.service
sudo -i systemctl enable cronie
cd
touch mycron
echo -e '@reboot  sleep 15 && env DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/$(id -u) systemd-run --user --quiet
--collect ~/Documents/skripts/STARTUP.sh' >> mycron
crontab mycron
rm mycron
sudo -i chmod u+x ~/Documents/skripts/SHUTDOWN.sh
sudo -i chmod u+x ~/Documents/skripts/STARTUP.sh
chmod u+x ~/Documents/skripts/SHUTDOWN.sh
chmod u+x ~/Documents/skripts/STARTUP.sh
echo
read -p "whats your username? (avery) " username
sudo -i echo "bleh"
sudo -i echo -e "[Unit]\nDescription=Pushes dotfiles to github before shutdown\nDefaultDependencies=no\nAfter=network.target paths.target timers.target sockets.target\nRequires=network.target paths.target timers.target sockets.target\n\n[Service]\nType=oneshot\nUser=$username\nRemainAfterExit=true\nExecStop=/home/$username/Documents/skripts/SHUTDOWN.sh\nTimeoutStartSec=0\n\n[Install]\nWantedBy=network.target paths.target timers.target sockets.target" | sudo -i tee -a /etc/systemd/system/chezmoi-before-shutdown.service
sudo -i systemctl enable chezmoi-before-shutdown
sudo -i systemctl enable libvirtd
sudo -i systemctl enable sshd


##echo
##read -p "do you want to apply user customizations?  (yes you do)    [Y/n] " yn2
##case yn2 in
##    y ) echo "good idea, running chezmoi apply -v";
##        chezmoi apply -v;;
##    n ) echo "what are you doing";
##        read "you really should run   chezmoi apply -v   sometime then... press enter";;
##    * ) chezmoi apply -v;;
##esac


echo
read -p "do you want to pre-setup your music library?    (y/n)" mpd
case $mpd in
    y ) echo "alright, enter in the path to the directory with your music in it!"
        echo "something like this:  /path/to/directory/";
        read -p "> " mpdpath;
        sed -i "s\music_directory    .*\music_directory    $mpdpath\g" ~/.config/mpd/mpd.conf;
        echo ;
        read -p "would you like to setup your cronie (crontab) alarm?  (y/N) " cronyn;
        case $cronyn in
        y ) echo "okay, first gimmie the audio device you want it to play out of, something like  (alsa_output.pci-0000_01_00.1.hdmi-stereo)"
            echo "(dont worry you can change this later) (~/Documents/skripts/music_shuffle_INSTALLSCRIPT.sh)";
            echo "press enter to view audio devices";
            read;
            pw-cli list-objects | grep node.name | column;
            echo;
            read -p "audo device> " audiodevice;
            echo crontab -l > mycron;
            echo -e "#!/bin/bash \npipewire \nsleep 1 \npactl set-sink-volume @DEFAULT_SINK@ 100% \nmpv $mpdpath -shuffle --no-video --audio-device=pipewire/$audiodevice" >> ~/Documents/skripts/music_shuffle_INSTALLSCRIPT.sh;
            echo "1 6 * * 1-5 env DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/$(id -u) /home/avery/Documents/skripts/music_shuffle_INSTALLSCRIPT.sh \n20 8 * * 0,6 env DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/$(id -u) /home/avery/Documents/skripts/music_shuffle_INSTALLSCRIPT.sh" >> mycron;
            crontab mycron;
            rm mycron;;
        n ) echo;;
        * ) echo "not setting up crontab.";;
        esac;;
    n ) echo "okay, just dont forget to edit mpd.conf! (~/.config/mpd/mpd.conf)";;
    * ) echo "HEY DOOFUS GO MAKE AND EDIT ~/.config/mpd/mpd.conf IF YOU WANT MUSIC TO WORK";;
esac


echo
read -p "do you want to setup push access for chezmoi?  (yes you do)     (Y/n) " githb
case $githb in
    y ) echo "give me your Github Developer Classic Token"
        echo "it will be a long string of numbers with a prefix (ghp_1234etcaaaaaaaaaaaaaaaaaaaaaaaaaaaaa)";
        read -p "> " GITHUBDEVELCLASSICTOKEN;
        cd ~/.local/share/chezmoi/;
        git remote add origin https://averydumbtre:$GITHUBDEVELCLASSICTOKEN@github.com/averydumbtre/dotfiles.git;
        git remote set-url origin https://averydumbtre:$GITHUBDEVELCLASSICTOKEN@github.com/averydumbtre/dotfiles.git;
        git branch -M main;
        git pull origin main;;
    n ) echo "okay well heres how you do it"
        echo "--";
        echo "chezmoi cd";
        echo "git add .";
        echo "git commit -m 'Initial commit'";
        echo "git remote add origin https://averydumbtre:GITHUBDEVELCLASSICTOKEN@github.com/averydumbtre/dotfiles.git";
        echo "git remote set-url origin https://averydumbtre:GITHUBDEVELCLASSICTOKEN@github.com/averydumbtre/dotfiles.git";
        echo "git branch -M main";
        echo "git push -u origin main";
        echo "--";
        echo "press enter to continue";
        read;;
    * ) echo "give me your Github Developer Classic Token"
        echo "it will be a long string of numbers with a prefix (ghp_1234etcaaaaaaaaaaaaaaaaaaaaaaaaaaaaa)";
        read -p "> " GITHUBDEVELCLASSICTOKEN;
        cd ~/.local/share/chezmoi/;
        git remote add origin https://averydumbtre:$GITHUBDEVELCLASSICTOKEN@github.com/averydumbtre/dotfiles.git;
        git remote set-url origin https://averydumbtre:$GITHUBDEVELCLASSICTOKEN@github.com/averydumbtre/dotfiles.git;
        git branch -M main;
        git pull origin main;;
esac




clear
echo
echo "ALRIGHT"
echo "you have completed the install script, good job!"
echo "BUT THE INSTALL ISNT OVER..."
echo
echo "there are some things left to do:"
echo "* add addons to librewolf (Sponsorblock, Return Dislike, Bitwarden, Twitch alt Player, Tridactyl, Darkreader)"
echo "* import you bookmarks, in ~/Documents/bookmarks-20xx-xx-xx.json"
echo "* tab layout [sshot, zoom, priv, lib, dl, sett, add, burg] - no flex spaces"
echo "* librewolf settings:"
echo "         privacy.resistFingerprinting = false"
echo "         privacy.fingerprintingProtection = true"
echo "         privacy.fingerprintingProtection.overrides = +AllTargets,-CSSPrefersColorScheme,-JSDateTimeUTC"
echo "* tridactyl binds"
echo "         tridactyl :bind <C-J> tabmove -1"
echo "         tridactyl :bind <C-K> tabpush"
echo "         tridactyl :unbind D"
echo "         tridactyl :bind dd tabclose"
echo
echo
echo "alright screenshot that"
echo "press enter to reboot"
read
sudo -i reboot
