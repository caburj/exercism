import gleam/string
import gleam/list

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  case input, string.length(input), size {
    "", _, _ -> Error(EmptySeries)
    _, _, s if s < 0 -> Error(SliceLengthNegative)
    _, _, s if s == 0 -> Error(SliceLengthZero)
    _, n, s if s > n -> Error(SliceLengthTooLarge)
    input, n, s ->
      Ok({
        list.range(0, n - s)
        |> list.map(fn(i) { string.slice(input, i, s) })
      })
  }
}

pub type Error {
  SliceLengthTooLarge
  SliceLengthZero
  SliceLengthNegative
  EmptySeries
}
