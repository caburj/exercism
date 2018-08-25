module Bob exposing (hey)

import Char



-- import Regex exposing (HowMany(..), regex, replace)
-- getAlphaNumQuestion : String -> String
-- getAlphaNumQuestion =
--     replace All (regex "[^(a-zA-Z0-9)\\s^(\\?)]") (\_ -> "") << String.trim
-- getAlpha : String -> String
-- getAlpha =
--     replace All (regex "[0-9\\s\\?]") (\_ -> "")


onlyAlphabets : String -> String
onlyAlphabets =
    String.filter isAlphabet


{-| I can't find a built-in function that checks whether a char is an alphabet,
so I just implemented a simple check, might work in most cases, meh..
-}
isAlphabet : Char -> Bool
isAlphabet c =
    not (Char.toLower c == c && Char.toUpper c == c)


isQuestion : String -> Bool
isQuestion =
    String.endsWith "?"


isShout : String -> Bool
isShout remark =
    String.toUpper remark == remark && not ((String.isEmpty << onlyAlphabets) remark)


hey : String -> String
hey remark =
    let
        remark_ =
            String.trim remark
    in
    if isQuestion remark_ then
        if isShout remark_ then
            "Calm down, I know what I'm doing!"

        else
            "Sure."

    else if String.isEmpty remark_ then
        "Fine. Be that way!"

    else if isShout remark_ then
        "Whoa, chill out!"

    else
        "Whatever."
