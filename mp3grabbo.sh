#!/bin/bash
mp3grabbo() {
    output=~/Musique #your path where the mp3 will be stored
    makefolderfromalbum=true # change to false if you do not want to create folders based on the album tag name
    normalizeAudio=true # change to false if you do not want to normalize the audio

    # Requirements = sudo apt install mp3gain sox libsox-fmt-mp3 ffmpeg id3v2 python3 -y; pip3 install --upgrade yt-dlp;  
    #Variables
    #
    # Updated on :fulldate
    # 2023-12-16//6 - 21h52 - sox trim working within a certain area
    # 2023-09-24//7 - 20h05 - added album to folder function
    # 2023-07-06//4 - 15h28 - added sox trim
    # 2023-02-18//6 - 18h32 - added "save as" prompt
    # Created mp3grabbo 
    # by Karim Kiel

    ######################################## START

    while true; do
    read -p "Do you want to store the mp3 to -- $output -- (y/n) " yn
    case $yn in
        [yY] ) break;;
        [nN] ) echo exiting...;
               output=~/
               break;;
        [qQ] ) exit 0;;
        * ) echo "\e[31mInvalid response\n\e[0m";;
    esac
    done

    echo "----------------------------------------"
    echo "Your song will be saved in"
    echo "[32m $output [0m"

    while true; do
    read -p "Does the audio need to be trimmed? -- (y/n) " yn
    case $yn in
        [yY] ) trim=1
               break;;
        [nN] ) trim=0
               break;;
        [qQ] ) exit 0;;
        * ) echo "\e[31mInvalid response\e[0m";;
    esac
    done

    # if trimming is needed, then here
    if [ $trim -eq 1 ]; then
        read -p "[32mOK the audio will be trimmed. Insert the start in seconds (for example: 0 or 0:01):[0m " trimstart
        if [ $trimstart = "0" ]; then
            trimstart="0:00"
        fi
        # setting trimstart and trimend here
        echo "Trimming starts at $trimstart"
        read -p "[32mNow enter the end of the song in seconds. (for example: 2:24):[0m " trimend
        echo "Trimming ends at $trimend"

        # minutes and seconds extract
        trimstart_mm=$(echo $trimstart | cut -d ':' -f 1)
        trimstart_ss=$(echo $trimstart | cut -d ':' -f 2)
        trimstart_mm_in_seconds=$((trimstart_mm * 60))
        trimstartseconds=$(((trimstart_mm * 60) + trimstart_ss))
        trimend_mm=$(echo $trimend | cut -d ':' -f 1)
        trimend_ss=$(echo $trimend | cut -d ':' -f 2)
        trimend_mm_in_seconds=$((trimend_mm * 60))
        trimendseconds=$(((trimend_mm * 60) + trimend_ss))
        # subract trimendseconds from trimstartseconds
        subtracted_trimendseconds=$((trimendseconds - trimstartseconds))
        # convert subtracted_trimendseconds to mm:ss format
        subtracted_trimend_mm=$((subtracted_trimendseconds / 60))
        subtracted_trimend_ss=$((subtracted_trimendseconds % 60))
        # add leading zero if necessary
        if [ $subtracted_trimend_mm -lt 10 ]; then
            subtracted_trimend_mm="0$subtracted_trimend_mm"
        fi
        if [ $subtracted_trimend_ss -lt 10 ]; then
            subtracted_trimend_ss="0$subtracted_trimend_ss"
        fi
        #new trimend
        trimend="${subtracted_trimend_mm}:${subtracted_trimend_ss}"

        echo "Your songlength is $trimend"

    else 
        echo "[32mNo trimming necessary![0m"
        echo ""
    fi

    # Checking if the path exists
    if [ -d "$output" ]; then 
        echo "----------------------------------------"
        echo "Your path $output exists!" 
    else
        echo "Your path $output does not exist."
        echo "Your file will be moved into your home directory."
        output=~/
    fi

    # Asking the tags
    echo "----------------------------------------"
    echo "MP3-Grabbo makes your song ready for your MP3 collection! "
    echo "----------------------------------------"

    # Asking for user input
    while true; do
        read -r -p "YouTube URL: " url
        if [ $url = 'q' ]; then 
            exit 0
        fi

        if echo "$url" | grep -q "https://"; then
          break;
        else
          echo "\e[31mURL is not valid. Please enter one with \"https://\" or exit with q\e[0m"
        fi
    done

    read -r -p "Artist: " artist
    read -r -p "Title: " title

    #Show folders colorized
    echo "--------------------"

    if [ "$makefolderfromalbum" = "true" ]; then #If folders should be created
        showalbumfolder="$(ls $output*) "
        echo "[32m$showalbumfolder[0m" ;
        echo "Here a list of your folders serving as album names ="
    fi

    read -r -p "Album: " album
    read -r -p "Genre: " genre
    echo "--------------------"

    # set filename
    file="$artist - $title"
    filemp3="$artist - $title.mp3"

    echo "Now downloading -->  $artist - $title"
    echo "in album: \"$album\""

    ######### Running Process #########
    echo "\n\n----------------------------------------"
    echo "Downloading song from YouTube"
    echo "----------------------------------------"
    yt-dlp --extract-audio -o "$file.%(ext)s" $url

    echo "\n\n----------------------------------------"
    echo "Converting file to mp3 using ffmpeg"
    echo "----------------------------------------"

    if [ -f "$file.opus" ]; 
    then 
        ffmpeg -i "$file.opus" -f mp3 "$filemp3"  
        rm "$file.opus"
    elif [ -f "$file.webm" ]; 
    then 
        ffmpeg -i "$file.webm" -f mp3 "$filemp3"  
        rm "$file.webm"
    elif [ -f "$file.m4a" ]; 
    then 
        ffmpeg -i "$file.m4a" -f mp3 "$filemp3"  
        rm "$file.m4a"
    elif [ -f "$file.mp3" ]; 
    then 
        echo "File already mp3"
    #possible video formats
    elif [ -f "$file.mp4" ]; 
    then 
        ffmpeg -i "$file.mp4" -f mp3 "$filemp3"  
        rm "$file.mp4"
    else
        echo "The converted file is not supported but you can add it to the list!"
    fi

    if [ "$normalizeAudio" = "true" ]; then
        echo "\n\n----------------------------------------"
        echo "Normalizing Audio using MP3gain"
        echo "----------------------------------------"
        mp3gain -r -d 3 -p "$filemp3"
    else 
        echo "\n\n----------------------------------------"
        echo "Skipping Audio Normalization"
        echo "----------------------------------------"
    fi

    if [ $trim -eq 1 ]; then
        echo "\n\n----------------------------------------"
        echo "Trimming Audio from $trimstart - $trimend"
        echo "----------------------------------------"
        #trim audio using sox

        sox "$filemp3" "trimmed.mp3" trim $trimstart $trimend
        #rename old filename
        rm "$filemp3" 
        mv "trimmed.mp3" "$filemp3"
    else 
        echo "\n\n----------------------------------------"
        echo "No Audio Trimming necessary"
        echo "----------------------------------------"
    fi

    echo "\n\n----------------------------------------"
    echo "Setting MP3 Tags using id3v2"
    echo "----------------------------------------"
    id3v2 "$filemp3" -a "$artist" -t "$title" -A "$album" -g "$genre" 

    echo "\n\n----------------------------------------"
    echo "Moving your file to $output in $album"

    if [ "$makefolderfromalbum" = "true" ]; then #If folders should be created
        outputalbum="$output/$album" ; #create the new path with adding the album name at the end
        if [ -d "$outputalbum" ]; then 
            echo "[32mThe album directory $album exists! Moving the song to $outputalbum ![0m" 
            mv "$filemp3" "$outputalbum" 
        else 
            #when the album folder name is not existent, it will be created
            echo "[31mThe album directory does not exist. But do not worry, it will be created[0m"
            mkdir -p "$outputalbum"
            echo "[32mSuccessfully created the path $outputalbum! [0m"
            mv "$filemp3" "$outputalbum" 
        fi
    else #Otherwise just put it into your $output folder
        mv "$filemp3" "$output" 
    fi

    echo "----------------------------------------"
    echo "\e[32mDone. Enjoy listening $file\e[0m"
}
