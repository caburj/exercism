import gleam/string

pub fn reverse(value: String) -> String {
  case string.first(value) {
    Ok(first) ->
      string.append(
        reverse(string.slice(value, 1, string.length(value) - 1)),
        first,
      )
    Error(_) -> value
  }
}
