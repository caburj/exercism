import gleam/string

pub opaque type TreasureChest(a) {
  TreasureChest(password: String, contents: a)
}

pub fn create(
  password: String,
  contents: treasure,
) -> Result(TreasureChest(treasure), String) {
  let len = string.length(password)
  case len >= 8 {
    True -> Ok(TreasureChest(password, contents))
    False -> Error("Password must be at least 8 characters long")
  }
}

pub fn open(
  chest: TreasureChest(treasure),
  password: String,
) -> Result(treasure, String) {
  case chest.password == password {
    True -> Ok(chest.contents)
    False -> Error("Incorrect password")
  }
}
