const { Op } = require('sequelize')
const Food = require('../models/Food')
const Category = require('../models/Category')
const validateFoodInput = require('../../utils/validators/food')
const { httpResponse, errorResponse } = require('../../utils/response')
const cloudinary = require('../../configs/cloudinary')
const fs = require('fs')

class FoodController {
	static async getAllFood(req, res) {
		let { name, category, price, limit, page = 1 } = req.query
		let conditions = {}

		if (name) {
			conditions.where = {
				...conditions.where,
				name: {
					[Op.like]: '%' + name + '%',
				},
			}
		}

		if (category) {
			conditions.where = {
				...conditions.where,
				category: { ...conditions.where, category },
			}
		}

		if (price) {
			const price_min = parseInt(price.split(';')[0])
			const price_max = parseInt(price.split(';')[1])

			conditions.where = {
				...conditions.where,
				price: {
					[Op.between]: [price_min, price_max],
				},
			}
		}

		if (limit) {
			limit = Number.parseInt(limit < 1 ? 1 : limit)
			page = Number.parseInt(page < 1 ? 1 : page)

			conditions.limit = limit
			conditions.offset = (page - 1) * limit
		}

		try {
			const foods = await Food.findAndCountAll({
				include: [
					{
						as: 'Category',
						model: Category,
						required: true,
						attributes: ['id', 'name'],
					},
				],
				attributes: {
					exclude: ['category', 'createdAt', 'updatedAt'],
				},
				...conditions,
			})

			if (!foods.rows.length > 0) {
				return errorResponse(res, 404, 'Not found', 'Food is empty')
			}

			res.status(200).json({
				code: 200,
				status: 'OK',
				message: 'Success Fetching Data',
				totalData: foods.count,
				foods: foods.rows,
			})
		} catch (error) {
			console.log(error)
			return res.status(500).json({
				message: 'Internal Server Error',
			})
		}
	}

	static async addFood(req, res) {
		try {
			const { name, category, price } = req.body
			const { errors, isValid } = validateFoodInput(req.body)

			const { image } = req.files || req.body || {}

			if (!image) {
				errors.image = 'Image Cannot Empty'
				image.tempFilePath && fs.unlinkSync(image.tempFilePath)
			}

			if (!isValid || !image) {
				image.tempFilePath && fs.unlinkSync(image.tempFilePath)
				return errorResponse(res, 400, 'Bad request', {
					...errors,
				})
			}

			let tempFilePath = image.tempFilePath && image.tempFilePath
			const imageString = req.body.image && image

			if (tempFilePath) {
				const upload = await cloudinary.uploader.upload(tempFilePath, {
					folder: 'upload/hime_food/image',
					transformation: { quality: 80 },
				})
				tempFilePath = upload.url
			}
			const finalImage = tempFilePath || imageString

			const food = await Food.create({
				name,
				category,
				image: finalImage,
				price,
			})
			image.tempFilePath && fs.unlinkSync(image.tempFilePath)
			res.json({ code: 200, status: 'OK', food })
		} catch (error) {
			console.log(error)
			return res.status(500).json({
				message: 'Internal Server Error',
			})
		}
	}

	static async editFood(req, res) {
		try {
			const foodFind = await Food.findByPk(req.params.id)

			if (!foodFind) {
				return errorResponse(res, 404, 'Not found', 'Cannot find food')
			}
			const { name, category, price } = req.body
			const { errors, isValid } = validateFoodInput(req.body)

			const { image } = req.files || req.body || {}

			if (!image) {
				errors.image = 'Image Cannot Empty'
				image.tempFilePath && fs.unlinkSync(image.tempFilePath)
			}

			if (!isValid || !image) {
				image.tempFilePath && fs.unlinkSync(image.tempFilePath)
				return errorResponse(res, 400, 'Bad request', {
					...errors,
				})
			}

			let tempFilePath = image.tempFilePath && image.tempFilePath
			const imageString = req.body.image && image

			if (tempFilePath) {
				const upload = await cloudinary.uploader.upload(tempFilePath, {
					folder: 'upload/hime_food/image',
					transformation: { quality: 80 },
				})
				tempFilePath = upload.url
			}
			const finalImage = tempFilePath || imageString

			const food = await Food.update(
				{
					name,
					category,
					image: finalImage,
					price,
				},
				{ where: { id: req.params.id } }
			)
			image.tempFilePath && fs.unlinkSync(image.tempFilePath)
			res.json({ code: 200, status: 'OK', food })
		} catch (error) {
			console.log(error)
			return res.status(500).json({
				message: 'Internal Server Error',
			})
		}
	}

	static async delete(req, res) {
		try {
			const food = await Food.findByPk(req.params.id)

			if (!food) {
				return errorResponse(res, 404, 'Not found', 'Cannot find food')
			}
			const destroy = await Food.destroy({ where: { id: req.params.id } })

			if (!destroy) {
				return errorResponse(res, 400, 'Bad Request', 'Cannot Delete')
			}

			res.json({
				code: 200,
				status: 'OK',
				message: 'Success delete food',
			})
		} catch (error) {
			console.log(error)
			return res.status(500).json({
				message: 'Internal Server Error',
			})
		}
	}
}

module.exports = FoodController
