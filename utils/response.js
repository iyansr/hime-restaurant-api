const httpResponse = (res, code, status, data) => {
	return res.status(code).json({
		code,
		status,
		data,
	})
}

const errorResponse = (res, code, status, message) => {
	return res.status(code).json({
		error: true,
		code,
		status,
		message,
	})
}

module.exports = { httpResponse, errorResponse }
