module RNATranscription exposing (toRNA)


getComplement code =
    case code of
        'G' ->
            'C'

        'C' ->
            'G'

        'T' ->
            'A'

        'A' ->
            'U'

        _ ->
            ' '


toRNA : String -> Result Char String
toRNA dna =
    Ok <| String.map getComplement dna
