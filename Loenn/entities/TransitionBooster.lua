local drawableSprite = require("structs.drawable_sprite")

local dirNames = {
  ["Down-Left"]  = 0,
  ["Left"]       = 1,
  ["Up-Left"]    = 2,
  ["Up"]         = 3,
  ["Up-Right"]   = 4,
  ["Right"]      = 5,
  ["Down-Right"] = 6,
  ["Down"]       = 7
}

local transitionBooster = {}
transitionBooster.name = "Madhunt/TransitionBooster"
transitionBooster.associatedMods = { "Madhunt" }
transitionBooster.fieldInformation = {
  targetDir = {
    options = dirNames,
    editable = false
  },
  targetID = {
    fieldType = "integer"
  }
}
transitionBooster.placements = {
  name = "normal",
  data = {
    targetDir = 0,
    targetArea = "",
    targetLevel = "",
    targetID = 0
  }
}

function transitionBooster.sprite(room, entity)
  local boosterSprite = drawableSprite.fromTexture("objects/booster/boosterRed00", entity)
  boosterSprite:setColor({0.4, 0.25, 0.75, 1.0})
  return boosterSprite
end

return transitionBooster
