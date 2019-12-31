const User = require('../models/User')
const { errorResponse } = require('../../utils/response')
const bcrypt = require('bcryptjs')
const validateUserLogin = require('../../utils/validators/user')
const jwt = require('jsonwebtoken')

class UserController {
	static async register(req, res) {
		try {
			const { errors, isValid } = validateUserLogin(req.body)
			if (!isValid) {
				return errorResponse(res, 400, 'Bad Request', errors)
			}

			const currentUser = await User.findOne({
				where: {
					email: req.body.email,
				},
			})

			if (currentUser) {
				if (currentUser.email === req.body.email) {
					errors.email = 'User already exist'
					return errorResponse(res, 400, 'Bad Request', errors)
				}
			}
			const salt = await bcrypt.genSalt(10)
			const hashedPassword = await bcrypt.hash(req.body.password, salt)

			const data = {
				email: req.body.email,
				password: hashedPassword,
			}
			const newUser = await User.create(data)
			res.json({
				code: 200,
				status: 'OK',
				message: 'Success Register User',
				user: newUser,
			})
		} catch (error) {
			console.log(error)
			return res.status(500).json({
				message: 'Internal Server Error',
			})
		}
	}
	static async login(req, res) {
		try {
			const { errors, isValid } = validateUserLogin(req.body)
			if (!isValid) {
				return errorResponse(res, 400, 'Bad Request', errors)
			}
			const user = await User.findOne({
				where: {
					email: req.body.email,
				},
				attributes: {
					exclude: ['createdAt', 'updatedAt'],
				},
			})

			if (!user) {
				return errorResponse(res, 404, 'Not Found', 'User not registered')
			}

			const isValidPassword = await bcrypt.compare(
				req.body.password,
				user.password
			)

			if (!isValidPassword) {
				return errorResponse(res, 400, 'Bad Request', {
					password: 'Invalid Password',
				})
			}

			const parsedUser = JSON.parse(JSON.stringify(user))

			delete parsedUser.password

			const token = jwt.sign(parsedUser, process.env.JWT_SECRET, {
				expiresIn: '23h',
			})

			res.json({
				code: 200,
				status: 'OK',
				message: 'Success Login',
				user: parsedUser,
				token,
			})
		} catch (error) {
			console.log(error)
			return res.status(500).json({
				message: 'Internal Server Error',
			})
		}
	}
}

module.exports = UserController
