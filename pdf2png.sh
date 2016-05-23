#!/bin/bash

# syntax: pdf2pngzip <pdfdirectory> <newdirectory>

: '
Pseudocode

make newDirectory

for pdf in pdfDirectory

    baseName=basename "$pdf" (remove the last 4 characters)

    pdfImagesDir="$newdirectory/$baseName"

    mkdir "$pdfImagesDir"

    pdfimages "$pdf" "$pdfImagesDir/$baseName"

    for extractedImagePath in "$pdfImagesDir"
        convert "$extractedImagePath" `echo "$extractedImagePath" | sed 's/pm$/ng/'`

        rm "$extractedImagePath"
'

pdfDirectory="$1"
newDirectory="$2"

mkdir "$newDirectory"

for pdf in "$pdfDirectory"/*; do

    baseName=`basename $(echo "$pdf") .PDF`

    pdfImagesDir="$newDirectory/$baseName"

    mkdir "$pdfImagesDir"

    echo pdfimages -all "$pdf" "$pdfImagesDir/$baseName"

    pdfimages -all "$pdf" "$pdfImagesDir/$baseName"

done

