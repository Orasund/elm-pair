module Example exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Pair
import Test exposing (..)


suite : Test
suite =
    describe "The Pair module"
        [ test "map ((+) 2) (1,2) == (3,4)" <|
            \_ ->
                Pair.map ((+) 2) ( 1, 2 )
                    |> Expect.equal ( 3, 4 )
        , test "map2 (+) (1,2) (3,4) == (4,6)" <|
            \_ ->
                Pair.map2 (+) ( 1, 2 ) ( 3, 4 )
                    |> Expect.equal ( 4, 6 )
        , test "foldl (//) 1 (1,2) == 2" <|
            \_ ->
                Pair.foldl (//) 1 ( 1, 2 )
                    |> Expect.equal 2
        , test "foldr (//) 1 (1,2) == 0" <|
            \_ ->
                Pair.foldr (//) 1 ( 1, 2 )
                    |> Expect.equal 0
        ]
