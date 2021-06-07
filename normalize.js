"use strict";
const fs = require("fs");
const args = process.argv.slice(2);
const resume = JSON.parse(fs.readFileSync(`../${args[0]}`));
const resume_strict = Object.assign({}, resume);

['work', 'education', 'volunteer', 'project'].map((ty) =>
    (resume[ty] || []).map((el, i) => el.highlights ? resume_strict[ty][i].highlights = Object.values(el.highlights).map(el => typeof el === "object" ? Object.values(Object.values(el).map(arr => Array.isArray(arr) ? arr.map(a => a.replace(/^/,'- ')) : arr)).flat(): el).flat(): undefined));

fs.writeFileSync('John_Ailor.json', JSON.stringify(resume_strict, null, 2));
