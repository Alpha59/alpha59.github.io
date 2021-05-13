"use strict";
const fs = require("fs");
const resume = JSON.parse(fs.readFileSync("../resume.json"));
const resume_strict = Object.assign({}, resume);

['work', 'education', 'volunteer', 'project'].map((ty) =>
    (resume[ty] || []).map((el, i) => el.highlights ? resume_strict[ty][i].highlights = Object.values(el.highlights).map(el => typeof el === "object" ? Object.values(el).flat(): el).flat() : undefined));

fs.writeFileSync('John_Ailor.json', JSON.stringify(resume_strict, null, 2));
