#!/bin/env sh

gvimDir="$HOME/.vim"
gvimBakDir="$HOME/Dropbox/vim/Backup/"
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
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && mv $i $gavimBakDir/$i.$today; done

# clone from github.com
echo "Gavin [step 2]: cloning gavinVim\n"
git clone http://github.com/ $gvimDir
mkdir -p $gvimDir/bundle
#ln -s $gvimDir/vimrc $HOME/.vimrc
#ln -s $gvimDir/vim $HOME/.vim

echo "Gavin [step 3]: installing Vundle"
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

echo "Gavin [step 4]: installing plugins using Vundle"
vim +BundleInstall! +BundleClean +q
