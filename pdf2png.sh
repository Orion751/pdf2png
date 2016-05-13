#!/bin/bash

# syntax: pdf2pngzip <pdfdirectory> <newdirectory>

: '
make newDirectory

for pdf in pdfDirectory

    baseName=pdf (remove the last 4 characters)

    pdfImagesDir="$newdirectory/baseName"

    mkdir pdfImagesDir

    pdfimages "$pdf" "$pdfImagesDir/$baseName"

    for ppm in "$pdfImagesDir"
        convert "$ppm" "$ppm":s/pm$/ng/

        rm "$ppm"
'

pdfDirectory="$1"
newDirectory="$2"

echo "$pdfDirectory" "$newDirectory"

echo mkdir "$newDirectory"

