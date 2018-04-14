#!/bin/bash

sh 'xelatex cv.tex'
convert -density 500 -resize 1200 -background white -alpha remove cv.pdf cv.png