const express = require("express")
const dotenv = require("express")
const bodyParser = require('body-parser')
const db = require('./config/db_config.js')
const app = express();

const port = process.env.PORT || 3000;

const server = app.listen(port, () => {
  console.log(`App running on port ${port}...`);
});