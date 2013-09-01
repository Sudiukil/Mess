#!/bin/bash

cp ~/.xinitrc ~/Autre/Custo/X/xinitrc
cp ~/.zshrc ~/Autre/Custo/Zsh/zshrc
cp ~/.i3/config ~/Autre/Custo/i3/config
cp ~/.i3/i3status.conf ~/Autre/Custo/i3/
cp ~/.Xresources ~/Autre/Custo/X/Xresources
cp ~/.vimrc ~/Autre/Custo/Vim/vimrc
cp ~/.vim/colors/* ~/Autre/Custo/Vim/
cp -r ~/.thunderbird/* ~/Autre/Backups/Mails/
newsbeuter -e > ~/Autre/Backups/feedlist.opml
~/Autre/Scripts/mcbackup

rsync -rltv --delete-after ~/Autre/ /run/media/quentin/EHDD1To/Backup/Autre/
rsync -rltv --delete-after ~/Documents/ /run/media/quentin/EHDD1To/Backup/Documents/
rsync -rltv --delete-after ~/Images/ /run/media/quentin/EHDD1To/Backup/Images/
rsync -rltv --delete-after ~/Musique/ /run/media/quentin/EHDD1To/Backup/Musique/
rsync -rltv --delete-after ~/Tri/ /run/media/quentin/EHDD1To/Backup/Tri/
rsync -rltv --delete-after ~/Téléchargements/ /run/media/quentin/EHDD1To/Backup/Téléchargements/
rsync -rltv --delete-after ~/Vidéos/ /run/media/quentin/EHDD1To/Backup/Vidéos/
rsync -rltv --delete-after ~/.local/share/Steam/ /run/media/quentin/EHDD1To/Backup/Steam/

rm -r /run/media/quentin/EHDD1To/.Trash-*/
umount /run/media/quentin/EHDD1To/

exit
