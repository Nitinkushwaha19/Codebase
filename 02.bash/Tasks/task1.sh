#!/bin/bash

# has NAME variable equal to your Name_Surname
NAME="Nitin_Kushwaha"

# sources vars file
source ./vars

# creates a folder with name from NAME variable
mkdir $NAME

# creates a file in created folder with name from FILE variable
touch ./${NAME}/${FILE}

# lists the contents of home folder and created folder
ls -l $NAME