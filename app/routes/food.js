const route = require('express').Router()
const Food = require('../controllers/Food')

route.get('/', Food.getAllFood)
route.post('/', Food.addFood)
route.delete('/:id', Food.delete)
route.patch('/:id', Food.editFood)

module.exports = route
