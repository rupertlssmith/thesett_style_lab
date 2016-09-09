module Main.Types exposing (..)

import Material
import Layout.Types
import Menu.Types
import Tables.Types
import Buttons.Types
import Cards.Types


type alias Model =
    { mdl : Material.Model
    , accounts : Tables.Types.Model
    , roles : Buttons.Types.Model
    , permissions : Cards.Types.Model
    , layout : Layout.Types.Model
    , menus : Menu.Types.Model
    , selectedTab : Int
    , transparentHeader : Bool
    , debugStylesheet : Bool
    }


type Msg
    = SelectTab Int
    | Mdl (Material.Msg Msg)
    | TablesMsg Tables.Types.Msg
    | ButtonsMsg Buttons.Types.Msg
    | CardsMsg Cards.Types.Msg
    | LayoutMsg Layout.Types.Msg
    | MenusMsg Menu.Types.Msg
    | ToggleHeader
    | ToggleDebug
