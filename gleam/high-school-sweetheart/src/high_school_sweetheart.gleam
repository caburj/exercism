import gleam/string
import gleam/list
import gleam/io

pub fn first_letter(name: String) {
  case
    name
    |> string.trim
    |> string.first
  {
    Ok(first_letter) -> first_letter
    Error(_) -> panic
  }
}

pub fn initial(name: String) {
  {
    name
    |> first_letter
    |> string.uppercase
  }
  <> "."
}

pub fn initials(full_name: String) {
  full_name
  |> string.split(" ")
  |> list.map(initial)
  |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) {
  let top =
    "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **"

  let center = initials(full_name1) <> "  +  " <> initials(full_name2)
  let middle = "**     " <> center <> "     **"
  let bottom =
    " **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
  let result =
    [top, middle, bottom]
    |> string.join("\n")
  io.print(result)
  result
}
