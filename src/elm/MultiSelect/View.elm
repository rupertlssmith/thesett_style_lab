module Multiselect.View exposing (root)

import Html exposing (..)
import Html.Attributes exposing (title, class, type', attribute)
import Html.Keyed
import Material.Button as Button
import Material.Icon as Icon
import Multiselect.Types exposing (..)


root : Model -> Html Msg
root model =
    div [ class "layout-fixed-width" ]
        [ div [ class "horizontal-section-container" ]
            [ h4 [] [ text "Multiselect" ]
            , paperListBox [ attribute "multi" "" ]
                [ ( "item1", paperItem [] [ ( "1", text "Bold" ) ] )
                , ( "item2", paperItem [] [ ( "2", text "Italic" ) ] )
                , ( "item3", paperItem [] [ ( "3", text "Underline" ) ] )
                , ( "item4", paperItem [] [ ( "4", text "Strikethrough" ) ] )
                ]
            ]
        ]


paperListBox : List (Attribute a) -> List ( String, Html a ) -> Html a
paperListBox =
    Html.Keyed.node "paper-listbox"


paperItem : List (Attribute a) -> List ( String, Html a ) -> Html a
paperItem =
    Html.Keyed.node "paper-item"
