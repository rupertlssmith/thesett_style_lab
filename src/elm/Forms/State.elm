module Forms.State exposing (init, update)

import Platform.Cmd exposing (Cmd)
import Material
import Forms.Types exposing (..)


init : Model
init =
    { mdl = Material.model
    , str4 = ""
    }


pure : Model -> Maybe ( Model, Cmd Msg )
pure =
    flip (,) Cmd.none >> Just


update : Msg -> Model -> Maybe ( Model, Cmd Msg )
update action model =
    case action of
        Mdl action' ->
            Material.update action' model |> Just

        Upd4 str ->
            { model | str4 = str } |> pure
