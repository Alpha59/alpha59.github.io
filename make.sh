#!/usr/bin/env bash
rm -rf output/
rm -rf finals/
rm *.log
cp -r ./templates/* ./

hackmyresume validate resume.json
hackmyresume analyze resume.json
nunjucks templates/index.html resume.json -o output/ -u --options nunjucks-html.json

mkdir ./output/awesome-cv/
cp -r ./awesome-cv/* ./output/awesome-cv/

nunjucks awesome-cv/resume.tex resume.json -o output/ -u --options nunjucks.json

for file in ./awesome-cv/resume/*
do
    nunjucks $file resume.json -o output/ -u --options nunjucks.json
done

mv ./output/awesome-cv/resume.html ./output/awesome-cv/resume.tex

for file in ./output/awesome-cv/resume/*.html
do
    mv "$file" ./output/awesome-cv/resume/"$(basename "$file" .html).tex"
done

cd ./output/awesome-cv
pwd
xelatex resume.tex

#pdflatex personal-cv/main.tex
#pdflatex awesome-cover/main.tex
#lualatex -interaction nonstopmode old-cv/resume.tex
#pdflatex superbland-cv/resume.tex

# update LinkedIn: https://www.npmjs.com/package/node-linkedin

cd ../../

node ./normalize.js

cp ./output/awesome-cv/resume.pdf ./John_Ailor.pdf
cp ./output/templates/index.html ./index.html

rm -rf output/
