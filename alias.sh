alias putain="open ~/MEGA/lesnotes/journals/megaputain.xlsx"

alias standardshell="sudo chsh -s /bin/fish"
alias standardterminal="sudo update-alternatives --config x-terminal-emulator"
alias standardbrowser="xdg-settings set default-web-browser vivaldi-stable.desktop"


#install stuff
alias installtilingwm="sudo apt install herbstluftwm nitrogen compton pulsemixer picom compiz lxappearance polybar"
alias installsnap="sudo rm /etc/apt/preferences.d/nosnap.pref; sudo apt install snapd -y;"
alias installgimpfonts="ln -s ~/Sync/images/Fonts ~/.config/GIMP/2.10/fonts ;"
alias installnvim="curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage ; mv nvim.appimage nvim ; chmod u+x nvim ; sudo mv nvim /usr/bin/ ;"
alias installnodejs="curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash - ; sudo apt install nodejs -y;"
alias installjava17="sudo apt install openjdk-17-jre openjdk-17-jdk openjdk-17-demo openjdk-17-doc openjdk-17-jre-headless openjdk-17-source"
alias installphp="sudo apt-get install apache2 libapache2-mod-php php php-mysql mysql-server -y"
alias installgnomeext="sudo apt-get install chrome-gnome-shell gnome-tweaks"
alias installrct2="unzip ~/Jeux/rct2/RCT2.zip -d ~/Jeux/ ; flatpak install openrct2 ; "
alias installdiscord="wget 'https://discord.com/api/download?platform=linux&format=deb'; mv download\?platform=linux\&format=deb discord.deb; sudo apt install -y ./discord.deb; rm ./discord.deb;"
alias installgames="sudo apt install assaultcube aisleriot kdegames openttd frozen-bubble neverputt "
alias installpowershell="wget https://github.com/PowerShell/PowerShell/releases/download/v7.4.0/powershell_7.4.0-1.deb_amd64.deb; sudo apt install -y ./powershell_7.4.0-1.deb_amd64.deb && rm powershell_7.4.0-1.deb_amd64.deb"
alias installytfzf="cd ~/Git; git clone https://github.com/pystardust/ytfzf ; cd ytfzf ; sudo make install ; "


alias uninstallmysql="sudo apt purge mysql mysql-server mysql-common mysql-client"

#alias by https://www.atatus.com/blog/14-useful-bash-aliases-that-make-shell-less-complex-and-more-fun/ 
#zeig alle gemounteten Platten, zB. USB Sticks
alias cpv='rsync -ah --info=progress2'
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias mpv='mpv --no-audio-display'

alias mountnas="sudo mount -t cifs -o username=mf14,uid=1000 //192.168.1.96/homes /media/mf14/mfnas"
alias umountnas="sudo umount /media/mf14/mfnas"

alias vpn="sudo vpnc"
alias vpnd="sudo vpnc-disconnect"


#Herbstluftwm alias Layouts
alias hc="herbstclient"
# alias hcvbox="herbstclient split h ; herbstclient split v 0.75 ; herbstclient focus right; herbstclient split v 0.75 ;"

# Commands to run in interactive sessions can go here
alias espr="espanso restart"
alias espru="espanso stop ; espanso start --unmanaged"
alias l="ls -1"
alias listenmp3="audacious ~/Musique/* &"
alias lls="ls -lh --color"
alias poweroff="systemctl poweroff"
alias reboot="systemctl reboot"

#Open with file explorer
alias mail="xdg-email"
alias eee="xdg-open ./ &"
alias xxx="xdg-open " #use "open", that works too
alias mcdlmed="mc ~/Téléchargements /media/mf14" 

#backlight
alias xbackl="xbacklight -set "
alias xbackl0="xbacklight -set 1"

alias piano="qsynth 'Sync/musique/Soundfonts/Stein Grand Piano.SF2' "
#############CD Bookmarks



