
# git aliases
alias gitst="git status ; git log -1"
alias gitdi="git diff ."
alias gitcom="git add . ; git commit -m "
alias gitconfig="git config --global user.name mft14; git config --global user.email metalfort14@gmail.com"
alias gitcomamend="git commit --amend --no-edit"

# Quick status, add, commit and push in one command
gitall() {
    git status; git add .; git commit -m " $1 "; git push;
}

# git status for all repos in ~/Git
gitstall() {
     for repo in ~/Git/*; do
        echo "----------------------------------------------";
        echo "[32mChecking $repo[0m"
        cd $repo && git status;
    done # for loop end
    # reminder that you are back at home
    cd ~/Git
    echo "[31mAttention: You are now back at ~/Git[0m"
}

# git pull and push for all repos in ~/Git
gitpu() {
    for repo in ~/Git/*; do
        echo "----------------------------------------------";
        echo "[32m$repo[0m"
        cd $repo && git pull && git push;
    done
    # reminder that you are back at home
    cd ~/Git
    echo "[31mAttention: You are now back at ~/Git[0m"
}

### git init for new repos
gitinit() {
    #To use for yourself, edit your username here
    cd ~/Git
    user=mft14
    echo -e "\e[31mCheck your correct directory! You are now in Git \e[0m"
    echo -e "\e[31mCheck if your git configs are set (my alias: gitconfig) \e[0m"

    # small explanation
    echo "How to use: Create a new blank repo on Github (public or private)"
    echo "DON'T add the README within Github, create it locally in your new repo!"
    echo "Then create a new folder locally with the exact same name as your new repo"
    echo "Then continue this script."
    echo "----------------------------------------------";

    read -r -p "Enter your github token: " token
    read -r -p "Enter your new repository name: " repo

    # CD into the new folder to prevent errors
    cd $repo ;

    # now do the git init and push
    git init ;
    git add . ;
    git commit -m "First commit"
    git branch -M main ;
    git remote add origin https://$token@github.com/$user/$repo.git ;
    git push -u origin main
}
