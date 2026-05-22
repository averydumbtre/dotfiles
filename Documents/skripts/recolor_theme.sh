#! /bin/bash
clear
echo "Welcome to Avery's Theme Recolor script!"
pastel paint -o lightblue black "Welcome to                                                                          "
pastel paint -o pink black      "Avery's                                                                             "
pastel paint -o white black     "Theme                                                                               "
pastel paint -o pink black      "Recolor                                                                             "
pastel paint -o lightblue black "Script                                                                              "
echo ^
echo This script changes the color values of important hyprland theming files such as:
echo hypr.conf
echo waybars theme.css
echo waybars config.jsonc
echo sways style.css
echo hyprlock.conf
echo ^
echo ^
echo "remember to change gtk theme and gtk icons! (maybe cursor too)"
echo ^
echo ^
echo You will need to provide 7 color codes
echo Almost any format will go through
echo If you notice an error after inputting you did it wrong
echo And if you did it wrong you WILL fuck things up
echo ^
currentcolor=$(grep @define-color\ crust /home/avery/.config/waybar/theme.css | cut -c 31- | cut -c -7)
echo -n "a Background color            (usually something minimal and low saturation)                                                  currently " && pastel paint -o $currentcolor ffffff $currentcolor
currentcolor=$(grep @define-color\ surface0 /home/avery/.config/waybar/theme.css | cut -c 31- | cut -c -7)
echo -n "a Alternate color             (usually a different color that stands out more and is used for broad highlights)               currently " && pastel paint -o $currentcolor ffffff $currentcolor
currentcolor=$(grep @define-color\ text /home/avery/.config/waybar/theme.css | cut -c 31- | cut -c -7)
echo -n "a Text color                  (something that has to stand out from both the background and alternate color)                  currently " && pastel paint -o $currentcolor ffffff $currentcolor
currentcolor=$(grep @define-color\ overlay2 /home/avery/.config/waybar/theme.css | cut -c 31- | cut -c -7)
echo -n "a Background color highlight  (usually the same color as the background color but much brighter and used for highlights)      currently " && pastel paint -o $currentcolor ffffff $currentcolor
currentcolor=$(grep @define-color\ base /home/avery/.config/waybar/theme.css | cut -c 31- | cut -c -7)
echo -n "a Alternate color midtone     (usually the alternate color but a bit more muted and darker)                                   currently " && pastel paint -o $currentcolor ffffff $currentcolor
currentcolor=$(grep @define-color\ mantle /home/avery/.config/waybar/theme.css | cut -c 31- | cut -c -7)
echo -n "a Alternate color lowtone     (usually a much darker version of the alternate color, blended with the background color)       currently " && pastel paint -o $currentcolor ffffff $currentcolor
echo "a Extreme Highlight color     (usually something very bright and saturated, used to stand out even more than the text color)  currently unknown"
echo ^
echo you will be asked in the same order as the colors were listed
echo take you time to write the colors down and find good matches
echo two colors, one being the background and one being the alternate is a good idea to start with
echo use of the terminal command "pastel" is reccomended
echo ^
echo ^
echo press enter to continue
read
clear
echo "Background color            (usually something minimal and low saturation)"
echo "Alternate color             (usually a different color that stands out more and is used for broad highlights)"
echo "Text color                  (something that has to stand out from both the background and alternate color)"
echo "Background color highlight  (usually the same color as the background color but much brighter and used for highlights)"
echo "Alternate color midtone     (usually the alternate color but a bit more muted and darker)"
echo "Alternate color lowtone     (usually a much darker version of the alternate color, blended with the background color)"
echo "Extreme Highlight color     (usually something very bright and saturated, used to stand out even more than the text color)"
echo ^
echo please provide a Background color
read backd
backc=$(echo "$backd" | pastel format hex)
pastel paint -o $backc ffffff $backc
echo ^
echo please provide a Alternate color
read altd
altc=$(echo "$altd" | pastel format hex)
pastel paint -o $altc ffffff $altc
echo ^
echo please provide a Text color
read textd
textc=$(echo "$textd" | pastel format hex)
pastel paint -o $textc ffffff $textc
echo ^
echo please provide a Background color highlight
read backhighd
backhighc=$(echo "$backhighd" | pastel format hex)
pastel paint -o $backhighc ffffff $backhighc
echo ^
echo please provide a Alternate color midtone
read altmidd
altmidc=$(echo "$altmidd" | pastel format hex)
pastel paint -o $altmidc ffffff $altmidc
echo ^
echo please provide a Alternate color lowtone
read altlowd
altlowc=$(echo "$altlowd" | pastel format hex)
pastel paint -o $altlowc ffffff $altlowc
echo ^
echo please provide a Extreme Highlight color
read loudd
loudc=$(echo "$loudd" | pastel format hex)
pastel paint -o $loudc ffffff $loudc
echo ^
read -p "Do you also want to change your wallpaper [y/n]" yn
case $yn in
    y ) echo put in the path for you wallpaper of choice;
        read filepath;
        sed -i "s\preload = .*\preload = $filepath\g" /home/avery/.config/hypr/hyprpaper.conf ;
        sed -i "s\wallpaper = DP-1.*\wallpaper = DP-1, $filepath\g" /home/avery/.config/hypr/hyprpaper.conf ;
        sed -i "s\wallpaper = DP-2.*\wallpaper = DP-2, $filepath\g" /home/avery/.config/hypr/hyprpaper.conf ;
        sed -i "s\wallpaper = eDP-1.*\wallpaper = eDP-1, $filepath\g" /home/avery/.config/hypr/hyprpaper.conf ;
        pkill hyprpaper ;
        sleep 0.2 ;
        nohup hyprpaper > /dev/null 2>&1& ;;
    n ) echo ^;;
    * ) echo ^;;
