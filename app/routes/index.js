const route = require('express').Router()
const food = require('./food')
const category = require('./category')
const user = require('./user')
const checkout = require('./checkout')

route.use('/food', food)
route.use('/category', category)
route.use('/user', user)
route.use('/checkout', checkout)

module.exports = route
