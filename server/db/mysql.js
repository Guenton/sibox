const { promisify } = require("util");
const mysql = require("mysql");
const config = require("./config");

// Configure Connection Pool with Configuration Object
const pool = mysql.createPool(config.mysql);

// Connect to database or react to errors.
pool.getConnection((err, connection) => {
  if (err) {
    if (err.code === "PROTOCOL_CONNECTION_LOST") {
      return console.error("MySQL DB Connection was lost");
    } else if (err.code === "ER_CON_COUNT_ERROR") {
      return console.error("MySQL DB is at maximum simultaneous Connections");
    } else if (err.code === "ECONNREFUSED") {
      return console.error("MySQL DB Connection was Refused");
    } else {
      return console.error(err.code);
    }
  }
  if (connection) {
    connection.release();
    return console.log("Database Connection was Successful");
  }
});

// Prepare pool for Async Await using promisify
pool.query = promisify(pool.query);

module.exports = pool;
