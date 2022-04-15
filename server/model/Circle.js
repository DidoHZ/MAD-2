const mongoose = require('mongoose');   

const CirlceSchema = new mongoose.Schema({
    size: {
        type: Number,
        unique: true,
    },
    color : Number
})

module.exports = mongoose.model("Circle", CirlceSchema)