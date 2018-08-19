module Bob exposing (hey)

import Regex exposing (HowMany(..), regex, replace)


getAlphaNumQuestion =
    replace All (regex "[^(a-zA-Z0-9)\\s^(\\?)]") (\_ -> "") << String.trim


getAlpha =
    replace All (regex "[0-9\\s\\?]") (\_ -> "")


isQuestion =
    String.endsWith "?"


isShout remark =
    if (String.isEmpty << getAlpha) remark then
        False
    else
        String.toUpper remark == remark


hey : String -> String
hey remark =
    let
        remark_ =
            getAlphaNumQuestion remark
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
