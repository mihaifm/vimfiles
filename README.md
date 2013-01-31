    git clone https://github.com/mihaifm/vimfiles.git

    :BundleInstall
    
Make symbolic links:

(unix)

    ln -s vimfiles/_vimrc ~/.vimrc
    ln -s vimfiles ~/.vim
    
(windows vista/7/8)

    cd vimfiles
    junction D:\Tools\Vim\vimfiles .
    mklink D:\Tools\Vim\_vimrc _vimrc

Or using source:

    :e D:\Tools\Vim\_vimrc

    set rtp+=D:\Dropbox\Projects\vimfiles
    source D:\Dropbox\Projects\vimfiles\_vimrc

