const route = require('express').Router()
const User = require('../controllers/User')

route.post('/register', User.register)
route.post('/login', User.login)

module.exports = route
