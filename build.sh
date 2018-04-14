#!/bin/bash
set -e # Exit with nonzero exit code if anything fails

xelatex cv.tex
convert -density 500 -resize 1200 -background white -alpha remove cv.pdf cv.png