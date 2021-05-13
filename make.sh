#!/usr/bin/env bash
rm -rf output/
rm -rf finals/
rm *.log

# Analysis
hackmyresume validate resume.json
hackmyresume analyze resume.json

# Website
nunjucks index.html resume.json -o . -e html -p templates --options nunjucks-html.json

# Resume
nunjucks resume.tex resume.json -o . -e tex -p latex --options nunjucks.json
xelatex resume.tex

# Cover
nunjucks cover.tex resume.json -o . -e tex -p "latex" --options nunjucks.json
xelatex cover.tex

# update LinkedIn: https://www.npmjs.com/package/node-linkedin
node ./normalize.js

mv resume.pdf ./John_Ailor.pdf
mv cover.pdf ./John_Ailor_cover.pdf
