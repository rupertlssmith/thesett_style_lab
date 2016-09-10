module Forms.View exposing (root)

import Html exposing (..)
import Html.Attributes exposing (title, class, for, id, type', pattern, action)
import Html.App as App
import Platform.Cmd exposing (Cmd)
import String
import Material.Options as Options exposing (Style, css)
import Material.Color as Color
import Material.Button as Button
import Material.Textfield as Textfield
import Forms.Types exposing (..)


root : Model -> Html Msg
root model =
    div [ class "layout-fixed-width" ]
        [ h2 []
            [ text "Forms" ]
        , form [ action "#" ]
            [ Textfield.render Mdl
                [ 2 ]
                model.mdl
                [ Textfield.label "Text..."
                , Textfield.floatingLabel
                , Textfield.text'
                ]
            ]
        , form [ action "#" ]
            [ div [ class "mdl-textfield mdl-js-textfield mdl-textfield--floating-label" ]
                [ input [ class "mdl-textfield__input", id "sample2", pattern "-?[0-9]*(\\.[0-9]+)?", type' "text" ]
                    []
                , label [ class "mdl-textfield__label", for "sample2" ]
                    [ text "Number..." ]
                , span [ class "mdl-textfield__error" ]
                    [ text "Input is not a number!" ]
                ]
            ]
        , form [ action "#" ]
            [ div [ class "mdl-textfield mdl-js-textfield mdl-textfield--floating-label" ]
                [ input [ class "mdl-textfield__input", id "sample3", type' "text" ]
                    []
                , label [ class "mdl-textfield__label", for "sample2" ]
                    [ text "Text..." ]
                ]
            ]
        , div [ class "control-bar" ]
            [ div [ class "control-bar__row" ]
                [ div [ class "control-bar__left-0" ]
                    [ Button.render Mdl
                        [ 0 ]
                        model.mdl
                        [ Button.colored
                        , Button.ripple
                        ]
                        [ text "Submit" ]
                    ]
                ]
            ]
        ]
