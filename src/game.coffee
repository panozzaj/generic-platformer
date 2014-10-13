module.exports = class Game
  constructor: ->
    @canvas = document.getElementById 'game'
    @canvas.width = 1024
    @canvas.height = 640
    @context = @canvas.getContext '2d'
    @context.imageSmoothingEnabled = false

  run: =>
    @update()
    @draw()
    requestAnimFrame @run

  update: ->
    # TODO

  draw: ->
    @clearCanvas()
    @context.fillRect 30, 30, 100, 100
    # draw something

  clearCanvas: ->
    @context.clearRect 0, 0, @canvas.width, @canvas.height

  onkeydown: (event) =>
    @responderManager.onkeydown(event)
