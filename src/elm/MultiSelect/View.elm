module Multiselect.View exposing (root)

import Html exposing (..)
import Html.Attributes exposing (title, class, type')
import Material.Button as Button
import Material.Icon as Icon
import Multiselect.Types exposing (..)


root : Model -> Html Msg
root model =
    div [ class "layout-fixed-width" ]
        [ h2 []
            [ text "Multiselect" ]
        , span [ class "mdl-chip mdl-chip__text" ]
            [ text "Basic Chip" ]
        , span [ class "mdl-chip mdl-chip--deletable mdl-chip__text" ]
            [ text "Deletable Chip"
            , button [ class "mdl-chip__action", type' "button" ]
                [ i [ class "material-icons" ]
                    [ text "cancel" ]
                ]
            ]
        ]
