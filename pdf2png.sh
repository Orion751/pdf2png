#!/bin/bash

# syntax: pdf2pngzip <pdfdirectory> <newdirectory>

: '
make newDirectory

for pdf in pdfDirectory

    baseName=pdf (remove the last 4 characters)

    pdfImagesDir="$newdirectory/baseName"

    mkdir "$pdfImagesDir"

    pdfimages "$pdfDirectory/$pdf" "$pdfImagesDir/$baseName"

    for ppmPath in "$pdfImagesDir"
        convert "$ppmPath" "$ppmPath":s/pm$/ng/

        rm "$ppmPath"
'

pdfDirectory="$1"
newDirectory="$2"

echo "$pdfDirectory" "$newDirectory"

echo mkdir "$newDirectory"

for f in "$pdfDirectory"/*; do
    echo "$f"

done

