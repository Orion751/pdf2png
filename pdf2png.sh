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

verbose=false

while getopts ":v" opt; do
    case $opt in
        v)
            verbose=true

            shift $((OPTIND-1))
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2

            exit 1
            ;;
    esac
done

pdfDirectory="$1"
newDirectory="$2"

if [ "$verbose" = true ]; then
    echo mkdir "$newDirectory"
fi

mkdir "$newDirectory"

for pdf in "$pdfDirectory"/*; do

    baseName=`basename $(echo "$pdf") .PDF`

    pdfImagesDir="$newDirectory/$baseName"

    if [ "$verbose" = true ]; then
        echo mkdir "$pdfImagesDir"
    fi

    mkdir "$pdfImagesDir"

    if [ "$verbose" = true ]; then
        echo pdfimages -all "$pdf" "$pdfImagesDir/$baseName"
    fi

    pdfimages -all "$pdf" "$pdfImagesDir/$baseName"

done

