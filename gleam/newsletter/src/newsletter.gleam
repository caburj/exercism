import simplifile.{append, create_file}
import gleam/string
import gleam/result.{nil_error}
import gleam/list

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  case simplifile.read(path) {
    Ok(content) -> {
      content
      |> string.trim
      |> string.split("\n")
      |> Ok
    }
    Error(_) -> Error(Nil)
  }
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  path
  |> create_file
  |> nil_error
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  path
  |> append(email <> "\n")
  |> nil_error
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  use _ <- result.then(create_log_file(log_path))
  use emails <- result.map(read_emails(emails_path))
  use email <- list.each(emails)
  use _ <- result.then(send_email(email))
  log_sent_email(log_path, email)
}
