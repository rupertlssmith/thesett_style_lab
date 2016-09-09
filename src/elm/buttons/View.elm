module Buttons.View exposing (root)

import Html exposing (..)
import Html.Attributes exposing (title, class, type')
import Html.App as App
import Platform.Cmd exposing (Cmd)
import String
import Material.Options as Options exposing (Style, css)
import Material.Color as Color
import Buttons.Types exposing (..)


root : Model -> Html Msg
root model =
    div [ class "layout-fixed-width" ]
        [ h2 []
            [ text "Buttons" ]
        , button [ class "mdl-button mdl-js-button mdl-button--primary" ]
            [ text "Button" ]
        , button [ class "mdl-button mdl-js-button mdl-button--accent" ]
            [ text "Button" ]
        , h2 []
            [ text "Chips" ]
        , span [ class "mdl-chip mdl-chip__text" ]
            [ text "Basic Chip" ]
        , span [ class "mdl-chip mdl-chip--deletable mdl-chip__text" ]
            [ text "Deletable Chip"
            , button [ class "mdl-chip__action", type' "button" ]
                [ i [ class "material-icons" ]
                    [ text "cancel" ]
                ]
            ]
        , h2 []
            [ text "Control Bar" ]
        , div [ class "control-bar" ]
            [ div [ class "control-bar__row" ]
                [ div [ class "control-bar__left-0" ]
                    [ span [ class "mdl-chip mdl-chip__text" ]
                        [ text "Basic Chip" ]
                    ]
                , div [ class "control-bar__left-3" ]
                    [ p []
                        [ text "Some text" ]
                    ]
                , div [ class "control-bar__right-0" ]
                    [ button [ class "mdl-button mdl-js-button mdl-button--fab mdl-button--colored" ]
                        [ i [ class "material-icons" ]
                            [ text "add" ]
                        ]
                    ]
                , div [ class "control-bar__right-0" ]
                    [ button [ class "mdl-button mdl-js-button mdl-button--primary" ]
                        [ text "Button" ]
                    ]
                ]
            ]
        ]