esac
echo ^
echo press enter twice to commit to theme changing!
echo press ctrl c to quit
echo ^
read
read
clear
# colord for dirty colorc for clean!
backrgb=$(echo "$backc" | pastel format rgb)
altrgb=$(echo "$altc" | pastel format rgb)
textrgb=$(echo "$textc" | pastel format rgb)
backhighrgb=$(echo "$backhighc" | pastel format rgb)
altmidrgb=$(echo "$altmidc" | pastel format rgb)
altlowrgb=$(echo "$altlowc" | pastel format rgb)
loudrgb=$(echo "$loudc" | pastel format rgb)
echo -ne '#                   (00%)\r'

#swaync
sed -i "s/@define-color foreground.*/@define-color foreground $textrgb;/g" /home/avery/.config/swaync/style.css
echo -ne '#                   (03%)\r'
sleep 0.05
sed -i "s/@define-color background.*/@define-color background $backrgb;/g" /home/avery/.config/swaync/style.css
echo -ne '##                  (06%)\r'
sleep 0.05
sed -i "s/@define-color accent.*/@define-color accent $altrgb;/g" /home/avery/.config/swaync/style.css
echo -ne '##                  (09%)\r'
sleep 0.05
sed -i "s/@define-color current-line.*/@define-color current-line $backrgb;/g" /home/avery/.config/swaync/style.css
echo -ne '###                 (12%)\r'
sleep 0.05
sed -i "s/@define-color comment.*/@define-color comment $backhighrgb;/g" /home/avery/.config/swaync/style.css
echo -ne '###                 (15%)\r'
sleep 0.05
pkill swaync
sleep 0.2
nohup swaync > /dev/null 2>&1&

#waybar
sed -i "s/@define-color text            .*/@define-color text            $textc;/g" /home/avery/.config/waybar/theme.css
echo -ne '####                (18%)\r'
sleep 0.05
sed -i "s/@define-color crust           .*/@define-color crust           $backc;/g" /home/avery/.config/waybar/theme.css
echo -ne '####                (21%)\r'
sleep 0.05
sed -i "s/@define-color overlay2        .*/@define-color overlay2        $backhighc;/g" /home/avery/.config/waybar/theme.css
echo -ne '#####               (24%)\r'
sleep 0.05
sed -i "s/@define-color surface0        .*/@define-color surface0        $altc;/g" /home/avery/.config/waybar/theme.css
echo -ne '#####               (27%)\r'
sleep 0.05
sed -i "s/@define-color base            .*/@define-color base            $altmidc;/g" /home/avery/.config/waybar/theme.css
echo -ne '######              (30%)\r'
sleep 0.05
sed -i "s/@define-color mantle          .*/@define-color mantle          $altlowc;/g" /home/avery/.config/waybar/theme.css
echo -ne '######              (33%)\r'
sleep 0.05


#config.jsonc... NIGHTMARE!!!!!!
sed -i 's\			"months".*\			"months":     "<span color='"'$textc'"'><b>{}</b></span>",\g' /home/avery/.config/waybar/config.jsonc
echo -ne '#######             (36%)\r'
sleep 0.05
sed -i 's\			"days".*\			"days":     "<span color='"'$altc'"'><b>{}</b></span>",\g' /home/avery/.config/waybar/config.jsonc
echo -ne '#######             (39%)\r'
sleep 0.05
sed -i 's\			"weeks".*\			"weeks":     "<span color='"'$altc'"'><b>{}</b></span>",\g' /home/avery/.config/waybar/config.jsonc
echo -ne '########            (42%)\r'
sleep 0.05
sed -i 's\			"weekdays".*\			"weekdays":     "<span color='"'$backhighc'"'><b>{}</b></span>",\g' /home/avery/.config/waybar/config.jsonc
echo -ne '########            (45%)\r'
sleep 0.05
sed -i 's\			"today".*\			"today":     "<span color='"'$loudc'"'><b>{}</b></span>",\g' /home/avery/.config/waybar/config.jsonc
echo -ne '#########           (48)%)\r'
sleep 0.05


