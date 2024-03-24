import gleam/list

pub type Triplet {
  Triplet(Int, Int, Int)
}

pub fn triplets_with_sum(sum: Int) -> List(Triplet) {
  sum
  |> get_triangles
  |> list.filter_map(fn(t) {
    let #(a, b, c) = t
    case is_triplet(a, b, c) {
      True -> Ok(Triplet(a, b, c))
      False -> Error("Not a triplet")
    }
  })
}

fn get_triangles(sum) {
  list.range(1, sum)
  |> list.flat_map(fn(a) {
    list.range(a, sum)
    |> list.flat_map(fn(b) {
      list.range(b, sum)
      |> list.filter(fn(c) { a + b + c == sum })
      |> list.map(fn(c) { #(a, b, c) })
    })
  })
}

fn is_triplet(a, b, c) {
  a < b && b < c && a + b > c && a * a + b * b == c * c
}
