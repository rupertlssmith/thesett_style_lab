module Cards.View exposing (root)

import Html exposing (..)
import Html.Attributes exposing (title, class, href, src)
import Html.App as App
import Platform.Cmd exposing (Cmd)
import String
import Material.Options as Options exposing (Style, css)
import Material.Color as Color
import Cards.Types exposing (..)


root : Model -> Html Msg
root model =
    div [ class "layout-fixed-width" ]
        [ h2 []
            [ text "Cards" ]
        , div [ class "mdl-grid" ]
            [ div [ class "mdl-cell mdl-cell--6-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp" ]
                [ div [ class "mdl-card__media" ]
                    [ img [ src "images/more-from-4.png" ]
                        []
                    ]
                , div [ class "mdl-card__title" ]
                    [ h4 [ class "mdl-card__title-text" ]
                        [ text "Card 2" ]
                    ]
                , div [ class "mdl-card__supporting-text" ]
                    [ p []
                        [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. " ]
                    ]
                , div [ class "mdl-card__actions" ]
                    [ button [ class "mdl-button mdl-js-button mdl-button--primary", href "" ]
                        [ text "Link"
                        , i [ class "material-icons" ]
                            [ text "chevron_right" ]
                        ]
                    ]
                ]
            , div [ class "mdl-cell mdl-cell--6-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp" ]
                [ div [ class "mdl-card__media" ]
                    [ img [ src "images/more-from-3.png" ]
                        []
                    ]
                , div [ class "mdl-card__title" ]
                    [ h4 [ class "mdl-card__title-text" ]
                        [ text "Card 4" ]
                    ]
                , div [ class "mdl-card__supporting-text" ]
                    [ p []
                        [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. " ]
                    ]
                , div [ class "mdl-card__actions" ]
                    [ button [ class "mdl-button mdl-js-button mdl-button--primary", href "" ]
                        [ text "Link"
                        , i [ class "material-icons" ]
                            [ text "chevron_right" ]
                        ]
                    ]
                ]
            ]
        , h2 []
            [ text "One Card" ]
        ]
