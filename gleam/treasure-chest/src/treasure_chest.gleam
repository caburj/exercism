pub type TreasureChest(a) {
  TreasureChest(String, a)
}

pub type UnlockResult(a) {
  Unlocked(a)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  let TreasureChest(correct_password, treasure) = chest
  case password == correct_password {
    True -> Unlocked(treasure)
    False -> WrongPassword
  }
}
