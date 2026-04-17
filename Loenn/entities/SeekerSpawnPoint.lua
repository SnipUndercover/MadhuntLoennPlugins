local drawableSprite = require("structs.drawable_sprite")

local seekerSpawnPoint = {}
seekerSpawnPoint.name = "Madhunt/SeekerSpawnPoint"
seekerSpawnPoint.associatedMods = { "Madhunt" }
seekerSpawnPoint.fieldInformation = {
  spawnIndex = {
    fieldType = "integer"
  }
}
seekerSpawnPoint.placements = {
  name = "normal",
  data = {
    spawnIndex = 0
  }
}

function seekerSpawnPoint.sprite(room, entity)
  local boosterSprite = drawableSprite.fromTexture("characters/player/sitDown00", entity)
  boosterSprite:setColor({1.0, 0.0, 0.0, 1.0})
  boosterSprite:setJustification(0.5, 1.0)
  return boosterSprite
end

return seekerSpawnPoint
