module RunLengthEncoding exposing (decode, encode, version)

import Char


version =
    2


encode : String -> String
encode =
    convert "" << String.foldr updateCounter []


updateCounter : Char -> List ( Char, Int ) -> List ( Char, Int )
updateCounter c pairs =
    case pairs of
        [] ->
            ( c, 1 ) :: []

        ( oldC, count ) :: xs ->
            if oldC == c then
                ( oldC, (+) 1 count ) :: xs

            else
                ( c, 1 ) :: ( oldC, count ) :: xs


convert : String -> List ( Char, Int ) -> String
convert string pairs =
    case pairs of
        [] ->
            string

        ( c, count ) :: xs ->
            if count == 1 then
                convert (string ++ String.fromChar c) xs

            else
                convert (string ++ toString count ++ String.fromChar c) xs


decode : String -> String
decode =
    decode_ "" [] << String.toList


decode_ : String -> List Char -> List Char -> String
decode_ result digits charList =
    case charList of
        [] ->
            result

        x :: xs ->
            if Char.isDigit x then
                decode_ result (digits ++ [ x ]) xs

            else
                decode_ (result ++ (String.fromList << List.repeat (toInt digits)) x) [] xs


toInt : List Char -> Int
toInt digits =
    case String.toInt << String.fromList <| digits of
        Ok val ->
            val

        Err _ ->
            1
