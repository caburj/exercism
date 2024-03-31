pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number {
    x if x <= 0 -> Error(NonPositiveNumber)
    x -> Ok(collatz_iter(x, 0))
  }
}

fn collatz_iter(n, s) {
  case n, n % 2 == 0 {
    1, _ -> s
    _, True -> collatz_iter(n / 2, s + 1)
    _, False -> collatz_iter(3 * n + 1, s + 1)
  }
}
