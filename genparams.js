'use strict'

const fs = require('fs'),
    SOLUTION_NAME = process.env.SOLUTION_NAME;

fs.writeFileSync("parameters.json", JSON.stringify({
    redisServerName: SOLUTION_NAME,
    functionAppName: SOLUTION_NAME,
    storagePrefix: SOLUTION_NAME.toLowerCase().replace(/\W+/g,'')
}))