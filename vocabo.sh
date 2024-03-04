vocabo() {
    # Path to the CSV file with the vocabulary
    csv_file="/home/mf14/Git/lesnotes/flashcards/francais_letsplay.csv"

    #if flag -h , help
    if [ "$1" == "-h" ]; then
        echo "Print a random vocabulary from a csv file"
        echo ""
        echo "Usage: vocabo [OPTION]"
        echo "OPTIONS:"
        echo "  -a    Add a new vocabulary to the end of file"
        echo "  -h    Print this help"
        echo " --tail    Show the last 10 lignes of the csv file"
        echo " --head    Show the first 10 lignes of the csv file"
        echo " --all     Show all the lignes of the csv file"
        echo "Recommend usage: Add vocabo at the end of your bashrc file to get a daily vocabulary"


    elif [ "$1" == "--tail" ]; then # show tail of csv file with --tail
        tail "$csv_file"
    elif [ "$1" == "--head" ]; then # show head of csv file with --head
        head "$csv_file"
    elif [ "$1" == "--all" ]; then # show all the csv file with --all
        cat "$csv_file"

    elif [ "$1" == "-a" ]; then
        # General input
        read -p "Question: " voc1
        read -p "Answer: " voc2

        #search if the question already exists
        grep -q "$voc1" "$csv_file"
        if [ $? -eq 0 ]; then
            echo "The question already exists"
            echo "Do you want to add it anyway?"
            read -p "y/n: " answer
            if [ "$answer" == "n" ]; then
                exit 1
            else
                echo "Adding the question anyway"
                # add to the file
                echo "${voc1};${voc2}" >> "$csv_file"
            fi
        fi
    else # no option

        #if no argument, print a random line
        if [ "$1" == "" ]; then

            num_lines=$(wc -l < "$csv_file") # get the number of lines
            random_line=$((RANDOM % num_lines + 1)) # get a random line

            # echo in green
            # echo -e "\e[32mVoc of the day: \e[0m"
            
            sed -n "${random_line}p" "$csv_file" # print the random line
            echo "";
        else # if wrong argument
            echo "Invalid argument"
        fi
    fi # end of main if
}
