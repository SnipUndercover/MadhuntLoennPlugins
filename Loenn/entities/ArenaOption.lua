local arenaOption = {}
arenaOption.name = "Madhunt/ArenaOption"
arenaOption.associatedMods = { "Madhunt" }

arenaOption.texture = "ahorn/Madhunt/arenaOption"
arenaOption.justification = { 0.5, 0.5 }

arenaOption.fieldInformation = {
  switchIDs = {
    fieldType = "list",
    elementOptions = {
      fieldType = "integer",
    },
    elementDefault = 0,
    minimumElements = 1
  },
  spawnLevel = {
    validator = function(input)
      return string.len(input) > 0
    end
  },
  spawnIndex = {
    fieldType = "integer"
  },
  initialSeekers = {
    fieldType = "integer"
  }
}
arenaOption.placements = {
  name = "normal",
  data = {
    switchIDs = "0",
    arenaArea = "",
    spawnLevel = "arenaName",
    spawnIndex = 0,
    initialSeekers = 1,
    tagMode = true,
    goldenMode = false,
    hideNames = true
  }
}

return arenaOption