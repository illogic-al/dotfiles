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
        echo $dotfiles 'exists ...'
        if [[ -e $HOME/.$i ]]
        then
          if [[ -d $oldfiles ]]
          then
            echo 'Moving' $i 'to' $oldfiles
            mv -f $HOME/.$i $oldfiles
          else
            echo 'Creating' $oldfiles '...'
            mkdir $oldfiles
            echo 'Moving' $i 'to' $oldfiles
            mv -f $HOME/.$i $oldfiles
          fi
        fi

        echo 'Linking' $i 'in' $dotfiles
        echo ''
        ln -sf $dotfiles/$i $HOME/.$i
      fi
    else
      echo 'Whoops! Your dotfiles directory is not at' $dotfiles
    fi
  fi
done

echo 'All done!'
