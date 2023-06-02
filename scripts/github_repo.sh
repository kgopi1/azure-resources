## gihub repo create 


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
        #gh auth login --with-token <token.txt
    fi
    
}

# az_login() {
#     az_login_status=$(az account show)
#     if [ $? == 0 ]; then
#         echo "logged in"
#     else
#         echo "az login required"
#         az login --use-device-code
#     fi
    
# }

# main
repoName=$1
gh_login
gh_repo_create $repoName










