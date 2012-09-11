#!/bin/bash

echo
echo 'Welcome to the cocos2d-iphone template installer (Cocos2D iOS + Box2D), CocosLib edition :).'

COCOS2D_VER='cocos2d 2.0-beta2'
SCRIPT_DIR=$(dirname $0)

COCOS2D_DST_DIR='cocos2d v2.x'

force=

usage(){
cat << EOF
usage: $0 [options]
 
Install / update templates for ${COCOS2D_VER}
 
OPTIONS:
   -f	force overwrite if directories exist
   -h	this help
EOF
}

while getopts "fhu" OPTION; do
	case "$OPTION" in
		f)
			force=1
			;;
		h)
			usage
			exit 0
			;;
		u)
			;;
	esac
done

# Make sure root is not executed
if [[ "$(id -u)" == "0" ]]; then
	echo ""
	echo "Error: Do not run this script as root." 1>&2
	echo ""
	echo "'root' is no longer supported" 1>&2
	echo ""
	echo "RECOMMENDED WAY:" 1>&2
	echo " $0 -f" 1>&2
	echo ""
exit 1
fi


copy_files(){
    SRC_DIR="${SCRIPT_DIR}/${1}"
	rsync -r --exclude=.svn "$SRC_DIR" "$2"
}

check_dst_dir(){
	if [ ! -d "$DST_DIR" ];  then
        echo "Please install Cocos2D's official templates first..."
        echo
        exit 1
	fi

    if [ -d "$DST_DIR"CocosLib.xctemplate ];  then
        if [ $force ]; then
            echo Deleting "$DST_DIR"CocosLib.xctemplate
            rm -rf "$DST_DIR"CocosLib.xctemplate
        else
            echo "Templates already installed. To force a re-install use the '-f' parameter"
            exit 1
        fi
    fi
}


print_template_banner(){
	echo ''
	echo ''
	echo ''
	echo "$1"
	echo '----------------------------------------------------'
	echo ''
}

# Xcode4 templates
copy_xcode4_project_templates(){
	TEMPLATE_DIR="$HOME/Library/Developer/Xcode/Templates/$COCOS2D_DST_DIR/"
    DST_DIR="$TEMPLATE_DIR"
    check_dst_dir

	print_template_banner "Installing Xcode 4 CocosLib iOS template"

	echo ...copying template files
	copy_files templates/Xcode4_templates/ "$DST_DIR"

	echo done!
}

# copy Xcode4 templates
copy_xcode4_project_templates