alias cd3cx="cd ~/Documents/3cx ;ls"
alias cdapps="cd ~/Apps/; ls"
alias cdapplications="cd ~/.local/share/applications/ ;ls"
alias cdautostart="cd ~/.config/autostart/ ;ls"
alias cdb4="cd ~/Git/lesnotes/b4it ;ls"
alias cdbash="cd ~/Git/configs/bashrc/scripts ;ls"
alias cddesktopsession="cd /usr/share/xsessions/ ;ls"
alias cddl="cd ~/Téléchargements/ ;ls"
alias cddoc="cd ~/Documents/ ;ls"
alias cdesp="cd ~/Git/configs/espanso/match ;ls"
alias cdflatpak="cd ~/.var/app/ ;ls"
alias cdgames="cd ~/Sync/jeux/ ;ls"
alias cdgb="cd ~/Sync/jeux/roms/gb ;ls"
alias cdgba="cd ~/Sync/jeux/roms/gba ;ls"
alias cdgbc="cd ~/Sync/jeux/roms/gb ;ls"
alias cdgc="cd ~/Sync/jeux/roms/gc ;ls"
alias cdgimp="cd ~/.config/GIMP/2.10/ ;ls"
alias cdgit="cd ~/Git ;ls"
alias cdpix="cd ~/Git/pixelart; git status; ls"
alias cdgo="cd ~/Git/progg/go ;ls"
alias cdimg="cd ~/Images/ ;ls"
alias cdjeux="cd ~/Sync/jeux/ ;ls"
alias cdjournal="cd ~/Git/lesnotes/journal ;ls"
alias cdjs="cd ~/Git/progg/js ;ls"
alias cdmedia="cd /media/mf14/ ;ls"
alias cdnas="cd /media/mf14/mfnas/mf14 ;ls"
alias cdgame="cd ~/Git/game-to-be/;git status;ls"
alias cdmp3="cd ~/Musique/ ;ls -art"
alias cdsamplez="cd ~/Sync/musique/Samplez ;ls"
alias cdsync="cd ~/Sync/ ;ls"
alias cdsyncimg="cd ~/Sync/images/ ;ls"
alias cdsyncmus="cd ~/Sync/musique/ ;ls"
alias cdsyncvid="cd ~/Sync/videos/ ;ls"
alias cdtodo="cd ~/Git/kkiel/cookbook/pages; git status; ls"
alias cduff="cd ~/Sync/videos/la\ uff/; ls"
alias cdusrbin="cd /usr/bin/ ;ls"
alias cdventoy="cd /media/mf14/Ventoy ;ls"
alias cdventoy="cd /media/mf14/Ventoy/ ;ls"
alias cdvid="cd ~/Vidéos/ ;ls"
alias cdwww="cd /var/www/html/ ;ls"
alias cdmf14="cd /home/mf14/ ;ls"
alias cdroot="cd /root/ ;ls"
alias cp="cp -v"
alias cdbin="cd ~/Sync/apps/bin ; ls"

alias sourcen="source ~/Git/configs/bashrc/*"

alias caldavgmx="https://caldav.gmx.net/."
alias loginb4nas="pass b4it/b4nas -c; open 'https://note.backup4it.de:5001' "

#cd to git repos
hr="echo '-------------------------';"
gitst="git status; $hr git log -1; $hr ls;"
alias cdnotes="cd ~/Git/lesnotes;       $gitst"
alias cdconf="cd ~/Git/configs;         $gitst"
alias cdmft="cd ~/Git/mft14;            $gitst"
alias cdkiel="cd ~/Git/kkiel;           $gitst"
alias cdkali="cd ~/Git/kalimore;        $gitst"
alias cdprogg="cd ~/Git/progg;          $gitst"

#Quick Vim Openers

#vimlike Sachen
alias :q="exit"
alias :wq="exit"
alias vid="neovide"
alias vim="nvim"
alias vimjournal="vim ~/Git/lesnotes/journal/2024.md"
alias vimalias="nvim ~/Git/configs/bashrc/scripts/alias.sh"
alias vimbash="vim ~/Git/configs/bashrc/bashrc"
alias vimrsyncs="vim ~/Git/configs/bashrc/scripts/rsyncs.sh"
alias vimesp="vim ~/.config/espanso/match/"
alias vimespbase="vim ~/.config/espanso/match/base.yml"
alias vimespcode="vim ~/.config/espanso/match/code.yml"
alias vimfi="vim ~/Git/configs/firstinstall.sh"
alias vimfirstinstall="vim ~/Git/configs/firstinstall.sh"
alias vimsymlinks="vim ~/Git/configs/create-symlinks.sh"
alias vimfish="vim ~/.config/fish/config.fish"
alias vimhlwm="vim ~/Git/configs/herbstluftwm/autostart"
alias vimi3="vim ~/Git/configs/i3/config"
alias vimkitty="vim ~/Git/configs/kitty/kitty.conf"
alias vimala="vim ~/Git/configs/alacritty/alacritty.yml"
alias vimnvim="vim ~/.config/nvim/init.vim"
alias vimpicom="vim ~/Git/configs/picom/picom.conf"
alias vimpolybar="vim ~/Git/configs/polybar/config"
alias vimshell="vim ~/Git/kkiel/cookbook/pages/faq_shell.html"
alias vimvds="vim ~/Git/mft14.github.io/src/js/vds.js"
alias vimfrlp="vim ~/Git/lesnotes/flashcards/francais_letsplay.csv"
alias vimvim="vim ~/.vimrc"
alias vimhosts="sudo vim /etc/hosts"



