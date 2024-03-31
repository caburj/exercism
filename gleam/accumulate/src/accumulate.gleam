pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  case list {
    [] -> []
    [h, ..tail] -> [fun(h), ..accumulate(tail, fun)]
  }
}
