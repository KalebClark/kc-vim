#!/bin/bash

echo "Copy stuff where it needs to go and do a backup"

if [[ -d ~/.smash ]]; then
    rm -rf ~/.smash
fi

mkdir -p ~/.smash/commands
mkdir -p ~/.smash/git
mkdir -p ~/.smash/backup

cp commands/* ~/.smash/commands/
cp git/* ~/.smash/git

# Backup configs
cp ~/.vimrc ~/.smash/backup/
cp ~/.bashrc ~/.smash/backup/

# Copy in new files
cp vimrc ~/.vimrc
cp bashrc ~/.bashrc
cp gitcheat.txt ~/.smash/
