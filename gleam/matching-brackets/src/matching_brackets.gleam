import gleam/string
import gleam/list

pub fn is_paired(value: String) -> Bool {
  value
  |> string.to_graphemes
  |> list.filter(is_bracket)
  |> is_paired_iter([])
}

fn is_paired_iter(brackets, stack) {
  case brackets, stack {
    [], [] -> True
    [], _ -> False
    [next, ..remaining], [] -> is_paired_iter(remaining, [next])
    [next, ..remaining], [top, ..bottom] -> {
      case closes(top, next) {
        True -> is_paired_iter(remaining, bottom)
        False -> is_paired_iter(remaining, [next, ..stack])
      }
    }
  }
}

fn closes(a, b) {
  case a <> b {
    "()" | "[]" | "{}" -> True
    _ -> False
  }
}

fn is_bracket(c) {
  case c {
    "(" | ")" | "[" | "]" | "{" | "}" -> True
    _ -> False
  }
}