#hypr.conf
#remove the hashtag
back2=${backc:1}
altmid2=${altmidc:1}
backhigh2=${backhighc:1}
text2=${textc:1}
loud2=${loudc:1}
altlow2=${altlowc:1}
alt2=${altc:1}
sed -i "s/--background-color=.\{6\}/--background-color=$back2/g" /home/avery/Documents/hypr.conf
echo -ne '#########           (51%)\r'
sleep 0.05
sed -i "s/--border-color=.\{6\}/--border-color=$backhigh2/g" /home/avery/Documents/hypr.conf
echo -ne '##########          (54%)\r'
sleep 0.05
sed -i "s/--text-color=.\{6\}/--text-color=$text2/g" /home/avery/Documents/hypr.conf
echo -ne '###########         (57%)\r'
sleep 0.05
sed -i "s/--prompt-color=.\{6\}/--prompt-color=$back2/g" /home/avery/Documents/hypr.conf
echo -ne '###########         (60%)\r'
sleep 0.05
sed -i "s/--input-color=.\{6\}/--input-color=$text2/g" /home/avery/Documents/hypr.conf
echo -ne '############        (63%)\r'
sleep 0.05
sed -i "s/--selection-color=.\{6\}/--selection-color=$loud2/g" /home/avery/Documents/hypr.conf
echo -ne '############        (66%)\r'
sleep 0.05
sed -i "s/--selection-background=.\{6\}/--selection-background=$altmid2/g" /home/avery/Documents/hypr.conf
echo -ne '#############       (69%)\r'
sleep 0.05
sed -i "s/--prompt-background=.\{6\}/--prompt-background=$alt2/g" /home/avery/Documents/hypr.conf
echo -ne '#############       (72%)\r'
sleep 0.05
sed -i "s/--placeholder-background=.\{6\}/--placeholder-background=$altmid2/g" /home/avery/Documents/hypr.conf
echo -ne '##############      (75%)\r'
sleep 0.05
sed -i "s/--input-background=.\{6\}/--input-background=$altmid2/g" /home/avery/Documents/hypr.conf
echo -ne '##############      (78%)\r'
sleep 0.05
sed -i "s/--default-result-background=.\{6\}/--default-result-background=$altlow2/g" /home/avery/Documents/hypr.conf
echo -ne '###############     (81%)\r'
sleep 0.05
sed -i "s/--outline-color=.\{6\}/--outline-color=$altlow2/g" /home/avery/Documents/hypr.conf
echo -ne '################    (84%)\r'
sleep 0.05
sed -i "s/    col.active_border = .*/    col.active_border = rgb($alt2)/g" /home/avery/Documents/hypr.conf
echo -ne '################    (87%)\r'
sleep 0.05
sed -i "s/    col.inactive_border = .*/    col.inactive_border = rgb($back2)/g" /home/avery/Documents/hypr.conf
echo -ne '#################   (90)%)\r'
sleep 0.05
sed -i "s/    textcolor=rgb(.*/    textcolor=rgb($text2)/g" /home/avery/Documents/hypr.conf
echo -ne '##################  (93%)\r'
sleep 0.05
sed -i "s/    bgcolor=rgb(.*/    bgcolor=rgb($back2)/g" /home/avery/Documents/hypr.conf
echo -ne '##################  (96%)\r'
sleep 0.05
sed -i "s/    bordercolor=rgb(.*/    bordercolor=rgb($alt2)/g" /home/avery/Documents/hypr.conf
echo -ne '################### (99%)\r'
sleep 0.05
sed -i "s/  main-bg:        .*/  main-bg:        $backc;/g" /home/avery/.config/rofi/theme.rasi
sed -i "s/  main-fg:        .*/  main-fg:        $textc;/g" /home/avery/.config/rofi/theme.rasi
sed -i "s/  main-br:        .*/  main-br:        $altc;/g" /home/avery/.config/rofi/theme.rasi
sed -i "s/  input-bg:       .*/  input-bg:        $altmidc;/g" /home/avery/.config/rofi/theme.rasi
sed -i "s/  select-bg:      .*/  select-bg:        $textc;/g" /home/avery/.config/rofi/theme.rasi
sed -i "s/  select-fg:      .*/  select-fg:        $textc;/g" /home/avery/.config/rofi/theme.rasi
echo -ne '####################(100%)\r'
echo -ne '\n'
cowsay good girl
exit
