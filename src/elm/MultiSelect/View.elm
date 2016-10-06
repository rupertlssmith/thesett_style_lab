module Multiselect.View exposing (root)

import Html exposing (..)
import Html.Attributes exposing (title, class, type', attribute)
import Html.Keyed
import Material.Button as Button
import Material.Icon as Icon
import Multiselect.Types exposing (..)


root : Model -> Html Msg
root model =
    div
        [ class "layout-fixed-width" ]
        [ div []
            [ h4 [] [ text "Multi-select" ]
            , Html.Keyed.node "div"
                [ class "horizontal-section" ]
                [ ( "listbox"
                  , paperListBox [ attribute "multi" "" ]
                        [ paperItem [] [ text "Bold" ]
                        , paperItem [] [ text "Italic" ]
                        , paperItem [] [ text "Underline" ]
                        , paperItem [] [ text "Strikethrough" ]
                        ]
                  )
                ]
            ]
        ]


paperListBox : List (Attribute a) -> List (Html a) -> Html a
paperListBox =
    Html.node "paper-listbox"


paperItem : List (Attribute a) -> List (Html a) -> Html a
paperItem =
    Html.node "paper-item"
