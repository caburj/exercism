import gleam/regex
import gleam/option
import gleam/list

pub fn is_valid_line(line: String) -> Bool {
  let re_string = "\\[(DEBUG)|(INFO)|(WARNING)|(ERROR)\\]"
  let assert Ok(re) = regex.from_string(re_string)
  regex.check(re, line)
}

pub fn split_line(line: String) -> List(String) {
  let assert Ok(re) = regex.from_string("<[~*=-]*>")
  regex.split(re, line)
}

pub fn tag_with_user_name(line: String) -> String {
  let assert Ok(re) = regex.from_string("User\\s*(\\S+)")
  case list.first(regex.scan(re, line)) {
    Ok(m) -> {
      let assert [sub] = m.submatches
      let name = option.unwrap(sub, "")
      case name == "" {
        True -> line
        False -> "[USER] " <> name <> " " <> line
      }
    }
    Error(_) -> line
  }
}
