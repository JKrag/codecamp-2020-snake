module Main exposing (..)

import Browser
import Color
import GlobalCSS exposing (globalCSS)
import Html.Attributes as HtmlAttributes
import String exposing (lines)
import TypedSvg exposing (..)
import TypedSvg.Attributes exposing (..)
import TypedSvg.Types exposing (Paint(..), px)


type alias Model =
    ()


type alias Msg =
    Never


main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : () -> ( Model, Cmd Msg )
init flags =
    ( (), Cmd.none )


view model =
    { title = "Hello World!"
    , body =
        [ globalCSS
        , svg
            [ HtmlAttributes.style
                "width"
                "100vw"
            , HtmlAttributes.style
                "height"
                "100vh"
            ]
            [ rect
                [ x (px 100)
                , y (px 100)
                , width (px 200)
                , height (px 100)
                , stroke (Paint Color.blue)
                ]
                []
            ]
        ]
    }


update msg model =
    ( model, Cmd.none )


subscriptions model =
    Sub.none
