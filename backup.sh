#!/usr/bin/env bash
# Script with defence from multi run

#!/usr/bin/env bash
FILE=/tmp/$(basename $0).pid

#if [ -e $FILE ]
#	then echo "$FILE exist probably the script is running"
#		 exit 2
#fi


if ( set -o noclobber; echo "$$" > "$FILE") 2> /dev/null;
then
    trap 'rm -f "$FILE"; exit $?' INT TERM EXIT
# ==== Run any job here ================
# For Example
       ls -ld ${FILE}
# ===================
   rm -f "$FILE"
   trap - INT TERM EXIT
else
   echo "The process is running. Failed to acquire FILE: $FILE."
   echo "Held by $(cat $FILE)"
fi