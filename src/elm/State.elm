module Main.State exposing (init, update)

import Platform.Cmd exposing (..)
import Material
import Material.Helpers exposing (pure, lift, lift')
import Layout.State
import Menu.State
import Tables.State
import Buttons.State
import Cards.State
import Main.Types exposing (..)


log =
    Debug.log "top"


init : Model
init =
    { mdl = Material.model
    , accounts = Tables.State.init
    , roles = Buttons.State.init
    , permissions = Cards.State.init
    , layout = Layout.State.init
    , menus = Menu.State.init
    , selectedTab = 0
    , transparentHeader = False
    , debugStylesheet = False
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        SelectTab k ->
            ( { model | selectedTab = k }, Cmd.none )

        ToggleHeader ->
            ( { model | transparentHeader = not model.transparentHeader }, Cmd.none )

        Mdl msg ->
            Material.update msg model

        TablesMsg a ->
            lift .accounts (\m x -> { m | accounts = x }) TablesMsg Tables.State.update a model

        ButtonsMsg a ->
            lift .roles (\m x -> { m | roles = x }) ButtonsMsg Buttons.State.update a model

        CardsMsg a ->
            lift .permissions (\m x -> { m | permissions = x }) CardsMsg Cards.State.update a model

        LayoutMsg a ->
            lift .layout (\m x -> { m | layout = x }) LayoutMsg Layout.State.update a model

        MenusMsg a ->
            lift .menus (\m x -> { m | menus = x }) MenusMsg Menu.State.update a model

        ToggleDebug ->
            let
                d =
                    log "toggle debug"
            in
                ( { model | debugStylesheet = not model.debugStylesheet }, Cmd.none )
