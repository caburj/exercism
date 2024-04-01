import gleam/string
import gleam/list
import gleam/int
import gleam/result

pub fn row(index: Int, string: String) -> Result(List(Int), Nil) {
  string
  |> matrix
  |> list.at(index - 1)
}

pub fn column(index: Int, string: String) -> Result(List(Int), Nil) {
  string
  |> matrix
  |> list.map(list.at(_, index - 1))
  |> result.all
}

fn matrix(string) {
  use line <- list.map(string.split(string, "\n"))
  use s <- list.map(string.split(line, " "))
  s
  |> int.parse
  |> result.unwrap(0)
}
