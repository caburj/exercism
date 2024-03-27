import gleam/option.{type Option, None, Some}
import gleam/int.{max}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    None -> "Mighty Magician"
    Some(name) -> name
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health {
    0 -> {
      let new_mana = case player.level >= 10 {
        True -> Some(100)
        False -> player.mana
      }
      Some(Player(..player, health: 100, mana: new_mana))
    }
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    None -> #(Player(..player, health: max(0, player.health - cost)), 0)
    Some(mana) -> #(Player(..player, mana: Some(max(0, mana - cost))), 2 * cost)
  }
}
