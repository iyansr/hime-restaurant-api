const Category = require('../models/Category')
const { httpResponse } = require('../../utils/response')

class CategoryController {
	static async getAllCategory(req, res) {
		try {
			const category = await Category.findAll()
			httpResponse(res, 200, 'OK', category)
		} catch (error) {
			console.log(error)
			return res.status(500).json({
				message: 'Internal server error',
			})
		}
	}

	static async addCategory(req, res) {
		try {
			const category = await Category.create({
				name: req.body.name,
			})
			res.json(category)
		} catch (error) {
			console.log(error)
			return res.status(500).json({
				message: 'Internal server error',
			})
		}
	}
}

module.exports = CategoryController
