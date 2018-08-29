module Sublist exposing (ListComparison(..), sublist, version)


version : Int
version =
    2


type ListComparison
    = Equal
    | Superlist
    | Sublist
    | Unequal


sublist : List a -> List a -> ListComparison
sublist alist blist =
    case ( alist, blist ) of
        ( [], [] ) ->
            Equal

        ( [], _ ) ->
            Sublist

        ( _, [] ) ->
            Superlist

        ( _, _ ) ->
            let
                alen =
                    List.length alist

                blen =
                    List.length blist
            in
            if alen == blen then
                iff (List.all identity <| List.map2 (==) alist blist) Equal Unequal

            else if alen < blen then
                iff (subset alist blist) Sublist Unequal

            else
                iff (subset blist alist) Superlist Unequal


subset : List a -> List a -> Bool
subset slist blist =
    List.foldl (equalToList slist) False (listOf (List.length slist) blist)


equalToList : List a -> List a -> Bool -> Bool
equalToList slist list val =
    val || (List.all identity <| List.map2 (==) slist list)


listOf : Int -> List a -> List (List a)
listOf n blist =
    List.map (flip slice blist) (List.map2 (,) (List.range 0 (List.length blist - n)) (List.range n (List.length blist)))


slice : ( Int, Int ) -> List a -> List a
slice ( i, j ) =
    List.drop i << List.take (j - i + 1)


iff : Bool -> a -> a -> a
iff pred a b =
    if pred then
        a

    else
        b
