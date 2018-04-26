#!/bin/sh
sed -i \
         -e 's/#D8D8D8/rgb(0%,0%,0%)/g' \
         -e 's/#000000/rgb(100%,100%,100%)/g' \
    -e 's/#D8D8D8/rgb(50%,0%,0%)/g' \
     -e 's/#8b9440/rgb(0%,50%,0%)/g' \
     -e 's/#FFFFFF/rgb(50%,0%,50%)/g' \
     -e 's/#1A1A1A/rgb(0%,0%,50%)/g' \
	*.svg
