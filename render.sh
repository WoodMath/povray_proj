#!/bin/bash

for CODE in $@
do


#gcc -lGL -lglut $CODE.c -o $CODE
#g++ $CODE.cpp -o $CODE -lm -lGL -lGLU -lglut

#gcc -lGL -lglut test.c -o test
#g++ $CODE.cpp -o $CODE -I/opengl/downloads/OpenGL-tutorial_v0012_21 -lm -lGLEW -lGL -lGLU -lglut -lglfw 
#g++ $CODE.cpp -o $CODE -I../ -lm -lGLEW -lGL -lGLU -lglut -lglfw 
#gcc -o wand `pkg-config --cflags --libs MagickWand` wand.c
#chmod a+x $CODE

#cd ./Dropbox/cse3320/Assignment05/lab05
#cd ~/Dropbox/rt_proj/deadmau5

povray +L"/home/jeff/Dropbox/rt_proj/include_library/" +A0.3 +w800 +h600 +I$CODE.pov +O$CODE.png
	RTRN=$?
	echo "Reurn Code of $RTRN"
	if [ $RTRN -eq 0 ];
	then
		echo "Success"

		if [ "$(uname)" == "Darwin" ]; then
			# Do something under Mac OS X platform        
			echo "Operating system is $(uname)"
			open $CODE.png
		elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
			# Do something under GNU/Linux platform
			echo "Operating system is $(uname)"
			ristretto $CODE.png
		elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
			# Do something under Windows NT platform
			echo "Operating system is $(uname)"
		fi


	fi

#export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
done
#ls -l -r -t

