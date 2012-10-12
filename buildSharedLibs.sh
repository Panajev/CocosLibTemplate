#!/bin/bash
#Do we need to force the script to download the code from GitHub?
DOWNLOAD_GIT="FALSE"

#To download the latest tag
SAFE_TAG=("" "" "" "" "" "")

#To download a specific tag
#SAFE_TAG=("v1.1.2" "v1.2.8" "v1.1.6" "v1.0.0" "v1.0.0" "v1.0.1")

LIBS=("Utilities ${SAFE_TAG[0]}" "CocosLib ${SAFE_TAG[1]}" "CocosTools ${SAFE_TAG[2]}" "PRKit ${SAFE_TAG[3]}" "SneakyInput ${SAFE_TAG[4]}" "CCItemsScroller ${SAFE_TAG[5]}")
rm -rf ~/Programming/SharedLibs
rm -rf ~/Programming/SharedLibsMac
mkdir -p ~/Programming
mkdir -p ~/Programming/SharedLibs
mkdir -p ~/Programming/SharedLibsMac

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
    echo iOS build
    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild clean -target "$1"_script
    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild build -target "$1"_script

    echo MacOS X build
    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild clean -target "$1"Mac_script
    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild build -target "$1"Mac_script

    cd ..
done
