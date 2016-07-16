module HtmlHelpers
  exposing
    ( aButton
    , emptyHtml
    , maybeHtml
    , maybeView
    )


{-| Some helper functions for creating html }

@docs aButton
@docs emptyHtml
@docs maybeHtml
@docs maybeView

-}

import Html exposing (Html, a, Attribute, span)
import Html.Attributes exposing (style)

import HtmlHelpers.Events exposing (..)

{-| create an `a` tag with no href that can be used as a button
-}
aButton : msg -> List (Attribute msg) -> List (Html msg) -> Html msg
aButton onClickMessage attrs children =
  a
    ([ onClickWithDefaultPrevented onClickMessage, style [("cursor", "pointer")]] ++ attrs)
    children

{-| A span tag with style set to display: none.
-}
emptyHtml : Html msg
emptyHtml = span [ style [( "display", "none")] ] []

{-| Return empty html if the argument is Nothing
-}
maybeHtml : Maybe (Html msg) -> Html msg
maybeHtml maybeHtml' =
  Maybe.withDefault emptyHtml maybeHtml'

{-| If the model is Nothing, then return emply html, else call the given
  view function on the model.
-}
maybeView: (model -> Html msg) -> Maybe model -> Html msg
maybeView viewFunction maybeModel =
  case maybeModel of
    Just model ->
      viewFunction model
    Nothing ->
      emptyHtml
