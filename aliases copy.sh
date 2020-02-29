#!/bin/bash
#################### SGI FTP ####################
# AVG size (zipped): 84Gb
# Estimated time for zipping: 
# Decompressed avg size: 115Gb
# Decompressing estimated time: 

ENTRY=$1
TIME=`date --date="today" +%H"h "%M"m "%S"seg "%d"-"%m"-"%Y`

# Preparation
if [ ! -d $MOUNT_NAS_SGIFTP ]; then
    mkdir -p $MOUNT_NAS_SGIFTP
fi

# Micro Functions and text
microaction(){
    mount -f 
}

funcion(){
    microaction1
    microaction2
}

--help(){
    echo "Type only:
         'mac' to do update macs aliases 
         'linux' to update aliases
         or 
         'go search for something else"
}

case "$ENTRY" in
    
    mac)
        funcion
    ;;
    linux)
        funcion2
    ;;
    *) --help
esac
