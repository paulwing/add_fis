#!/usr/bin/env node

const path = require("path");
const chldpro = require("child_process");

chldpro.execFile(path.posix.join(__dirname, "../add_fis.sh"), [], function(err, stdout, stderr) {
  if (err) {
    // throw err;
    console.log(err);
  }
  console.log(stdout);
});
