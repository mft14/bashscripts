# Image Magick functions I use



#TODO Auswahlmenü Prozentzahl

### Shrink images to 30% of original size (sonyzve is my Sony ZVE-10 camera)
shrinksonyzve10-images() {
    mogrify -resize 30% *.JPG
}

### Shrink images to 50% of original size
shrinkallimages50() {
    mogrify -resize 50% *.$1
}

### convert all images in a directory to a different format
imageconvertall() {
    # if no argument, explain usage
    if (( $# != 2 )); then
        echo "Usage: imageconvertall <oldformat> <newformat>"
        return
    else
        echo "Converting all *.$1 to *.$2"
    fi

    mogrify -format $2 *.$1 
}

# this was just an automated script to convert my donald comics from syncnthing over mobile phone to my server
donaldconvert() {
    mogrify -resize 1200x *.jpg ;
    convert *.jpg $1.pdf ;
    rm *.jpg ;
    mv $1.pdf ~/Images/DonaldDuck ;
    # mv $1.pdf ~/Sync/images/DonaldDuck ;
}

