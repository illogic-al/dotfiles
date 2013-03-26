#!/bin/zsh

dotfiles=$HOME/.dotfiles
oldfiles=$HOME/.dotfiles.old

count=0; for i in `ls -A1 $dotfiles`
do
  ((count++))
  if [[ (($count -gt 0)) ]]
  then
    if [[ -d $dotfiles ]]
    then
      if [[ (($i != 'gvimrc') && ($i != 'profile.bak') 
        && ($i != 'vim.old') && ($i != 'vimrc.old') 
        && ($i != 'deploy_dotfiles.sh') && ($i != '.git')
        && ($i != 'power.sh'))]]
      then
        echo '$dotfiles exists ...'
        if [[ -d $oldfiles ]]
        then
          echo 'Moving old dotfiles to $oldfiles ...'
          mv $HOME/.$i $oldfiles
        else
          echo 'Moving old dotfiles to $oldfiles ...'
          mkdir $oldfiles
          mv $HOME/.$i $oldfiles
        fi

        echo 'Linking dotfiles in $dotfiles ...'
        ln -s $dotfiles/$i $HOME/.$i
        echo 'All done!'
      fi
    else
      echo 'Whoops! Your dotfiles directory is not at $dotfiles.'
    fi
  fi
done
