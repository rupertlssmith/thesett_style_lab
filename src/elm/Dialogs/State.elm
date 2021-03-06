module Dialogs.State exposing (init, update)

import Platform.Cmd exposing (Cmd)
import Material
import Dialogs.Types exposing (..)


init : Model
init =
    { mdl = Material.model
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        Mdl action_ ->
            Material.update action_ model
