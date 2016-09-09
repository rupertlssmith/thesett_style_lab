module Forms.State exposing (init, update)

import Platform.Cmd exposing (Cmd)
import Material
import Material.Helpers exposing (lift)
import Forms.Types exposing (..)


init : Model
init =
    { mdl = Material.model
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        Mdl action' ->
            Material.update action' model
