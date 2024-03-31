import gleam/list
import gleam/string
import gleam/result

pub fn to_rna(dna: String) -> Result(String, Nil) {
  dna
  |> string.to_graphemes
  |> list.map(convert)
  |> result.all
  |> result.map(string.concat)
  |> result.nil_error
}

fn convert(dna: String) {
  case dna {
    "G" -> Ok("C")
    "C" -> Ok("G")
    "T" -> Ok("A")
    "A" -> Ok("U")
    _ -> Error(Nil)
  }
}
