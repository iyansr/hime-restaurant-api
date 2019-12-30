const route = require('express').Router()
const food = require('./food')
const category = require('./category')

route.use('/food', food)
route.use('/category', category)

module.exports = route
