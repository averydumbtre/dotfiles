#! /bin/bash
echo "finishing"
chezmoi re-add &> /home/avery/.local/share/chezmoi/push.log
chezmoi update &> /home/avery/.local/share/chezmoi/push.log
cd /home/avery/.local/share/chezmoi/ &> /home/avery/.local/share/chezmoi/push.log
git add . &> /home/avery/.local/share/chezmoi/push.log
git commit -m "automated commit" &> /home/avery/.local/share/chezmoi/push.log
git push -u origin main &> /home/avery/.local/share/chezmoi/push.log
echo "chezmoi"
