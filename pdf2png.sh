#!/bin/bash

# syntax: pdf2pngzip <pdfdirectory> <newdirectory>

: '
make newDirectory

for pdf in pdfDirectory

    baseName=basename "$pdf" (remove the last 4 characters)

    pdfImagesDir="$newdirectory/$baseName"

    mkdir "$pdfImagesDir"

    pdfimages "$pdf" "$pdfImagesDir/$baseName"

    for ppmPath in "$pdfImagesDir"
        convert "$ppmPath" `echo "$ppmPath" | sed 's/pm$/ng/'`

        rm "$ppmPath"
'

pdfDirectory="$1"
newDirectory="$2"

echo "$pdfDirectory" "$newDirectory"

echo mkdir "$newDirectory"

for pdf in "$pdfDirectory"/*; do

    baseName=`basename $(echo "$pdf") .PDF`
    echo "$pdf"
    echo "$baseName"

done

