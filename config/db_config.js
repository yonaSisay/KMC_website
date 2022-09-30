const Pool = require('pg').Pool
const pool = new Pool({
    user: 'jonah',
    host:'localhost',
    database: 'church',
    password:'jonah@wubalem09',
    port:5432
})

console.log("database succesfully connected");
module.exports = pool;