#!/bin/bash
## Simply copies the files in the directory this file is in
##to Server/local directory using rsync

LOCAL="/var/www/schemas/public_html"
#Files that are not to be deployed
EXCLUDE="NotToBeDeployed.txt"
SERVER="user@domain:/var/www/html/public_html/"
ERRORSTRING="Error. Please make sure you've indicated correct parameters"
if [ $# -eq 0 ]
    then
        echo $ERRORSTRING;
elif [ $1 == "live" ]
    then
        if [[ -z $2 ]]
            then
                echo "Running dry-run"
                rsync --dry-run -az --no-perms --force --delete --progress --exclude-from="$EXCLUDE"  ./ "$SERVER"
        elif [ $2 == "go" ]
            then
                echo "Running actual deploy"
                rsync -az --no-perms --force --delete --progress --exclude-from="$EXCLUDE"  ./ "$SERVER"
        else
            echo $ERRORSTRING;
        fi
elif [ $1 == "dev" ]
    then
                    echo "Running dev deploy to localhost"
                rsync -az --no-perms --force --delete --progress --exclude-from="$EXCLUDE"  ./ "$LOCAL"
elif [ $1 == "fetch" ]
    then
                    echo "Fetching website from server"
                rsync -az --no-perms --force --delete --progress --exclude-from="$EXCLUDE" "$SERVER" ./
fi