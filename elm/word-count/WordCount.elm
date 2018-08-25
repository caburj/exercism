module WordCount exposing (wordCount)

import Dict exposing (Dict)
import Regex exposing (HowMany(..), regex, replace, split)



-- look into each word. if word in the counter, update counter, else, insert.


wordCount : String -> Dict String Int
wordCount sentence =
    iter updateCounter Dict.empty (words sentence)


words : String -> List String
words =
    split All (regex "\\s+") << String.trim << replace All (regex "[^a-zA-Z0-9\\s]") (\_ -> "") << String.toLower


updateCounter : Dict String Int -> String -> Dict String Int
updateCounter counter word =
    if Dict.member word counter then
        Dict.update word increment counter

    else
        Dict.insert word 1 counter


increment : Maybe Int -> Maybe Int
increment maybeN =
    case maybeN of
        Nothing ->
            Nothing

        Just n ->
            Just <| n + 1


{-| iterator: apply the function [to start and list item] over and over until out of items.
Outputs the final value of start.
-}
iter : (b -> a -> b) -> b -> List a -> b
iter f start list =
    case list of
        [] ->
            start

        x :: xs ->
            iter f (f start x) xs
