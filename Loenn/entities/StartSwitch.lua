-- adapted from Lönn's src/entities/dash_switch.lua
local logging = require("logging")
local drawableSprite = require("structs.drawable_sprite")

local switchSides = {
  ["Up"] = 0,
  ["Down"] = 1,
  ["Left"] = 2,
  ["Right"] = 3
}

local sideToClockwiseRotations = {
  [0] = 0,
  [1] = 2,
  [2] = 3,
  [3] = 1
}
local clockwiseRotationsToSide = {
  [0] = 0,
  [1] = 3,
  [2] = 1,
  [3] = 2
}

local startSwitch = {}
startSwitch.name = "Madhunt/StartSwitch"
startSwitch.associatedMods = { "Madhunt" }
startSwitch.fieldInformation = {
  side = {
    options = switchSides,
    editable = false
  },
  switchID = {
    fieldType = "integer"
  }
}
startSwitch.placements = {
  {
    name = "up",
    data = {
      side = 0,
      switchID = 0,
      name = ""
    }
  },
  {
    name = "right",
    data = {
      side = 3,
      switchID = 0,
      name = ""
    }
  },
  {
    name = "down",
    data = {
      side = 1,
      switchID = 0,
      name = ""
    }
  },
  {
    name = "left",
    data = {
      side = 2,
      switchID = 0,
      name = ""
    }
  }
}

function startSwitch.sprite(room, entity)
  local dashButtonSprite = drawableSprite.fromTexture("objects/temple/dashButtonMirror00", entity)

  local side = entity.side
  if type(side) ~= "number" then
    return drawableSprite.fromInternalTexture("missing_image", entity)
  end

  if side == 0 then
    dashButtonSprite:addPosition(8, 0)
    dashButtonSprite.rotation = -math.pi / 2
  elseif side == 1 then
    dashButtonSprite:addPosition(8, 8)
    dashButtonSprite.rotation = math.pi / 2
  elseif side == 2 then
    dashButtonSprite:addPosition(0, 8)
    dashButtonSprite.rotation = math.pi
  elseif side == 3 then
    dashButtonSprite:addPosition(8, 8)
    dashButtonSprite.rotation = 0
  end

  return dashButtonSprite
end

function startSwitch.flip(room, entity, horizontal, vertical)
  local side = entity.side
  if type(side) ~= "number" then
    return false
  end

  if vertical then
    if side == 0 then
      entity.side = 1
      return true
    elseif side == 1 then
      entity.side = 0
      return true
    end
  elseif horizontal then
    if side == 2 then
      entity.side = 3
      return true
    elseif side == 3 then
      entity.side = 2
      return true
    end
  end
  return false
end

function startSwitch.rotate(room, entity, direction)
  local side = entity.side
  if not (type(side) == "number" and side >= 0 and side <= 3) then
    return false
  end

  local clockwiseRotations = sideToClockwiseRotations[side]

  -- lua's modulo operator behaves differently with negatives;
  -- (1 % 4 == 1) but (-1 % 4 == 3)
  -- this plays to our advantage here though, since 1 counterclockwise rotation
  -- (or -1 clockwise rotations) is the same as 3 clockwise rotations
  clockwiseRotations = (clockwiseRotations + direction) % 4

  entity.side = clockwiseRotationsToSide[clockwiseRotations]
  return true
end

return startSwitch
