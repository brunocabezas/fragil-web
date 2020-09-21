module Components.Carousel exposing
    ( Carousel
    , create
    , next
    , previous
    , select
    , view
    )

import Array
import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events as Events


type Carousel slide
    = Carousel (Internals slide)


type alias Internals slide =
    { index : Int
    , first : slide -- guarantees at least one element
    , others : List slide
    }


create : slide -> List slide -> Carousel slide
create first others =
    Carousel
        { index = 0
        , first = first
        , others = others
        }


next : Carousel slide -> Carousel slide
next (Carousel internals) =
    Carousel
        { internals | index = modBy (length internals) (internals.index + 1) }


previous : Carousel slide -> Carousel slide
previous (Carousel internals) =
    Carousel
        { internals | index = modBy (length internals) (internals.index - 1) }


select : Int -> Carousel slide -> Carousel slide
select index (Carousel internals) =
    if index >= length internals then
        Carousel internals
        -- no update if out of bounds

    else
        Carousel { internals | index = index }


view :
    { carousel : Carousel slide
    , onNext : msg
    , onPrevious : msg
    , onSelect : Int -> msg
    , viewSlide : slide -> Html msg
    }
    -> Html msg
view options =
    let
        (Carousel internals) =
            options.carousel
    in
    div [ class "carousel" ]
        [ options.viewSlide (current internals)
        , div [ class "controls" ]
            [ button [ Events.onClick options.onPrevious ] [ text "Previous" ]
            , div [ class "dots" ]
                (List.range 0 (length internals - 1)
                    |> List.map (\index -> button [ class "dot", Events.onClick (options.onSelect index) ] [])
                )
            , button [ Events.onClick options.onNext ] [ text "Next" ]
            ]
        ]



-- INTERNALS


length : Internals slide -> Int
length { first, others } =
    List.length (first :: others)


current : Internals slide -> slide
current { index, first, others } =
    Array.fromList (first :: others)
        |> Array.get index
        |> Maybe.withDefault first
