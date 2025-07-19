#!/bin/bash

dmepath=""
retval=1

for var
do
	if [[ $var != -* && $var == *.dme ]]
	then
		dmepath=`echo $var | sed -r 's/.{4}$//'`
		break
	fi
done

if [[ $dmepath == "" ]]
then
	echo "No .dme file specified, aborting."
	exit 1
fi

if hash DreamMaker 2>/dev/null
then
	#DreamMaker -max_errors 0 $dmepath.dme 2>&1 | tee result.log
 	bash tools/build/build.sh 2>&1 | tee result.log
	retval=$?
	if ! grep '\- 0 errors, 0 warnings' result.log
	then
		retval=1 #hard fail, due to warnings or errors
	fi
else
	echo "Couldn't find the DreamMaker executable, aborting."
	exit 3
fi

exit $retval
