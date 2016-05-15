#!/bin/bash

# syntax: pdf2pngzip <pdfdirectory> <newdirectory>

: '
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

    pdfimages "$pdf" "$pdfImagesDir/$baseName"

    for extractedImagePath in "$pdfImagesDir"/*; do

        if [ ${extractedImagePath:(-4)} = ".ppm" ]; then

            convert "$extractedImagePath" `echo "$extractedImagePath" | sed 's/pm$/ng/'`

            rm "$extractedImagePath"

        else
            echo "Error: $extractedImagePath is not a .ppm file!"
        fi

    done

done

