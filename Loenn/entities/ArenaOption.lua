local arenaOption = {}
arenaOption.name = "Madhunt/ArenaOption"
arenaOption.associatedMods = { "Madhunt" }

arenaOption.texture = "ahorn/Madhunt/arenaOption"
arenaOption.justification = { 0.5, 0.5 }

arenaOption.fieldInformation = {
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
    switchIDs = "",
    arenaArea = "",
    spawnLevel = "",
    spawnIndex = 0,
    initialSeekers = 1,
    tagMode = true,
    goldenMode = false,
    hideNames = true
  }
}

return arenaOption