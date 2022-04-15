const ErrorRespose = require("../utils/errorResponse")

const errorHandler = (err, req, res, next) =>{
    let error = {...err}

    error.message = err.message

    //Log to console for dev
    console.log(err.stack)

    // Mongoose bad ObjectId
    if(err.name === 'CastError') {
        const message = 'Circle not found with id of ' + err.value
        error = new ErrorRespose(message, 404)
    }    
    // Mongoose validation error
    else if(err.name === 'ValidationError') {
        error = new ErrorRespose(err.message, 400)
    }

    // Mongoose duplicate key
    if(err.code === 11000) {
        error = new ErrorRespose(err.message, 400)
    }

    res.status(error.statusCode || 500).json({
        message: error.message || 'Server Error.'
    })
}

module.exports = errorHandler