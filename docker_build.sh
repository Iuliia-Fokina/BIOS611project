#!/bin/bash
./Container.sh 
docker build . -t bios611pr
#check if the display variable is set
if [ -z "$DISPLAY" ]; then
echo "error: display environment variable is not set"
exit 1
fi
if [ $? -ne 0 ]; then
    echo "Error: Failed to run the first script."
    exit 1
fi
echo "Starting container."
echo "Open localhost:8787 to view RStudio. Username: rstudio, password: login"
echo "Files found under '/home/rstudio/working'."
#get the current directory
CURRENT_DIR=$(pwd)
CONT=$(docker run --rm -tidp 8787:8787 -v .:/home/rstudio/working alectries/univr)  # when creating a new Dockerfile, change to .
docker exec -ti $CONT /bin/bash


