#!/bin/bash
#variables
counter=0
finished=1
newname=" $( date +"%Y%m%d%T" )"
##################
#start the script
##################

#Request name of a file
echo "Define the name of the file: "
#Input the name of a file
read filename $filename
#Confirm the name of the file name
echo "The name of the file is: $filename"
touch $filename.txt
#Multiple options to get the frequency
echo "Select the Frequency (in seconds)"
select frequency in "10" "60" "600"
do
echo "You selected the frequency: $frequency";
break;
done
#Validate if the folder archieved exists
echo "I will verify if the folder archieved exists"
if [ -d archieved ]
        then
        echo "The folder already exists"
fi

if [ ! -d archieved ]
        then
        mkdir archieved;
        echo "The folder was created"
fi

echo "The file $filename will be move to the folder archieved"

mv -i $filename.txt archieved/"$filename $newname".txt

echo "The file $filename.txt was renamed to $filename $newname with new permissions"
#chmod 600 /home/yhonathan/reports/archieved/$newname.txt";

until [ $finished -lt $counter ]; do
cp -r /home/yhonathan/reports/archieved/$newname.txt
echo "The file is updating so you have to wait"
sleep  $frequency;
let  counter=$counter+1
done