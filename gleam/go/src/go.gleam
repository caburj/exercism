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
  case rule1(game) {
    Ok(g) -> {
      case rule3(rule2(g)) {
        Ok(g) -> {
          case rule4(g) {
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
            Error(msg) -> Game(..game, error: msg)
          }
        }
        Error(msg) -> Game(..game, error: msg)
      }
    }
    Error(msg) -> Game(..game, error: msg)
  }
}
