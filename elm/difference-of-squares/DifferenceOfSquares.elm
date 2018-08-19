module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)

import List


square : Int -> Int
square x =
    x * x


squareOfSum : Int -> Int
squareOfSum =
    square << List.sum << List.range 1


sumOfSquares : Int -> Int
sumOfSquares =
    List.sum << List.map square << List.range 1


difference : Int -> Int
difference n =
    squareOfSum n - sumOfSquares n
