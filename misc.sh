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
    nvim ~/Sync/notes_${DATETIME}.md
}

### Open the last note I just created
noteopenlast() {
    # open the last note
    cd ~/Sync
    lastnote=$(ls -t | head -n1)
    nvim $lastnote
}


