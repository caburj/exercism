module TwelveDays exposing (recite)

import Array exposing (Array)
import Maybe


recite : Int -> Int -> List String
recite start stop =
    List.map chant (List.range start stop)


chant : Int -> String
chant n =
    intro n ++ content n


intro : Int -> String
intro n =
    "On the " ++ rank n ++ " day of Christmas my true love gave to me, "


content : Int -> String
content n =
    content_ n n


{-| This helper function is created to properly handle "and" before
"Partridge in a Pear Tree" when n is not 1. I know it is ugly but I
can't seem to find a better way to handle it.
-}
content_ : Int -> Int -> String
content_ n origN =
    if n == 1 then
        perhapsAnd origN ++ giftPhrase n ++ "."

    else
        giftPhrase n ++ ", " ++ content_ (n - 1) origN


perhapsAnd : Int -> String
perhapsAnd origN =
    if origN == 1 then
        ""

    else
        "and "


giftPhrase : Int -> String
giftPhrase n =
    count n ++ " " ++ gift n


rank : Int -> String
rank =
    getByIndex ranks


count : Int -> String
count =
    getByIndex counts


gift : Int -> String
gift =
    getByIndex gifts


{-| I know that numbers outside the range of 1-12 will not be tested
so I decided to not handle any error. Thus, this implementation of
getting value from an array by index.
-}
getByIndex : Array String -> Int -> String
getByIndex array index =
    Maybe.withDefault "none" << Array.get (index - 1) <| array


ranks : Array String
ranks =
    Array.fromList
        [ "first"
        , "second"
        , "third"
        , "fourth"
        , "fifth"
        , "sixth"
        , "seventh"
        , "eighth"
        , "ninth"
        , "tenth"
        , "eleventh"
        , "twelfth"
        ]


counts : Array String
counts =
    Array.fromList
        [ "a"
        , "two"
        , "three"
        , "four"
        , "five"
        , "six"
        , "seven"
        , "eight"
        , "nine"
        , "ten"
        , "eleven"
        , "twelve"
        ]


gifts : Array String
gifts =
    Array.fromList
        [ "Partridge in a Pear Tree"
        , "Turtle Doves"
        , "French Hens"
        , "Calling Birds"
        , "Gold Rings"
        , "Geese-a-Laying"
        , "Swans-a-Swimming"
        , "Maids-a-Milking"
        , "Ladies Dancing"
        , "Lords-a-Leaping"
        , "Pipers Piping"
        , "Drummers Drumming"
        ]
