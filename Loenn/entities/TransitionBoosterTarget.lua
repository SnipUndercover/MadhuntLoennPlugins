local drawableSprite = require("structs.drawable_sprite")
local drawableLine = require("structs.drawable_line")

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

local d = math.sqrt(2) / 2
local dirVectors = {
  [0] = { x = -d, y =  d },
  [1] = { x = -1, y =  0 },
  [2] = { x = -d, y = -d },
  [3] = { x =  0, y = -1 },
  [4] = { x =  d, y = -d },
  [5] = { x =  1, y =  0 },
  [6] = { x =  d, y =  d },
  [7] = { x =  0, y =  1 }
}

local arrowColor =  {0.4, 0.25, 0.75, 1.0}

local transitionBoosterTarget = {}
transitionBoosterTarget.name = "Madhunt/TransitionBoosterTarget"
transitionBoosterTarget.associatedMods = { "Madhunt" }
transitionBoosterTarget.fieldInformation = {
  targetID = {
    fieldType = "integer"
  },
  boosterDir = {
    options = dirNames,
    editable = false
  }
}
transitionBoosterTarget.placements = {
  name = "normal",
  data = {
    targetID = 0,
    boosterDir = 0
  }
}

function transitionBoosterTarget.sprite(room, entity)
  local boosterSprite = drawableSprite.fromTexture("objects/booster/boosterRed00", entity)
  boosterSprite:setColor({0.4, 0.25, 0.75, 0.7})

  if entity.boosterDir == nil then
    return boosterSprite
  end

  local direction = dirVectors[entity.boosterDir]
  if direction == nil then
    return boosterSprite
  end

  -- prepare the arrow's body
  local arrowMagnitude = 12
  local arrowTail = {
    -- :snip_glad:
    x = entity.x,
    y = entity.y
  }
  local arrowHead = {
    x = entity.x + direction.x * arrowMagnitude,
    y = entity.y + direction.y * arrowMagnitude
  }

  -- rotate the direction by 90 deg to get the arm offset
  local rotatedDirection = {
    x = direction.y,
    y = -direction.x
  }

  -- and prepare the arms
  local armMagnitude = arrowMagnitude / 3
  local arrowArmLeft = {
    x = arrowHead.x - (direction.x + rotatedDirection.x) * armMagnitude,
    y = arrowHead.y - (direction.y + rotatedDirection.y) * armMagnitude
  }
  local arrowArmRight = {
    x = arrowHead.x - (direction.x - rotatedDirection.x) * armMagnitude,
    y = arrowHead.y - (direction.y - rotatedDirection.y) * armMagnitude
  }

  -- and finish it off by creating the sprites
  local arrowBody = drawableLine.fromPoints(
    {
      arrowTail.x, arrowTail.y,
      arrowHead.x, arrowHead.y
    },
    arrowColor
  )

  local arrowArms = drawableLine.fromPoints(
    {
      arrowArmLeft.x, arrowArmLeft.y,
      arrowHead.x, arrowHead.y,
      arrowArmRight.x, arrowArmRight.y
    },
    arrowColor
  )

  return { boosterSprite, arrowBody, arrowArms }
end

return transitionBoosterTarget
