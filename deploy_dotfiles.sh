#!/bin/zsh

dotfiles="~/.dotfiles"
oldfiles="~/.dotfiles.old"

count=0; for i in `ls -A1 ~/.dotfiles`
do
  ((count++))
  if [[ (($count -gt 0)) ]]
  then
    if [[ -d $dotfiles ]]
    then
      if [[ (($i != 'gvimrc')) ]]
      then
        echo "$dotfiles exists ..."
        if [[ -d $oldfiles ]]
        then
          echo "Moving old dotfiles to $oldfiles ..."
          mv ~/.$i $oldfiles
        else
          echo "Moving old dotfiles to $oldfiles ..."
          mkdir $oldfiles
          mv ~/.$i $oldfiles
        fi

        echo "Linking dotfiles in $dotfiles ..."
        ln -s $dotfiles/$i ~/.$i
        echo "All done!"
      fi
    else
      echo "Whoops! Your dotfiles directory is not at $dotfiles."
    fi
  fi
done
