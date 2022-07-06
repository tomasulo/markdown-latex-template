#!/bin/bash
clear
pandoc -s -N --biblatex --listings --top-level-division=chapter --template=template.tex metadata.md content/*.md -o $1.tex
pdflatex $1.tex
biber $1
pdflatex $1.tex
pdflatex $1.tex
evince $1.pdf &