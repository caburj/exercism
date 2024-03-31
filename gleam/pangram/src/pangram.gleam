import gleam/string
import gleam/set
import gleam/list

pub fn is_pangram(sentence: String) -> Bool {
  let all_letters =
    "abcdefghijklmnopqrstuvwxyz"
    |> string.to_graphemes
    |> set.from_list

  26
  == sentence
  |> string.lowercase
  |> string.to_graphemes
  |> list.filter(set.contains(all_letters, _))
  |> set.from_list
  |> set.size
}
