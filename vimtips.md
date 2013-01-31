### Copy from :messages

Use CTRL+Y on the selection

### Search full words
    
    /\<someword\>

### Find files with multiple extensions

    vimgrep /message/ **/*.rb **/*.html.erb

### Display hightlight group for character under cursor

    :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . ">"
    :echo "trans<". synIDattr(synID(line("."),col("."),0),"name") . ">"
    :echo "lo<". synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"

### Fast macro usage

Start recording (in register q)

    qq

Play macro

    @q

Replay last macro

    @@
