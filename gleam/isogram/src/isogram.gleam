import gleam/list
import gleam/regex
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  let letters =
    phrase
    |> string.lowercase
    |> get_letters

  letters == list.unique(letters)
}

fn get_letters(phrase: String) {
  let assert Ok(letter_re) = regex.from_string("[a-z]")
  phrase
  |> string.to_graphemes
  |> list.filter(regex.check(letter_re, _))
}
