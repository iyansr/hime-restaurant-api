const Validator = require('validator')
const isEmpty = require('./isEmpty')

const validateFoodInput = data => {
	data.name = !isEmpty(data.name) ? data.name : ''
	data.category = !isEmpty(data.category) ? data.category : ''
	data.price = !isEmpty(data.price) ? data.price : ''

	let errors = {}

	if (!Validator.isLength(data.name, { min: 3 })) {
		errors.name = 'Name should be atleast 3 characters'
	}
	if (Validator.isEmpty(data.name)) {
		errors.name = 'Name field cannot empty'
	}

	if (Validator.isEmpty(data.category)) {
		errors.category = 'Category field cannot empty'
	}

	if (!Validator.isInt(data.price, { min: 10000 })) {
		errors.price = 'Price field should be a number from 10000'
	}
	if (Validator.isEmpty(data.price)) {
		errors.price = 'Price field cannot empty'
	}

	return {
		errors,
		isValid: isEmpty(errors),
	}
}

module.exports = validateFoodInput
