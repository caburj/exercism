pub type Color {
  Black
  Brown
  Red
  Orange
  Yellow
  Green
  Blue
  Violet
  Grey
  White
}

pub fn value(colors: List(Color)) -> Result(Int, Nil) {
  case colors {
    [first, second, ..] -> {
      let f = color_to_int(first)
      let s = color_to_int(second)
      Ok(f * 10 + s)
    }
    _ -> Error(Nil)
  }
}

fn color_to_int(color) {
  case color {
    Black -> 0
    Brown -> 1
    Red -> 2
    Orange -> 3
    Yellow -> 4
    Green -> 5
    Blue -> 6
    Violet -> 7
    Grey -> 8
    White -> 9
  }
}
