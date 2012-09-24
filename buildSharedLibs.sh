#!/bin/bash
#Do we need to download the code from GitHub?
DOWNLOAD_GIT="FALSE"

#To download the latest tag
SAFE_TAG=("" "" "")

#To download a specific tag
#SAFE_TAG=("v1.1.2" "v1.2.8" "1.1.6")

LIBS=("Utilities ${SAFE_TAG[0]}" "CocosLib ${SAFE_TAG[1]}" "CocosTools ${SAFE_TAG[2]}")
rm -rf ~/Programming/SharedLibs
mkdir -p ~/Programming
mkdir -p ~/Programming/SharedLibs

for f in "${LIBS[@]}"; do
    set -- $f
    echo

    if [ "$DOWNLOAD_GIT" == "TRUE" ] ||  [ ! -d "$1" ]; then
	rm -rf "$1"
        git clone https://github.com/Panajev/"$1".git "$1"
    fi
    #echo "$1 $2"

    cd "$1"
    if [ "$DOWNLOAD_GIT" == "TRUE" ]; then
        if [ x"$2" != x ]; then
            echo Checking out tag "$2"
            git checkout -b localBranch_"$1" "$2"
        else
            echo Checking out latest version
        fi
    fi

    echo Processing "$1"_script
    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild clean -target "$1"_script
    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild build -target "$1"_script
    cd ..
done
