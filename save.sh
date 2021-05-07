#!/bin/bash

echo "
 __ __  __  _      ____  ___ ___   ____   ____    ___      ______   ____  __  _    ___   ___   __ __  ______ 
|  |  ||  |/ ]    |    ||   |   | /    | /    |  /  _]    |      | /    ||  |/ ]  /  _] /   \ |  |  ||      |
|  |  ||  ' /      |  | | _   _ ||  o  ||   __| /  [_     |      ||  o  ||  ' /  /  [_ |     ||  |  ||      |
|  |  ||    \      |  | |  \_/  ||     ||  |  ||    _]    |_|  |_||     ||    \ |    _]|  O  ||  |  ||_|  |_|
|  :  ||     |     |  | |   |   ||  _  ||  |_ ||   [_       |  |  |  _  ||     \|   [_ |     ||  :  |  |  |  
 \   / |  .  |     |  | |   |   ||  |  ||     ||     |      |  |  |  |  ||  .  ||     ||     ||     |  |  |  
  \_/  |__|\_|    |____||___|___||__|__||___,_||_____|      |__|  |__|__||__|\_||_____| \___/  \__,_|  |__|  
                                                                                                             
";
echo "Begin...";

for file in "messages/"*
do

    if [ -d "$file" ]; then
        echo -e "Processing chat folder "$file
        mkdir "$file/images"
        for chat in "$file"/*
        do
            echo "Parsing chat file "$chat
            images=($(cat $chat | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%&:-]*" | sort -u | grep jpg))
            for img in $images
            do
                curl $img --output $file/images/$RANDOM.jpg --silent
            done
        done

    fi

done