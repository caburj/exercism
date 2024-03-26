import gleam/dict.{type Dict}
import gleam/option.{None, Some}

pub type ScoreBoard =
  Dict(String, Int)

pub fn create_score_board() -> ScoreBoard {
  dict.from_list([#("The Best Ever", 1_000_000)])
}

pub fn add_player(
  score_board: ScoreBoard,
  player: String,
  score: Int,
) -> ScoreBoard {
  dict.insert(score_board, player, score)
}

pub fn remove_player(score_board: ScoreBoard, player: String) -> ScoreBoard {
  dict.drop(score_board, [player])
}

pub fn update_score(
  score_board: ScoreBoard,
  player: String,
  points: Int,
) -> ScoreBoard {
  case dict.get(score_board, player) {
    Error(_) -> score_board
    Ok(_) -> {
      use score <- dict.update(score_board, player)
      case score {
        None -> points
        Some(current) -> current + points
      }
    }
  }
}

pub fn apply_monday_bonus(score_board: ScoreBoard) -> ScoreBoard {
  use acc, p, _ <- dict.fold(score_board, score_board)
  update_score(acc, p, 100)
}
