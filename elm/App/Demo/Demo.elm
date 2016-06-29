module App.Demo.Demo exposing
  ( init, update, urlUpdate, view, subscriptions, pathnameParser
  , Model, Msg
  )

{-| The main demo component. Handles the demo section routing.
-}

import Html exposing (text, Html)
import Navigation
import UrlParser exposing (format, s, oneOf, (</>))
import App.Demo.DemoRoute exposing (Route(..))

type alias Model =
  { routeModel: Route
  }

type Msg =
    Noop

init : Route -> (Model, Cmd Msg)
init route =
  ( { routeModel = route
    }
  , Cmd.none
  )

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  ( model, Cmd.none )

urlUpdate : Route -> Model -> (Model, Cmd Msg)
urlUpdate route model =
  ( { model | routeModel = route }
  , Cmd.none
  )

view : Model -> Html Msg
view model =
  text <| "Demo: " ++ case model.routeModel of
    DemoRoute ->
      "Main Page"
    AccordionDemoRoute ->
      "Accordion Page"
    CheckboxDemoRoute ->
      "Checkbox Page"
    OtherDemoRoute ->
      "Other Demo Page"

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

pathnameParser: UrlParser.Parser (Route -> a) a
pathnameParser =
  oneOf
    [ format AccordionDemoRoute (s "accordion")
    , format CheckboxDemoRoute (s "checkbox")
    , format OtherDemoRoute (s "other")
    , format DemoRoute (s "")
    ]
