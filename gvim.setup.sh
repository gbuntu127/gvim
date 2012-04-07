#!/bin/bash

gvimDir=$HOME/.vim
today=`date +%Y%m%d`
gvimBakDir=$HOME/Dropbox/vim/Backup/$today


warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}


# Backup existing .vim stuff
echo "Gavin [step 1]: backing up current vim config\n"
mkdir -p $gvimBakDir 
zip -ur $HOME/vim.$today.zip $HOME/.vim $HOME/.vimrc $HOME/.gvimrc 
mv $HOME/vim.$today.zip $gvimBakDir

#mv $HOME/.vim $gavimBakDir/vim.$today
#mv $HOME/.vimrc $gavimBakDir/vimrc.$today
#mv $HOME/.gvimrc $gavimBakDir/gvimrc.$today

# clone from github.com
echo "Gavin [step 2]: cloning gavinVim\n"
git clone git@github.com:gbuntu127/gvim.git $gvimDir
mkdir -p $gvimDir/bundle
ln -s $gvimDir/vimrc $HOME/.vimrc
#ln -s $gvimDir/vim $HOME/.vim

echo "Gavin [step 3]: installing Vundle"
git clone git@github.com:gmarik/vundle.git $HOME/.vim/bundle/vundle

#echo "Gavin [step 4]: installing Fonts"
#git clone git@github.com:gbuntu127/gfonts.git $HOME/.fonts

echo "Gavin [step 4]: installing plugins using Vundle"
vim +BundleInstall! +BundleClean +q
