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

if [ -d "messages" ]; then
    for file in "messages/"*
    do
        if [ -d "$file" ]; then
            echo -e "   Processing chat folder $file"
            if [ -d "$file/images" ] 
                then
                    echo "   Images folder already exist. I'm gonna save there."
                else
                    echo "   Images folder not exist. Creating..."
                    mkdir "$file/images"
            fi

            for chat in "$file"/*
            do
                if [ -f "$chat" ] 
                    then
                        echo "   Parsing chat file $chat"
                        images=($(cat "$chat" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%&:-]*" | sort -u | grep jpg))
                        for img in "${images[@]}"
                        do
                            imageName=$RANDOM
                            echo "      Saving image: $imageName"
                            curl "$img" --output "$file"/images/"$imageName".jpg --silent
                        done
                fi
            done
        fi
        echo "Done."
    done

else
echo "Messages folder not found."
fi