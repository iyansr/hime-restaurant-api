const Sequelize = require('sequelize')
const db = require('../../configs/db')
const uuid = require('uuid/v4')

const User = db.define(
	'users',
	{
		id: {
			type: Sequelize.STRING,
			primaryKey: true,
		},
		email: Sequelize.STRING,
		password: Sequelize.STRING,
	},
	{ underscored: true }
)

User.beforeCreate(user => (user.id = uuid()))

module.exports = User
