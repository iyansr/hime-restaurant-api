require('dotenv').config()
const express = require('express')
const http = require('http')
const router = require('./app/routes')
const fileUploads = require('express-fileupload')
// const morgan = require('morgan')
const cors = require('cors')

const db = require('./configs/db')
const server = express()
const PORT = process.env.PORT || 9300

server.use(cors())
// server.use(morgan('dev'))
server.use(express.static('./public'))
server.use(
	fileUploads({
		useTempFiles: true,
		tempFileDir: './public/img',
	})
)
server.use('/api', router)

server.get('/', (req, res) => {
	res.json({ info: 'Server up and running' })
})

const start = async () => {
	try {
		await db.authenticate()
		http.createServer(server).listen(PORT, () => {
			console.log(`SERVER RUNNING ON PORT ${PORT}`)
		})
	} catch (error) {
		console.log('An error occured whil connecting to database:', error)
	}
}
start()
