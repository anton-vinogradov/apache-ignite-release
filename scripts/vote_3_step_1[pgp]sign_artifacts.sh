#!/usr/bin/env bash

now=$(date +'%H%M%S')
logname="vote_3_${now}.log"

list=$(find ./svn/vote -type f -name "*.zip")

echo $list

for zip in $list
do
    echo "Signing ${zip}"
	echo $zip >> ./$logname

    gpg -ab $zip >> ./$logname
done

result="Signed OK."

while IFS='' read -r line || [[ -n "$line" ]]; do
    if [[ $line == *ERROR* ]]
    then
        result="Signing failed. Please check log file: ${logname}."
    fi
done < ./$logname

echo $result

echo " "
echo "======================================================"
echo "Artifacts should be signed"
echo "Please check results at ./svn/vote"
echo "Each zip should have corresponding *.asc file"