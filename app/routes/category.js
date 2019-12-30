const route = require('express').Router()
const Category = require('../controllers/Category')

route.get('/', Category.getAllCategory)
route.post('/', Category.addCategory)

module.exports = route
