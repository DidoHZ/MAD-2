const mongoose = require("mongoose")

const connectDB = async () =>{
    const conn = await mongoose.connect(process.env.DB_Host)

    console.log('MongoDb connected: ' + conn.connection.host);
}

module.exports.connectDB = connectDB