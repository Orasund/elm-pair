module Example exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Pair
import Test exposing (..)
import Tuple.Extra


suite : Test
suite =
    describe "Testing the Package"
        [ describe "The Pair module"
            [ test "map ((+) 2) (1,2) == (3,4)" <|
                \_ ->
                    Pair.map ((+) 2) ( 1, 2 )
                        |> Expect.equal ( 3, 4 )
            , test "map2 (-) (1,2) (3,4) == (-2,-2)" <|
                \_ ->
                    Pair.map2 (-) ( 1, 2 ) ( 3, 4 )
                        |> Expect.equal ( -2, -2 )
            , test "foldl (//) 1 (1,2) == 2" <|
                \_ ->
                    Pair.foldl (//) 1 ( 1, 2 )
                        |> Expect.equal 2
            , test "foldr (//) 1 (1,2) == 0" <|
                \_ ->
                    Pair.foldr (//) 1 ( 1, 2 )
                        |> Expect.equal 0
            , test "foldr (::) [] (1,2) == [1,2]" <|
                \_ ->
                    Pair.foldr (::) [] ( 1, 2 )
                        |> Expect.equal [ 1, 2 ]
            , test "foldl (::) [] (1,2) == [2,1]" <|
                \_ ->
                    Pair.foldl (::) [] ( 1, 2 )
                        |> Expect.equal [ 2, 1 ]
            , test "toList(1,2) == foldr (::) [] (1,2)" <|
                \_ ->
                    Pair.toList ( 1, 2 )
                        |> Expect.equal (Pair.foldr (::) [] ( 1, 2 ))
            , test "unzip ((1,Nothing),(2,Just 1)) == ((1,2),(Nothing,Just 1))" <|
                \_ ->
                    Pair.unzip ( ( 1, Nothing ), ( 2, Just 1 ) )
                        |> Expect.equal ( ( 1, 2 ), ( Nothing, Just 1 ) )
            , test "all ((==) 0) (0,0) == True" <|
                \_ ->
                    Pair.all ((==) 0) ( 0, 0 )
                        |> Expect.equal True
            , test "all ((==) 0) (1,0) == False" <|
                \_ ->
                    Pair.all ((==) 0) ( 1, 0 )
                        |> Expect.equal False
            , test "any ((==) 0) (1,2) == False" <|
                \_ ->
                    Pair.any ((==) 0) ( 1, 2 )
                        |> Expect.equal False
            , test "any ((==) 0) (1,0) == True" <|
                \_ ->
                    Pair.any ((==) 0) ( 1, 0 )
                        |> Expect.equal True
            ]
        , describe "The Tuple.Extra module"
            [ test "apply (+) (1,2) == 3" <|
                \_ ->
                    Tuple.Extra.apply (+) ( 1, 2 )
                        |> Expect.equal 3
            , test "mapEach funA funB (a,b) == (Tuple.mapFirst funA << Tuple.mapSecond funB) (a,b)" <|
                \_ ->
                    Tuple.Extra.mapEach ((+) 2) ((+) 4) ( 1, 1 )
                        |> Expect.equal ((Tuple.mapFirst ((+) 2) << Tuple.mapSecond ((+) 4)) ( 1, 1 ))
            , test "swap (a,b) == (b,a)" <|
                \_ ->
                    Tuple.Extra.swap ( 1, 2 )
                        |> Expect.equal ( 2, 1 )
            , test "swap (swap(a,b)) == (a,b)" <|
                \_ ->
                    Tuple.Extra.swap (Tuple.Extra.swap ( 1, 2 ))
                        |> Expect.equal ( 1, 2 )
            ]
        ]
