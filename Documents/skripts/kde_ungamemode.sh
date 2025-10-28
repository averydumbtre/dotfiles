#! /bin/bash
cp /home/avery/.config/plasma-io.gitgud.wackyideas.desktop-appletsrc /home/avery/Documents/skripts/kde_widgets/plasma-io.gitgud.wackyideas.desktop-appletsrc
rm /home/avery/.config/plasma-io.gitgud.wackyideas.desktop-appletsrc
cp /home/avery/Documents/skripts/kde_widgets/FULL/plasma-io.gitgud.wackyideas.desktop-appletsrc /home/avery/.config/plasma-io.gitgud.wackyideas.desktop-appletsrc
systemctl --user restart plasma-plasmashell
