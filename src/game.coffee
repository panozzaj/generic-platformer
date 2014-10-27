MapScreen = require './mapScreen'

module.exports = class Game
  constructor: ->
    @canvas = document.getElementById 'game'
    @canvas.width = 1024
    @canvas.height = 2640
    @context = @canvas.getContext '2d'
    @context.imageSmoothingEnabled = false
    @mapScreen = new MapScreen @

  run: =>
    @update()
    @draw()
    requestAnimFrame @run

  update: ->
    # TODO

  draw: ->
    @clearCanvas()
    @mapScreen.draw @context

  clearCanvas: ->
    @context.clearRect 0, 0, @canvas.width, @canvas.height
