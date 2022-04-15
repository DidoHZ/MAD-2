const express = require('express')
const cors = require('cors')
const dotenv = require('dotenv');
const morgan = require('morgan');
const connectDB = require('./config/database').connectDB;

// Load env vars
dotenv.config({ path: './config/config.env'})

// Connect to database
connectDB()

// Route files
const circle = require('./routes/circle');

const app = express()

app.use(express.json())
app.use(cors())

// Dev logging middleware
if(process.env.NODE_ENV === "development")
    app.use(morgan('dev'))

// Mount Router
app.use('/Circle', circle)

// Middleware
const errorHandler = require('./middleware/error');

app.use(errorHandler)

const server = app.listen(
    process.env.PORT, 
    console.log('App Running on ' + process.env.NODE_ENV + ', listning on ' + process.env.PORT)
)

// Handle unhandeled promis rejections
process.on('unhandeledRejection', (err, promis) => {
    console.log('Error: ' + err.message)
    // Close server & exit process
    server.close(() => process.exit(1))
})
