const asyncHandler = require('../middleware/asyncHandler');
const Circle = require('../model/Circle');

// @des     Get all Circles
// @route   GET /Circle
// @access  Public
exports.getCircles = asyncHandler(async (req, res, next) => {
        const circles = await Circle.find()

        if(!circles)
            return next(error)

        res.send(circles)
})

// @des     Get Circle
// @route   GET /Circle/:id
// @access  Public
exports.getCircle = asyncHandler(async (req, res, next) => {
        const circle = await Circle.findById(req.params.id)

        if(!circle)
            return next(error) 

        res.json(circle)
})

// @des     Create new Circle
// @route   POST /Circle 
// @access  Private
exports.createCircle = asyncHandler(async (req, res, next) => {
        console.log(req.body)
        res.status(201).json(await Circle.create(req.body))
})

// @des     Delete Circle
// @route   DELETE /Circle/:id
// @access  Private
exports.deleteCircle = asyncHandler(async (req, res, next) => {
    const circle = await Circle
        .findByIdAndRemove(req.params.id)

    if(!circle)
        next(error)

    res.json(circle)
})

// @des     Delete All Circle
// @route   DELETE /Circle/:id
// @access  Private
exports.deleteAllCircle = asyncHandler(async (req, res, next) => {
    const circle = await Circle
        .remove()

    if(!circle)
        next(error)

    res.json(circle)
})

// @des     Update Circle
// @route   PUT /Circle/:id
// @access  Private
exports.updateCircle = asyncHandler(async (req, res, next) => {
    const newCircle = await Circle
        .findByIdAndUpdate(req.params.id, req.body, {
            new: true,
            runValidators: true
        })

    if(!newCircle)
        next(error)

    res.json(newCircle)
})
