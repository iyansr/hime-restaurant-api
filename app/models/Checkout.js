const Sequelize = require('sequelize')
const Food = require('./Food')
const db = require('../../configs/db')

const Checkout = db.define(
	'checkouts',
	{
		checkout_id: Sequelize.STRING,
		food_id: Sequelize.STRING,
		quantity: Sequelize.INTEGER,
		price: Sequelize.INTEGER,
		total: Sequelize.INTEGER,
	},
	{ underscored: true }
)

Checkout.belongsTo(Food, { as: 'Food', foreignKey: 'food_id' })

module.exports = Checkout
