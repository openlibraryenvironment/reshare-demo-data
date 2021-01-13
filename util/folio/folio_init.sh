#!/bin/bash

PRDIR=$1

if [ -z $PRDIR ]; then
  echo "Usage: $0 <project root directory>"
fi

if [ ! -d $PRDIR ]; then
  echo "Root directory does not exist!"
fi

read -e -p "Institution code: " isil 
read -e -p "Institution name: " iname
read -e -p "Campus code (optional): " ccode
read -e -p "Campus name (optional): " cname
read -e -p "Library code (optional): " lcode
read -e -p "Library name (optional): " lname
read -e -p "Location prefix (optional): " prefix
read -e -p "Service point code (optional): " scode
read -e -p "Service point name (optional): " sname
read -e -p "Identifier name (optional): " idname

instdir=`echo $iname | tr '[:upper:]' '[:lower:]' | tr ' ' '-'`
fullpath="$PRDIR/$instdir"
if [ -e $fullpath ]; then
  echo "ERROR $fullpath already exists-- exiting..."
  exit;
fi
mkdir $fullpath

echo -e "{\n\
  \"institutionCode\": \"$isil\",\n\
  \"institutionName\": \"$iname\",\n\
  \"campusCode\": \"$ccode\",\n\
  \"campusName\": \"$cname\",\n\
  \"libraryCode\": \"$lcode\",\n\
  \"libraryName\": \"$lname\",\n\
  \"locationPrefix\": \"$prefix\",\n\
  \"servicePointCode\": \"$scode\",\n\
  \"servicePointName\": \"$sname\",\n\
  \"identifierName\": \"$idname\"\n\
}" > "$fullpath/config.json"

echo "Writing to $fullpath/config.json"
