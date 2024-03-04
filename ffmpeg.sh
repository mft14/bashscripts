####### FFMPEG Functions



### make a quick gif from a video
ffgif() {
    # Change settings here
    fps=10
    scale="scale=320:-1"
    if [ $# -eq 0 ]; then
        echo "Usage: ffgif VIDEOFILE startseconds duration"
        echo "Example: ffgif video.mp4 2 5"
        echo "FPS: ${fps}"
        echo "${scale}"
    else
        filename="$1"
        extclear="${filename%.*}"
        ffmpeg -ss $2 -t $3 -i "$1" -vf "fps=${fps},${scale}:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 "${extclear}.gif"
    fi
}

### Convert any sound file to mp3 quickly
ffmp3() {
    if [ $# -eq 0 ]; then
        echo "Usage: ffmp3 [32mmp3file[0m"
        echo "This function converts any sound file to mp3"
    else
        filename="$1"
        extclear="${filename%.*}"
        ffmpeg -i "$1" -f mp3 "${extclear}.mp3" ;  
        echo "[32mSuccess![0m"
    fi
}

### Convert quicky to any sound file
ffconvert() {
    if [ $# -eq 0 ]; then
        echo "Usage: ffconvert FILE flac"
        echo "Example: converts given File to given file extension"
    else
        filename="$1"
        echo "Filename: ${filename}"
        extclear="${filename%.*}"
        echo "Extclear: ${extclear}"
        ffmpeg -i "$1" -f $2 "${extclear}.$2" ;
    fi
}

### Convert all files in a directory from format one to format two
ffconvertall() {
    if [ $# -eq 0 ]; then
        echo "Usage: ffconvertall wav flac"
        echo "Example: converts all wav to flac files in the current directory."
    else
        source_extension="$1"
        target_extension="$2"
        # directory="/path/to/source/directory"  # Change this to your source directory path
        directory="./"  # Change this to your source directory path

        for source_file in "$directory"/*"$source_extension"; do
            if [ -f "$source_file" ]; then
                # Generate the target file path by replacing the source extension
                target_file="${source_file%$source_extension}$target_extension"
                
                # Perform the conversion using ffmpeg
                ffmpeg -i "$source_file" "$target_file"

                echo "[32mSuccess:[0m"
                echo "Converted $source_file to $target_file"
            fi
        done
    fi
}

####### Video editing - Shrinking etc.
### Shrink a video to a smaller size (good for discord)
shrinkvideo() {
    if [ $# -eq 0 ]; then
        echo "Usage: convert_video input_file [options]"
        echo "-v = vertical (tiktoks) | -h = horizontal (normal landscape)"
    else
        input_file="$1"
        extclear="${input_file%.*}"

        if [ "$2" == "-v" ]; then
            # vf_filter="scale=-1:360"
            vf_filter="scale=360:720"
            output_file="${extclear}-vertical.mp4"
        elif [ "$2" == "-h" ]; then
            # vf_filter="scale=720:-1"
            vf_filter="scale=720:360"
            output_file="${extclear}-horizontal.mp4"
        else
            echo "Unknown option: $2"
            echo "Please use"
            echo "-v = vertical | -h = horizontal"
            echo "[31mScript closed[0m"
            #cancel
            return
        fi

    ffmpeg -i "${input_file}" -vf "${vf_filter}" "${output_file}"

    fi
}