# alias rm="rm -i"
alias paci="sudo pacman -S "
alias pacu="sudo pacman -Syu "
alias pacr="sudo pacman -R "
alias apti="sudo apt install "
alias aptu="sudo apt update && sudo apt upgrade "
alias nali="sudo nala install "
alias nalu="sudo nala update && sudo nala upgrade "
alias flati="flatpak install "
alias snapi="sudo snap install "

#Translating
alias deen="trans de:en"
alias dees="trans de:es"
alias defr="trans de:fr"
alias denl="trans de:nl"
alias ende="trans en:de"
alias esde="trans es:de"
alias frde="trans fr:de"
alias nlde="trans nl:de"

#go up dirs easily
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

#Terminal Commands GO

#Password creation: The reason there are so many is because in Eifer des Gefechts :D
alias randompw="pwgen -y 12"
alias randompw2="date +%s | sha256sum | base64 | head -c 12 ; echo"

alias du-sort="du -h ./ | sort -h"

alias jj="javac *.java && java "

alias wetter="curl -s wttr.in/buxtehude"
alias wetter1="curl -s 'http://wttr.in/buxtehude?format=3'"

# alias ftpkiel="lftp kiel@kiel.bplaced.net/www"
# alias ftppapa="lftp ftp293237-2548772@webhosting65.1blu.de/www"
# alias ftpkiel="lftp ftp358055-2777795@webhosting38.1blu.de/www"
alias ftpmft14="lftp ftp358055-2777795@webhosting38.1blu.de/www/mft14"
alias ftpduering="lftp praxisvp_0@praxisvonduering.de"
alias dbmft14="mycli -u s358055_3573017 -h mysql33.1blu.de db358055x3573017"


alias w3mgg="w3m 'https://google.de/search?q='"
alias ddg="w3m 'https://duckduckgo.com/?q='"
alias yt="ytfzf"
alias yta="ytfzf -m"

alias mysqlroot="mysql -u root -p"
alias mysql="mysql -p"

alias rsym="rsync -av --delete --info=progress2"

### Terminal

alias fehbg="feh --bg-fill"
alias pyserver="python3 -m http.server 8000"
alias phpserver="open http://localhost:8000 ; php -S localhost:8000 "
alias phpkiel="cd ~/Git/kkiel; php -S localhost:8000"

alias timeshiftbackup="timeshift --create --comments " 

#alias addmetoaudiovideogroup="sudo usermod -aG video audio mf14"

alias changegpuintel="sudo prime-select intel"
alias changegpunvidia="sudo prime-select nvidia"
alias changehostname="sudo hostnamectl set-hostname"

### Show me stuff:
alias showappname="xprop"
alias showcompositor="inxi -Gxx | grep compositor"
alias showdesktop="echo $XDG_SESSION_TYPE"
alias showdevices="lspci"

alias showdiskspace="df -H"
alias showdisktotalhours="sudo smartctl --all /dev/sda | grep Power_On_Hours"

alias showgraphiccard="lspci | grep -E \"VGA|Display\""
alias showmount="lsblk"
alias showsizedir="du -d 1 -h "
alias showuser="cat /etc/passwd"
alias showwifihardware="lspci -nnk | grep 0280 -A3"
alias showwifipassword="nmcli device wifi show-password"
alias showwifis="nmcli device wifi list"

alias showhowmanyfiles="ls | wc -l"
alias countfiles="ls | wc -l"

alias taskfind="ps -aux | grep "

alias chmodall="sudo chmod 777 "
alias chownall="sudo chown -R mf14:mf14 "

#Radio stuff
alias radiocltfm="mpv http://listener3.mp3.tb-group.fm/clt.mp3"
alias radioctfm="mpv http://listener1.mp3.tb-group.fm/ct.mp3"
alias radioeswing="mpv https://streamer.radio.co/s2c3cc784b/listen"
alias radiohbfm="mpv http://listener2.mp3.tb-group.fm/hb.mp3"
alias radiohtfm="mpv http://listener2.mp3.tb-group.fm/ht.mp3"
alias radiojazz="mpv 'https://www.youtube.com/watch?v=fEvM-OUbaKs' --no-video"
alias radiollll="mpv 'https://twitch.tv/lookslikelinklive' --no-video"
alias radioraii="mpv 'https://twitch.tv/raii90' --no-video"
alias radiorpfm="mpv http://listener3.mp3.tb-group.fm/rp.mp3"
alias radiortl="mpv http://streaming.radio.rtl.fr/rtl-1-44-128"
alias radiosemper="mpv 'https://twitch.tv/sempervideo' --no-video"
alias radiotbfm="mpv http://listener3.mp3.tb-group.fm/tb.mp3"
alias radiotrbfm="mpv http://listener2.mp3.tb-group.fm/trb.mp3"
alias radiottfm="mpv http://listener3.mp3.tb-group.fm/tt.mp3"

alias webcam="mpv  --profile=low-latency --untimed /dev/video0"
