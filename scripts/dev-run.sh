#!/bin/sh
app="gql-server"
src="$srcPath/$app/$pkgFile"

printf "\nStart running: $app\n"
# Set all ENV variable for the server to run
export $(grep -v '^#' .env | xargs)
time /$GOPATH/bin/realize start run
# This should unset all the ENV var, just incase
export $(grep -v '^#' .env | sed -E 's/(.*)=.*/\1/' | xargs)
printf "\nStopped running: $app\n\n"