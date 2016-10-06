module Multiselect.View exposing (root)

import String
import Html exposing (..)
import Html.Attributes exposing (title, class, type', attribute, value)
import Html.Events exposing (on)
import Html.Keyed
import Material.Button as Button
import Material.Icon as Icon
import Multiselect.Types exposing (..)
import Json.Decode as Decode


root : Model -> Html Msg
root model =
    div
        [ class "layout-fixed-width" ]
        [ div []
            [ h4 [] [ text "Multi-select" ]
            , Html.Keyed.node "div"
                [ class "horizontal-section" ]
                [ ( "listbox"
                  , paperListBox
                        [ attribute "multi" ""
                        , attribute "attr-for-selected" "value"
                        , on "iron-select" (selectedDecoder |> Decode.map Selected)
                        ]
                        [ paperItem [ value "0" ] [ text "Bold" ]
                        , paperItem [ value "1" ] [ text "Italic" ]
                        , paperItem [ value "2" ] [ text "Underline" ]
                        , paperItem [ value "3" ] [ text "Strikethrough" ]
                        ]
                  )
                ]
            ]
        ]


selectedDecoder : Decode.Decoder (Result String Int)
selectedDecoder =
    Decode.at [ "detail", "item", "value" ] Decode.string |> Decode.map String.toInt


paperListBox : List (Attribute a) -> List (Html a) -> Html a
paperListBox =
    Html.node "paper-listbox"


paperItem : List (Attribute a) -> List (Html a) -> Html a
paperItem =
    Html.node "paper-item"
