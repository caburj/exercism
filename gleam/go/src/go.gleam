import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  let applied_rules = {
    use g1 <- result.try(rule1(game))
    use g2 <- result.try(Ok(rule2(g1)))
    use g3 <- result.try(rule3(g2))
    use g4 <- result.map(rule4(g3))
    g4
  }
  case applied_rules {
    Ok(g) ->
      Game(
        ..g,
        player: {
          case g.player {
            White -> Black
            Black -> White
          }
        },
      )
    Error(error) -> Game(..game, error: error)
  }
}
