pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  list
  |> keep_iter(predicate, [])
  |> reverse_iter([])
}

fn keep_iter(items, pred, result) {
  case items {
    [] -> result
    [a, ..rest] -> {
      keep_iter(rest, pred, {
        case pred(a) {
          True -> [a, ..result]
          False -> result
        }
      })
    }
  }
}

fn reverse_iter(items, result) {
  case items {
    [] -> result
    [a, ..rest] -> reverse_iter(rest, [a, ..result])
  }
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  keep(list, fn(x) { !predicate(x) })
}
