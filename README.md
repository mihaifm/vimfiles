vimfiles
========


### Setup from scratch

Create initial repository: 

    cd vimfiles
    git init
    git add .
    git remote add origin https://github.com/mihaifm/vimfiles.git
    git commit -a -m "initial"
    git push origin master

Add subtrees

    mkdir bundle
    git subtree add -P bundle/easymotion --squash https://github.com/Lokaltog/vim-easymotion.git master
    git subtree add -P bundle/bufstop --squash https://github.com/mihaifm/bufstop.git master
    git subtree add -P bundle/ctrlp --squash  https://github.com/kien/ctrlp.vim.git master
    ...

    git add .

Commit changes: (safely ignore the message:  'nothing to commit, working directory clean')

    git commit -a -m "added subtrees"
    git push origin master

### On another machine

Clone the repo

    git clone https://github.com/mihaifm/vimfiles.git
    
Make symbolic links:

(unix)

    ln -s vimfiles/_vimrc ~/.vimrc
    ln -s vimfiles ~/.vim
    
(windows)

    cd vimfiles
    junction D:\Tools\Vim\vimfiles .
    mklink D:\Tools\Vim\_vimrc _vimrc

### Update plugin

    git subtree pull -P bundle/bufstop-search --squash https://github.com/mihaifm/bufstop-search.git master


