import gleam/string
import gleam/list

pub fn is_paired(value: String) -> Bool {
  let brackets =
    value
    |> string.to_graphemes
    |> list.filter(is_bracket)

  let rem = is_paired_iter(brackets, [])
  list.is_empty(rem)
}

fn is_paired_iter(brackets, stack) {
  case brackets {
    [] -> stack
    [next, ..remaining] -> {
      case stack {
        [] -> is_paired_iter(remaining, [next])
        [top, ..bottom] -> {
          case closes(top, next) {
            True -> is_paired_iter(remaining, bottom)
            False -> is_paired_iter(remaining, [next, ..stack])
          }
        }
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
