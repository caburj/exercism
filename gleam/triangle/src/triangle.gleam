pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  triangle(a, b, c) == Equilateral
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  let t = triangle(a, b, c)
  t == Isosceles || t == Equilateral
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  triangle(a, b, c) == Scalene
}

type Triangle {
  Isosceles
  Equilateral
  Scalene
  NotATriangle
}

fn can_be_triangle(a: Float, b: Float, c: Float) -> Bool {
  a +. b >. c && a +. c >. b && b +. c >. a
}

fn triangle(a: Float, b: Float, c: Float) -> Triangle {
  case can_be_triangle(a, b, c) {
    True -> {
      case #(a == b, b == c, a == c) {
        #(True, True, True) -> Equilateral
        #(True, False, False) -> Isosceles
        #(False, True, False) -> Isosceles
        #(False, False, True) -> Isosceles
        _ -> Scalene
      }
    }
    False -> NotATriangle
  }
}
