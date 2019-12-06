const config = {};

config.mysql = {
  host: process.env.DB_HOST || "localhost",
  user: process.env.DB_USER || "",
  password: process.env.DB_PASS || "",
  database: process.env.DB_SELECT || "",
  port: process.env.DB_PORT || 3306,
  connectionLimit: 10
};

module.exports = config;
