module CollatzConjecture exposing (collatz)


collatz : Int -> Result String Int
collatz start =
    if start <= 0 then
        Err "Only positive numbers are allowed"
    else
        Ok <| collatz_ 0 start


collatz_ : Int -> Int -> Int
collatz_ count start =
    if start == 1 then
        count
    else if isEven start then
        collatz_ (count + 1) (start // 2)
    else
        collatz_ (count + 1) (3 * start + 1)


isEven : Int -> Bool
isEven n =
    n % 2 == 0
