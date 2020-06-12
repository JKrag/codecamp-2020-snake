module Main exposing (..)

import Browser exposing (Document)
import Browser.Events exposing (onKeyDown)
import Color
import GlobalCSS exposing (globalCSS)
import Html.Attributes as HtmlAttributes
import KeyInput exposing (keyDecoder)
import String exposing (lines)
import TypedSvg exposing (..)
import TypedSvg.Attributes as Attr exposing (..)
import TypedSvg.Types exposing (Paint(..), px)


type alias Model =
    { apple :
        { x : Float
        , y : Float
        }
    , snake :
        List
            { x : Float
            , y : Float
            }
    }


type Msg
    = Up
    | Continue


main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : () -> ( Model, Cmd Msg )
init flags =
    ( { apple = { x = 4, y = 1 }
      , snake =
            [ { x = 1, y = 1 }
            , { x = 1, y = 2 }
            ]
      }
    , Cmd.none
    )


tileSize =
    100


view { apple, snake } =
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
            (List.map snakePart snake
                ++ [ appleShape apple ]
            )
        ]
    }


snakePart { x, y } =
    rect
        [ Attr.x (px (x * tileSize))
        , Attr.y (px (y * tileSize))
        , width (px tileSize)
        , height (px tileSize)
        , stroke (Paint Color.green)
        , fill (Paint Color.green)
        ]
        []


appleShape { x, y } =
    circle
        [ cx (px (x * tileSize + (tileSize / 2)))
        , cy (px (y * tileSize + (tileSize / 2)))
        , r (px (tileSize / 2))
        , stroke (Paint Color.red)
        , fill (Paint Color.red)
        ]
        []


update msg model =
    ( model, Cmd.none )


subscriptions model =
    onKeyDown (keyDecoder keyToMessage)


keyToMessage string =
    case string of
        "ArrowUp" ->
            Up

        _ ->
            Continue
