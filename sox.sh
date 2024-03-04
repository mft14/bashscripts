
### Trim an audio easily using a range
soxtrim() {
    if [ $# -eq 0 ]; then
        echo "Usage: soxtrim input_file output_file"
        echo "Example: soxtrim input.mp3 output.mp3"
        echo "Example: soxtrim input.mp3 output.mp3 0:00 1:00"
    else

        input_file="$1"
        output_file="$2"
        trimstart="$3"
        trimend="$4"

        # read -p "Enter trim start time (m:ss): " trimstart
        # read -p "Enter trim end time (m:ss): " trimend

        if [ $trimstart = "0" ]; then
            trimstart="0:00"
        fi

        # minutes and seconds extract
        trimstart_mm=$(echo $trimstart | cut -d ':' -f 1)
        trimstart_ss=$(echo $trimstart | cut -d ':' -f 2)
        trimstart_mm_in_seconds=$((trimstart_mm * 60))
        trimstartseconds=$(((trimstart_mm * 60) + trimstart_ss))

        trimend_mm=$(echo $trimend | cut -d ':' -f 1)
        trimend_ss=$(echo $trimend | cut -d ':' -f 2)
        trimend_mm_in_seconds=$((trimend_mm * 60))
        trimendseconds=$(((trimend_mm * 60) + trimend_ss))

        subtracted_trimendseconds=$((trimendseconds - trimstartseconds))

        # convert subtracted_trimendseconds to mm:ss format
        subtracted_trimend_mm=$((subtracted_trimendseconds / 60))
        subtracted_trimend_ss=$((subtracted_trimendseconds % 60))

        if [ $subtracted_trimend_mm -lt 10 ]; then
            subtracted_trimend_mm="0$subtracted_trimend_mm"
        fi
        if [ $subtracted_trimend_ss -lt 10 ]; then
            subtracted_trimend_ss="0$subtracted_trimend_ss"
        fi

        trimend="${subtracted_trimend_mm}:${subtracted_trimend_ss}"

        echo "new trimend: $trimend"

        sox "$1" "$2" trim "$trimstart" "$trimend"
    fi
}

# Use to remove all silence from an audio file
soxsilence() {
if [ $# -eq 0 ]; then
    echo "Example:"
    echo "soxsilence input.mp3"
    echo "soxsilence input.mp3 -l (to listen to the file after trimming)"
else

    # when file is not .mp3, convert it to .mp3 with my custom function ffconvert
    if [[ $1 != *.mp3 ]]; then
        echo "Converting to mp3 first..."
        ffconvert $1 mp3
        # Get file name without extension
        input_file=$(echo $1 | cut -f 1 -d '.')
        input_file="$input_file.mp3"
    else
        input_file="$1"
    fi

    # green echo saying it is Trimming
    echo -e "\e[32mSilencing: $input_file\e[0m"

    sox $input_file trim_$input_file silence 1 0.1 1% -1 0.1 1%

    # add flag -l to listen to the file after trimming
    if [ "$2" = "-l" ]; then
        mpv trim_$input_file
    fi
fi
}

### quickly record 3cx calls
3cx() {
    DATETIME=$(date '+%F_%Hh%M')  

    # if 3cx folder doesn't exist, create it
    if [ ! -d "~/Documents/3cx" ]; then
        mkdir -p ~/Documents/3cx
        echo "Created 3cx folder"
    else
        echo "3cx folder exists"
    fi
    rec ~/Documents/3cx/${DATETIME}.mp3
}


### Open the last 3cx file I just created
3cxopenlast() {
    cd ~/Documents/3cx
    lastfile=$(ls -t | head -n1)
    echo "Opening last file: $lastfile"
    mpv $lastfile
}

### Delete the last 3cx file I just created
3cxdeletelast() {
    echo "Warning, you delete the following file:"
    ls -t ~/Documents/3cx | head -n1
    read -p "Are you sure? (y/n) " yn
    case $yn in
        [yY] ) echo "Deleting last file";
            cd ~/Documents/3cx
            rm $(ls -t | head -n1)
            break;;
        [nN] ) echo "Exiting...";
            break;;
        * ) echo "invalid response";;
    esac
}

### Listen to the last 3cx file I just created
3cxlistenlast() {
    cd ~/Documents/3cx
    lastfile=$(ls -t | head -n1)
    echo "Listening to last file: $lastfile"
    mpv $lastfile
}

### Trim the last 3cx file I just created
3cxtrimlast() {
    cd ~/Documents/3cx
    lastfile=$(ls -t | head -n1)
    echo "Silencing: $lastfile"

    read -p "Are you sure? (y/n) " yn

    case $yn in
        [yY] ) echo "Trimming last file";

            soxsilence $lastfile 

            # Create 3cxTrimmed folder if it doesn't exist
            if [ ! -d "~/Documents/3cxTrimmed" ]; then
                mkdir -p ~/Documents/3cxTrimmed
                echo "Created 3cxTrimmed folder"
            else
                echo "3cxTrimmed folder exists. Continuing..."
            fi
            mv trim_"$lastfile" ~/Documents/3cxTrimmed ;

            cd ~/

            mpv Documents/3cxTrimmed/trim_"$lastfile"

            break;;
        [nN] ) echo "Exiting...";
            break;;
        * ) echo "invalid response";;
    esac

}

### Record audio quickly in mp3
record() {
    DATETIME=$(date '+%F_%H-%M-%S')  
    rec ~/rec_${DATETIME}.mp3
}

