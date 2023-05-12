#!/bin/bash
echo "ClamAV quarantined files recover tool by Shrizt"
echo "May be adopted to other antivirus tools. Using regex to parse."
echo "Syntax is './clamav-recover.sh /dir/clamav.log --restore"

input=$1
restore=$2

if [ -z "$input" ]; then
  echo "No log file name set" 
fi

echo input log file:$input

i=0
while IFS= read -r line
do
 file1=$(echo "$line" | sed -n "s/\(.*\): moved to '\(.*\)'/\1/p")
 fileQ=$(echo "$line" | sed -n "s/\(.*\): moved to '\(.*\)'/\2/p")
 if ! [ "$fileQ" == "" ]; then
   ((i=i+1)) 

  if [ "$restore" == "--restore" ]; then
    echo "Restoring ${file1}..."
    mv "${fileQ}" "${file1}"
  else
   echo "file ${file1}";
   echo "moved to ${fileQ}";
 fi

done < "$input"

echo "Total files in log:$i"
echo "ClamAV quarantined files recover tool by Shrizt"
echo "Syntax is './clamav-recover.sh /dir/clamav.log --restore"

