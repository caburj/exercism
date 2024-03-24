import gleam/list

pub type Triplet {
  Triplet(Int, Int, Int)
}

pub fn triplets_with_sum(sum: Int) -> List(Triplet) {
  use a <- list.flat_map(list.range(1, sum - 2))
  use b <- list.filter_map(list.range(a + 1, sum - 1))
  let c = sum - a - b
  case is_triplet(a, b, c) {
    True -> Ok(Triplet(a, b, c))
    False -> Error("Not a triplet")
  }
}

fn is_triplet(a, b, c) {
  a < b && b < c && a + b > c && a * a + b * b == c * c
}
