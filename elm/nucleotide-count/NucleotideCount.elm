module NucleotideCount exposing (nucleotideCounts, version)


version : Int
version =
    2


type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


count : Char -> String -> Int
count char =
    String.length << String.filter (\c -> c == char)


nucleotideCounts : String -> NucleotideCounts
nucleotideCounts sequence =
    let
        a =
            count 'A' sequence

        t =
            count 'T' sequence

        c =
            count 'C' sequence

        g =
            count 'G' sequence
    in
    NucleotideCounts a t c g
