const route = require('express').Router()
const food = require('./food')
const category = require('./category')
const user = require('./user')

route.use('/food', food)
route.use('/category', category)
route.use('/user', user)

module.exports = route
