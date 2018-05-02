"use strict";
const flatten = require('flat')
const fs = require("fs");
const resume = JSON.parse(fs.readFileSync("resume.json"));
const resume_strict = Object.assign({}, resume);

['work', 'education', 'volunteer', 'project'].map((ty) =>
        resume[ty].map((el, i) => el.highlights ? resume_strict[ty][i].highlights = Object.values(flatten(el.highlights)) : undefined));

fs.writeFileSync('John_Ailor.json', JSON.stringify(resume_strict, null, 2));
