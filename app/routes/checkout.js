const route = require('express').Router()
const Checkout = require('../controllers/Checkout')

route.post('/', Checkout.addCheckout)
route.get('/', Checkout.getAllCheckout)

module.exports = route
