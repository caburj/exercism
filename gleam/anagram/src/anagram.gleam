import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  list.filter(candidates, fn(candidate) {
    let w = string.lowercase(word)
    let c = string.lowercase(candidate)
    c != w && sort(w) == sort(c)
  })
}

fn sort(word) {
  string.to_graphemes(word)
  |> list.sort(string.compare)
}
