const Validator = require('validator')
const isEmpty = require('./isEmpty')

const validateUserLogin = data => {
	data.email = !isEmpty(data.email) ? data.email : ''

	let errors = {}

	if (!Validator.isEmail(data.email)) {
		errors.email = 'Please enter a valid email'
	}
	if (Validator.isEmpty(data.email)) {
		errors.email = 'Email field cannot empty'
	}

	if (!Validator.isLength(data.password, { min: 6 })) {
		errors.password = 'Password should be atleast 6 characters'
	}
	if (Validator.isEmpty(data.password)) {
		errors.password = 'Password field cannot empty'
	}

	return {
		errors,
		isValid: isEmpty(errors),
	}
}

module.exports = validateUserLogin
