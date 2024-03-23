import gleam/int

pub fn convert(number: Int) -> String {
  let by_3 = number % 3 == 0
  let by_5 = number % 5 == 0
  let by_7 = number % 7 == 0
  case #(by_3, by_5, by_7) {
    #(True, True, True) -> "PlingPlangPlong"
    #(True, True, False) -> "PlingPlang"
    #(True, False, True) -> "PlingPlong"
    #(False, True, True) -> "PlangPlong"
    #(True, False, False) -> "Pling"
    #(False, True, False) -> "Plang"
    #(False, False, True) -> "Plong"
    _ -> int.to_string(number)
  }
}
