const Checkout = require('../models/Checkout')

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
}

module.exports = CheckOutController
