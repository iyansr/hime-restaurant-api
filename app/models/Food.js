const Sequelize = require('sequelize')
const Category = require('./Category')
const db = require('../../configs/db')
const uuid = require('uuid/v4')

const Food = db.define(
	'foods',
	{
		id: {
			type: Sequelize.STRING,
			primaryKey: true,
		},
		name: Sequelize.STRING,
		image: Sequelize.STRING,
		category: Sequelize.STRING,
		price: Sequelize.INTEGER,
	},
	{ underscored: true }
)

Food.beforeCreate(food => (food.id = uuid()))
Food.belongsTo(Category, { as: 'Category', foreignKey: 'category' })

module.exports = Food
