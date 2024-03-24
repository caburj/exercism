import gleam/list.{length, reverse}

pub fn new_list() -> List(String) {
  []
}

pub fn existing_list() -> List(String) {
  ["Gleam", "Go", "TypeScript"]
}

pub fn add_language(languages, language) {
  [language, ..languages]
}

pub fn count_languages(languages) {
  length(languages)
}

pub fn reverse_list(languages) {
  reverse(languages)
}

pub fn exciting_list(languages: List(String)) -> Bool {
  case languages {
    ["Gleam", ..] -> True
    [_, "Gleam", ..rest] -> {
      let n = count_languages(rest)
      n == 0 || n == 1
    }
    _ -> False
  }
}
