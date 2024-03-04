carmusic() {
    drives=("CARMUSIC" "CARMUSIC2" "steamdeck")

    for drive in "${drives[@]}"; do

        DIR=/media/mf14/$drive

        if [ -d "$DIR" ]; then 
            if [ "$drive" == "steamdeck" ]; then
                echo "----------------------------------------------"
                echo "[32mPutting music to $drive[0m"
                rsync -av --delete --exclude '.debris'\
                    "/home/$USER/Musique/" \
                    "/media/$USER/$drive/Musique/";
            else
                echo "----------------------------------------------"
                echo "[32mPutting music to $drive[0m"
                rsync -av --delete --exclude '.debris'\
                    "/home/$USER/Musique/" \
                    "/media/$USER/$drive/";
            fi
        else
            echo "----------------------------------------------"
            echo "[31mDrive $DIR isn't mounted - skipped[0m"
        fi
    done
    # rsync -a --exclude={'file1.txt','dir1/*','dir2'} src_directory/ dst_directory/
}

sync() {

    read -p "Press 1 for local backup, 2 for NAS backup: " yn
    if [ "$yn" == "1" ]; then
        drives=("ssd980" "evo" "mf_reaper" "hm80stick" "mft1" "tablet_sd")
    elif [ "$yn" == "2" ]; then
        drives=("mfnas/mf14")
    else
        echo Wrong input...
    fi

    paths=("Bitwig Studio" "Sync" "Musique" "Git")
    # paths=("Bitwig Studio")
    # drives=("mfnas/mf14" "ssd980" "evo" "mf_reaper" "hm80stick" "mft1" "tablet_sd")
    # drives=("mfnas/mf14" "ssd980")


    for drive in "${drives[@]}"; do

        DIR=/media/mf14/${drive}

        if [ -d "$DIR" ]; #if drive te
        then # then backup
            for path in "${paths[@]}"; do

                echo "[32mBackingup $path to location = $drive[0m";

                rsync -a --exclude={'.debris','.stfolder'} \
                    "/home/$USER/$path/" \
                    "/media/$USER/$drive/backup/${path}_e/";

                echo "[32mMirroring $path to location = $drive[0m";

                rsync -a --delete --exclude={'.debris','.stfolder'} \
                    "/home/$USER/$path/" \
                    "/media/$USER/$drive/backup/$path/";

                echo "----------------------------------------------"

            done # for loop paths
        else
            echo "[31m$drive isn't mounted - skipped[0m"
        fi
    done # for loop drives

    # rsync -a --exclude={'file1.txt','dir1/*','dir2'} src_directory/ dst_directory/
}

backup() {
    echo "what to rsync today"
    echo "1. Sync, Mega, Gits backups"
    echo "2. NAS backups"
    echo "3. Configs "
    echo "4. Carmusic "
    echo "q. Exit"
    read -p "Your backup: " auswahl
    case $auswahl in
        ############ BACKUP usual rsyncs
        1)
            sync ;;

        ############ BACKUP NAS Stuff
        2)
            echo "NAS Backups"
            ;;
        3)
            configs
            ;;
        4)
            carmusic ;;
        q)
            exit
            ;;
        *)
            echo "Unknown option"
            ;;
    esac
}

configs() {
    echo "1. Restore "
    echo "2. Backup "
    echo "q. exit"
    read -p "What to do: " auswahl
    case $auswahl in
        ############ BACKUP usual rsyncs
        1)
            if [ "$1" == "renoise" ]; then
                    rsync -av --delete ~/MEGA/Renoise/renoiseconfig/V3.4.2/ ~/.config/Renoise/V3.4.2/ ;
                elif [ "$1" == "doublecmd" ]; then
                    rsync -av --delete  ~/Git/configs/doublecmd/ ~/.config/doublecmd/
                elif [ "$1" == "gimp" ]; then
                    rm ~/.config/GIMP/2.10/menurc ; 
                    cp ~/Git/configs/gimp/menurc  ~/.config/GIMP/2.10/ ; 
                    rm ~/.config/GIMP/2.10/sessionrc ; 
                    cp ~/Git/configs/gimp/sessionrc  ~/.config/GIMP/2.10/ ;
                else
                    echo "Unknown option: $1"
                    exit 1
            fi
         ;; #1 case end
        2)
            read -p "Do you want to backup and not restore? (y/n) " yn
            case $yn in
                [yY] ) 
                    echo ok, we will proceed;

                    break;;
                [nN] ) 
                    echo exiting...;
                    exit;;
                * ) echo invalid response;;
            esac

             ;; #2 case end
        q) exit ;;
    esac
}


    ####################
    ## Manual config backups
    ## Renoise Config
    #alias renoiseconfig_backup="rsync -av --delete ~/.config/Renoise/V3.4.2/ ~/MEGA/Renoise/renoiseconfig/V3.4.2/ ;"
    #alias renoiseconfig_restore="rsync -av --delete ~/MEGA/Renoise/renoiseconfig/V3.4.2/ ~/.config/Renoise/V3.4.2/ ;"
    #alias doublecmd_backup="rsync -av --delete ~/.config/doublecmd/ ~/Git/configs/doublecmd/"
    #alias doublecmd_restore="rsync -av --delete  ~/Git/configs/doublecmd/ ~/.config/doublecmd/"
    #alias gimp_backup="rm ~/Git/configs/gimp/menurc ; cp ~/.config/GIMP/2.10/menurc ~/Git/configs/gimp/; rm ~/Git/configs/gimp/sessionrc ; cp ~/.config/GIMP/2.10/sessionrc ~/Git/configs/gimp/;"
    #alias gimp_restore="rm ~/.config/GIMP/2.10/menurc ; cp ~/Git/configs/gimp/menurc  ~/.config/GIMP/2.10/ ; rm ~/.config/GIMP/2.10/sessionrc ; cp ~/Git/configs/gimp/sessionrc  ~/.config/GIMP/2.10/ ;"
    #alias nextcloud_backup="rsync -av --delete ~/Nextcloud /media/mf14/mf_reaper/Backup/"
