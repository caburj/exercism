module Pangram exposing (isPangram)


isPangram : String -> Bool
isPangram =
    pangramCheck << String.trim << String.toLower


pangramCheck : String -> Bool
pangramCheck =
    List.all (\( a, b ) -> b) << List.foldl updateAlphabetMap alphabetMap << String.toList


updateAlphabetMap : Char -> List ( Char, Bool ) -> List ( Char, Bool )
updateAlphabetMap c =
    List.map
        (\( a, b ) ->
            if c == a then
                ( a, True )

            else
                ( a, b )
        )


alphabetMap : List ( Char, Bool )
alphabetMap =
    List.map2 (,) (String.toList "abcdefghijklmnopqrstuvwxyz") (List.repeat 26 False)
