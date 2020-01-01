const Checkout = require('../models/Checkout')
const Food = require('../models/Food')

class CheckOutController {
	static async addCheckout(req, res) {
		try {
			const data = JSON.parse(req.body.check)

			const checkout = await Checkout.bulkCreate(data)

			res.json(checkout)
		} catch (error) {
			console.log(error)
			return res.json({ error: 'Server Error' })
		}
	}

	static async getAllCheckout(req, res) {
		try {
			const checkout = await Checkout.findAll({
				include: [
					{
						as: 'Food',
						model: Food,
						required: true,
						attributes: ['name'],
					},
				],
				attributes: {
					exclude: ['food_id'],
				},
			})

			const parsedCheckOut = JSON.parse(JSON.stringify(checkout))
			const newCheckOut = parsedCheckOut.map(check => {
				return {
					...check,
					Food: check.Food.name,
				}
			})

			let obj = {}

			const result = newCheckOut.reduce((prev, current) => {
				if (!obj[current.checkout_id]) {
					obj[current.checkout_id] = {
						checkout_id: current.checkout_id,
						quantity: [],
						price: [],
						total: [],
						food: [],
						createdAt: current.createdAt,
					}
					prev.push(obj[current.checkout_id])
				}
				obj[current.checkout_id].quantity.push(current.quantity)
				obj[current.checkout_id].price.push(current.price)
				obj[current.checkout_id].total.push(current.total)
				obj[current.checkout_id].food.push(current.Food)
				return prev
			}, [])

			const finalResult = result.map(res => {
				let subtotal = res.total.reduce((prev, next) => prev + next)
				let totalppn = subtotal + subtotal * 0.1
				return {
					checkout_id: res.checkout_id,
					total: totalppn,
					foods: res.food,
					createdAt: res.createdAt,
				}
			})

			res.json(finalResult)
		} catch (error) {
			console.log(error)
			return res.json({ error: 'Server Error' })
		}
	}
}

module.exports = CheckOutController
