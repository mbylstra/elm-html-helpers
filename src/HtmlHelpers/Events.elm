module HtmlHelpers.Events exposing (..)

{-| Some event helpers

@docs stopClickPropagation
@docs onClickWithDefaultPrevented
-}

import Json.Decode
import Html exposing (Html, a, Attribute, span)
import Html.Events exposing (onWithOptions)

{-| Return an attribute that stops click propagation. A message must be supplied.
    Pass a NoOp message if you don't want the click to do anything.
-}
stopClickPropagation : msg -> Attribute msg
stopClickPropagation message =
  onWithOptions
    "click"
    { stopPropagation = True
    , preventDefault = False
    }
    (Json.Decode.succeed message)


{-| an onClick handler, where the default is prevented -}
onClickWithDefaultPrevented : msg -> Attribute msg
onClickWithDefaultPrevented message =
  onWithOptions
    "click"
    { preventDefault = True
    , stopPropagation = False
    }
    (Json.Decode.succeed message)
