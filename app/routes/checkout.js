const route = require('express').Router()
const Checkout = require('../controllers/Checkout')

route.post('/', Checkout.addCheckout)

module.exports = route
