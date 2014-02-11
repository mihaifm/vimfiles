My vim setup

    git clone https://github.com/mihaifm/vimfiles.git

    :BundleInstall
    
Make symbolic links:    
(unix)

    ln -s vimfiles/_vimrc ~/.vimrc
    ln -s vimfiles ~/.vim
    

Or use `source`:    
(windows)

    :e D:\Tools\Vim\_vimrc

    set rtp+=D:\Dropbox\Projects\vimfiles
    source D:\Dropbox\Projects\vimfiles\_vimrc

