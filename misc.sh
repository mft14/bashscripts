#### A collection of miscellaneous functions and aliases that fits into no other category

# Create a directory and change to it
mkcd() {
    mkdir -p $1 && cd $1
}

# Create a quick desktop file for an app
newdesktopfile() {
    if (( $# != 1 )); then
        echo "Usage: newdesktopfile <appname>"
        return
    else
        echo "Creating new desktop file for $1"

        echo "[Desktop Entry]" > ~/.local/share/applications/$1.desktop
        echo "Name=$1" >> ~/.local/share/applications/$1.desktop
        echo "Exec=/home/mf14/Apps/.AppImage" >> ~/.local/share/applications/$1.desktop
        echo "Type=Application" >> ~/.local/share/applications/$1.desktop
        echo "Icon=Path to Icon.png" >> ~/.local/share/applications/$1.desktop
        echo "Categories=My Apps;" >> ~/.local/share/applications/$1.desktop
        echo "Terminal=false" >> ~/.local/share/applications/$1.desktop
        echo "StartupNotify=true" >> ~/.local/share/applications/$1.desktop
        echo "Comment=My custom app" >> ~/.local/share/applications/$1.desktop

        nvim ~/.local/share/applications/$1.desktop
    fi

}


### Make quick notes into my syncthing folder
note() {
    DATETIME=$(date '+%F_%Hh%M')  
    #if no args, then make a new note with time stamp
    if [ $# -eq 0 ]; then
        nvim ~/Sync/quicknote/note_${DATETIME}.md
    else
        # if there are args, then make a new note with the args as the title
        nvim ~/Sync/quicknote/$1.md
    fi
}

### Open the last note I just created
noteopenlast() {
    # open the last note
    cd ~/Sync
    lastnote=$(ls -t | head -n1)
    nvim $lastnote
}

### Copy the content of a file to the clipboard
copycontent() {
    if (( $# != 1 )); then
        echo "Usage: copycontent <filename>"
        echo "xclip must be installed for this to work. (sudo apt install xclip)"
        return
    else
        cat $1 | xclip -selection clipboard
        echo "Copying content of $1 to clipboard..."
    fi
}
