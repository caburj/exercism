module Series exposing (slices)


slices : Int -> String -> Result String (List (List Int))
slices size input =
    if String.length input < size then
        Ok []

    else if size == 0 then
        Err "Invalid size: 0"

    else
        case listDigits input of
            Err message ->
                Err message

            Ok list ->
                Ok (listOf size list)


listDigits : String -> Result String (List Int)
listDigits string =
    let
        list =
            string
                |> String.toList
                |> List.map String.fromChar
                |> List.map String.toInt

        f rval result =
            case rval of
                Ok val ->
                    case result of
                        Err message ->
                            Err message

                        Ok res ->
                            Ok (res ++ [ val ])

                Err newMessage ->
                    case result of
                        Err oldMessage ->
                            Err oldMessage

                        Ok res ->
                            Err newMessage
    in
    List.foldl f (Ok []) list


listOf : Int -> List a -> List (List a)
listOf n list =
    list
        |> List.length
        |> List.range n
        |> List.map2 (,) (List.range 0 (List.length list - n))
        |> List.map (flip slice list)


slice : ( Int, Int ) -> List a -> List a
slice ( i, j ) =
    List.take (j - i) << List.drop i
