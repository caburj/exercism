module LargestSeriesProduct exposing (largestProduct)


largestProduct : Int -> String -> Maybe Int
largestProduct length series =
    if length < 0 then
        Nothing

    else
        series
            |> String.toList
            |> List.map String.fromChar
            |> List.map String.toInt
            |> unwrap
            |> contiguousSublists length
            |> List.map List.product
            |> List.maximum


unwrap : List (Result String Int) -> List Int
unwrap =
    let
        f a acc =
            case ( a, acc ) of
                ( Err _, _ ) ->
                    []

                ( Ok val, xs ) ->
                    xs ++ [ val ]
    in
    List.foldl f []


{-| This is from elm/series exercise. The `listOf` function is renamed.
-}
contiguousSublists : Int -> List a -> List (List a)
contiguousSublists n list =
    list
        |> List.length
        |> List.range n
        |> List.map2 (,) (List.range 0 (List.length list - n))
        |> List.map (flip slice list)


slice : ( Int, Int ) -> List a -> List a
slice ( i, j ) =
    List.take (j - i) << List.drop i
