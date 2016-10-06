module Multiselect.View exposing (root)

import Html exposing (..)
import Html.Attributes exposing (title, class, type', attribute)
import Html.Events exposing (on)
import Html.Keyed
import Material.Button as Button
import Material.Icon as Icon
import Multiselect.Types exposing (..)
import Json.Decode


root : Model -> Html Msg
root model =
    div
        [ class "layout-fixed-width" ]
        [ div []
            [ h4 [] [ text "Multi-select" ]
            , Html.Keyed.node "div"
                [ class "horizontal-section" ]
                [ ( "listbox"
                  , paperListBox [ attribute "multi" "" {- , on "selected" selectedDecoder -} ]
                        [ paperItem [] [ text "Bold" ]
                        , paperItem [] [ text "Italic" ]
                        , paperItem [] [ text "Underline" ]
                        , paperItem [] [ text "Strikethrough" ]
                        ]
                  )
                ]
            ]
        ]



-- selectedDecoder : Json.Decode.Decoder Msg
-- selectedDecoder decoder =
--     Selected


paperListBox : List (Attribute a) -> List (Html a) -> Html a
paperListBox =
    Html.node "paper-listbox"


paperItem : List (Attribute a) -> List (Html a) -> Html a
paperItem =
    Html.node "paper-item"
