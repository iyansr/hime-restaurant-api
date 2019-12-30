const Sequelize = require('sequelize')
const db = require('../../configs/db')
const uuid = require('uuid/v4')

const Category = db.define(
	'categories',
	{
		id: {
			type: Sequelize.STRING,
			primaryKey: true,
		},
		name: Sequelize.STRING,
	},
	{ underscored: true }
)

Category.beforeCreate(category => (category.id = uuid()))

module.exports = Category
