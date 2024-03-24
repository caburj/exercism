import gleam/list.{append, filter, fold, range, unique}

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  factors
  |> filter(keeping: fn(x) { x != 0 })
  |> fold(from: [], with: fn(multiples, factor) {
    multiples
    |> append(filter(range(1, limit - 1), fn(x) { x % factor == 0 }))
  })
  |> unique
  |> fold(from: 0, with: fn(sum, x) { sum + x })
}
