const route = require('express').Router()
const Food = require('../controllers/Food')

route.get('/', Food.getAllFood)
route.post('/', Food.addFood)

module.exports = route
