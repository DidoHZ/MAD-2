const express = require('express')
const { getCircles, getCircle, createCircle, deleteCircle, updateCircle, deleteAllCircle} = require('../controllers/circle');

const router = express.Router()


router
    .route("/")
    .get(getCircles)
    .post(createCircle)
    .delete(deleteAllCircle)

router
    .route("/:id")
    .get(getCircle)
    .delete(deleteCircle)
    .put(updateCircle)

module.exports = router