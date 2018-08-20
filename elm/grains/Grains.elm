module Grains exposing (square)


square : Int -> Maybe Int
square n =
    if n < 1 then
        Nothing
    else
        Just << exp 2 <| (n - 1)


exp : Int -> Int -> Int
exp a n =
    if n == 0 then
        1
    else
        a * exp a (n - 1)
