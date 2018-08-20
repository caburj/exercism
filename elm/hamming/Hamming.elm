module Hamming exposing (distance)


distance : String -> String -> Result String Int
distance left right =
    if String.length left /= String.length right then
        Err "left and right strands must be of equal length"
    else
        let
            leftList =
                String.toList left

            rightList =
                String.toList right
        in
        Ok <| List.foldl incrementDistance 0 (zip leftList rightList)


zip : List a -> List b -> List ( a, b )
zip =
    List.map2 (,)


incrementDistance ( l, r ) d =
    if l /= r then
        d + 1
    else
        d
