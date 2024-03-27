import gleam/option.{type Option, None, Some}

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
      Player(..player, health: 100, mana: new_mana)
      |> Some
    }
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    None -> #(reduce_health(player, cost), 0)
    Some(mana) -> {
      let new_mana = mana - cost
      case new_mana < 0 {
        True -> #(player, 0)
        False -> #(Player(..player, mana: Some(new_mana)), 2 * cost)
      }
    }
  }
}

fn reduce_health(p, damage) {
  Player(
    ..p,
    health: {
      let diff = p.health - damage
      case diff < 0 {
        True -> 0
        False -> diff
      }
    },
  )
}
