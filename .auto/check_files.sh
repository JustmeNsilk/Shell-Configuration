#!/usr/bin/bash

printf "Checking for synthax errors...\n"
shellcheck ~/.auto/
printf "Done !\n"
printf "Copying all the files inside the correct repository...\n"
cp ~/.auto/* ~/Shell-Configuration
printf "All done !\n"
