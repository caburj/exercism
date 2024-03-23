pub fn convert(number: Int) -> String {
  convert_iter(number, "", prims)
}

fn convert_iter(number, result, rem_prims) {
  case number {
    0 -> result
    i -> {
      case rem_prims {
        [] -> panic as "No more primitives to convert number"
        [prim, ..tail] -> {
          let #(value, symbol) = prim
          let diff = i - value
          case diff {
            _ if diff >= 0 -> convert_iter(diff, result <> symbol, rem_prims)
            _ -> convert_iter(i, result, tail)
          }
        }
      }
    }
  }
}

const prims = [
  #(1000, "M"),
  #(900, "CM"),
  #(500, "D"),
  #(400, "CD"),
  #(100, "C"),
  #(90, "XC"),
  #(50, "L"),
  #(40, "XL"),
  #(10, "X"),
  #(9, "IX"),
  #(5, "V"),
  #(4, "IV"),
  #(1, "I"),
]
