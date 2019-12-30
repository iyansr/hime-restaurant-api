const Sequelize = require('sequelize')

const dbName = process.env.DB_NAME
const dbUser = process.env.DB_USER
const dbPassword = process.env.DB_PASSWORD
const dbHost = process.env.DB_HOST
const dbPort = process.env.DB_PORT

module.exports = new Sequelize(dbName, dbUser, dbPassword, {
	dialect: 'mysql',
	host: dbHost,
	port: dbPort,
	// logging: ,
})
