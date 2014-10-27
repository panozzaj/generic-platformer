module.exports = class Map
  constructor: (@name) ->
    tmxloader.load("maps/#{@name}.tmx")

    @tileset = tmxloader.map.tilesets[0]
    @tilesetImage = new Image
    @tilesetImage.src = "maps/#{@tileset.src}"
    @layers = tmxloader.map.layers

    @tilesetTileSize = parseInt(@tileset.tileWidth)
    @tilesWide = tmxloader.map.width
    @tilesTall = tmxloader.map.height

    @tilesetColumns = @tileset.width / @tilesetTileSize

  tileDataFor: ({ layerNames, xRange, yRange }) ->
    tileData = []

    _.each layerNames, (layerName) =>
      layer = _.find @layers, name: layerName
      return unless layer

      for y in [0..15]
        for x in [0..15]
          tileId = layer.data[y][x] - 1
          continue if tileId == -1

          tileData.push _.extend @tileDataForGid(tileId),
            x: x
            y: y

    tileData

  tileDataForGid: (tileId)  ->
    tileRow = Math.floor(tileId / @tilesetColumns)
    tileColumn = tileId % @tilesetColumns

    image: @tilesetImage
    sx: tileColumn * @tilesetTileSize
    sy: tileRow * @tilesetTileSize
    sw: @tilesetTileSize
    sh: @tilesetTileSize

  tileAt: ({ x, y }) ->
    _.find(@layers, name: "fg").data[y][x]
