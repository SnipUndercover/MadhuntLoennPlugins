local drawableSprite = require("structs.drawable_sprite")

local hiderSpawnPoint = {}
hiderSpawnPoint.name = "Madhunt/HiderSpawnPoint"
hiderSpawnPoint.associatedMods = { "Madhunt" }
hiderSpawnPoint.fieldInformation = {
  spawnIndex = {
    fieldType = "integer"
  }
}
hiderSpawnPoint.placements = {
  name = "normal",
  data = {
    spawnIndex = 0
  }
}

function hiderSpawnPoint.sprite(room, entity)
  local boosterSprite = drawableSprite.fromTexture("characters/player/sitDown00", entity)
  boosterSprite:setColor({0.0, 1.0, 0.0, 1.0})
  boosterSprite:setJustification(0.5, 1.0)
  return boosterSprite
end

return hiderSpawnPoint