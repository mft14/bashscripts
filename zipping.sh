####### zipping unzipping
pack() {
    if [ $# -eq 2 ]; then
        folder_name="$1"
        archive_type="$2"
        
        # Remove trailing slash if present
        folder_name="${folder_name%/}"
        
        if [ -d "$folder_name" ]; then
            archive_filename="${folder_name}.${archive_type}"
            archive_args=""
            
            case "$archive_type" in
                "tar.gz")   archive_args="-czvf";;
                "tar.bz2")  archive_args="-cjvf";;
                "tar.xz")   archive_args="-cJvf";;
                "zip")      archive_args="-r";;
                *)          echo "Unsupported archive type: $archive_type"; return;;
            esac

            if [ "$archive_type" = "zip" ]; then
                zip -r "$archive_filename" "$folder_name"
            else
                tar "$archive_args" "$archive_filename" "$folder_name"
            fi
            
            echo "[32mFolder '$folder_name' ----> '$archive_filename'.[0m"
        else
            echo "[31mError: Folder '$folder_name' not found.[0m"
        fi
    else
        echo "Usage: archive_folder folder_name archive_type"
        echo "Supported archive types: tar.gz, tar.bz2, tar.xz, zip"
    fi
}

unpack() {
    echo ""
    usagetext="[32mUsage: unpack ARCHIVE[0m - This will unzip all files in the name of the package"
    usagetext2="[32mUsage: unpack ARCHIVE NAME_OF_(NEW)DIR[0m - creating new folder or use an existing one"

    if [ $# -eq 0 ]; then #no args = explanation
        echo ${usagetext}
        echo ${usagetext2}
        return
    elif [ $# -eq 1 ]; then #1 arg: will extract files with name of the archive and setting "extract" before 
        archive_file="$1"
        extract_dir="extract-${archive_file}"
        mkdir ${extract_dir}

    elif [ $# -eq 2 ]; then #2 args: will either create a new folder or use an existing one to extract
        archive_file="$1"
        extract_dir="$2"

        if [ -d "${extract_dir}" ]; then 
            echo "Dir exists" 
        else
            echo "${extract_dir} doesn't exist. Creating now."
            mkdir ${extract_dir}
        fi  
    else #When there are too many arguments
        echo "[31mToo many arguments[0m"
        echo ${usagetext}
        echo ${usagetext2}
        return
    fi

    if [ -f "$archive_file" ]; then
        case "$archive_file" in
            *.zip)      unzip "$archive_file" -d "$extract_dir";;
            *.tar.gz)   tar -xzvf "$archive_file" -C "$extract_dir";;
            *.tar.bz2)  tar -xjvf "$archive_file" -C "$extract_dir";;
            *.tar.xz)   tar -xJvf "$archive_file" -C "$extract_dir";;
            *)          echo "Unsupported archive format: $archive_file"; return;;
        esac
    else 
            echo "Error: Archive '$archive_file' not found."
    fi
}


