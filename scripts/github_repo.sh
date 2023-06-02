## gihub repo create 
#! /bin/bash

####################
# Script to create repository in github using github cli
# 1. login into github using token 
# 2. Check the repo to be created
# 3. if repo didnt exists , it creates repo
##################


gh_repo_create() {
    # check repo exist
        check_repo=$(gh repo view $repoName)
        if [ $? != 0 ]; then # if repo doesnt exist. 
            echo "gh repo needs to created"
            gh repo create $repoName --public 
        else
          gh repo view $repoName
           echo "repo exists github already "
        fi
}


gh_login() {
    gh_auth_status=$(gh auth status)
    if [ $? == 0 ]; then
        echo "github logged in already "
    else
        echo "gh login required"
        gh auth login --with-token 
    fi
    
}


# main
repoName=$1
gh_login
gh_repo_create $repoName










