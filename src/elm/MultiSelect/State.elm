module Multiselect.State exposing (init, update)

import Platform.Cmd exposing (Cmd)
import Material
import Multiselect.Types exposing (..)


init : Model
init =
    { mdl = Material.model
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        Mdl action' ->
            Material.update action' model
