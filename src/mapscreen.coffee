Map = require './map'

module.exports = class MapScreen
  constructor: (@game) ->
    @width = @game.canvas.width
    @height = @game.canvas.height

    @tileSize = 64

    @tilesWide = @width / @tileSize
    @tilesTall = @height / @tileSize

    @map = new Map '1'
    @map.tileSize = @tileSize

  destroy: ->
    _.each @events(), (handler, eventName) ->
      GameEvent.off eventName, handler

  draw: (context) ->
    context.save()
    @drawTiles context,
      map: @map
      layerNames: ['bg']
    context.restore()

  drawTiles: (context, { map, layerNames }) ->
    tileData = map.tileDataFor layerNames: layerNames

    _.each tileData, (tile) =>
      context.drawImage tile.image,
        tile.sx, tile.sy, tile.sw, tile.sh,
        tile.x * @tileSize, tile.y * @tileSize, @tileSize, @tileSize
