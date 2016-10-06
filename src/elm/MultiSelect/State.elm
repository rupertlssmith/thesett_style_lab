module Multiselect.State exposing (init, update)

import Dict
import Platform.Cmd exposing (Cmd)
import Material
import Multiselect.Types exposing (..)


init : Model
init =
    { mdl = Material.model
    , data =
        Dict.fromList
            [ ( 0, "Bold" )
            , ( 1, "Italic" )
            , ( 2, "Underline" )
            , ( 3, "Strikethrough" )
            ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case (Debug.log "multiselect" action) of
        Mdl action' ->
            Material.update action' model

        Selected result ->
            case result of
                Ok idx ->
                    ( model, Cmd.none )

                Err _ ->
                    ( model, Cmd.none )
