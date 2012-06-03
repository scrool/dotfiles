#This script must be run as first in bash directory. Other scripts might depend
#on functions which are defined here.

for config_file in $DOTFILES/bash/functions/*.bash
do
  source $config_file
done
