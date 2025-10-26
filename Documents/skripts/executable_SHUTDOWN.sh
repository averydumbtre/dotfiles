chezmoi re-add &> ~/.local/share/chezmoi/push.log
chezmoi update &> ~/.local/share/chezmoi/push.log
cd ~/.local/share/chezmoi/ &> ~/.local/share/chezmoi/push.log
git add . &> ~/.local/share/chezmoi/push.log
git commit -m "automated commit" &> ~/.local/share/chezmoi/push.log
git push -u origin main &> ~/.local/share/chezmoi/push.log
