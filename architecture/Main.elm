module Main exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Html.App

-- MODEL

type alias Model = Bool

init : ( Model, Cmd Msg )
init = ( False, Cmd.none )

-- MESSAGES

-- events, essentially?
type Msg 
  = Expand
  | Collapse


-- VIEW

-- show expanded or collapsed div depending on model state
view : Model -> Html Msg
view model = 
  if model then
     div []
       [ button [ onClick Collapse ] [ text "Collapse" ], 
       text "Widget"
       ]
  else 
     div []
       [ button [ onClick Expand ] [ text "Expand" ]
       ]


-- UPDATE

-- responds to possible messages (`Msg`) with new state and Cmd Msg
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
  case msg of
    Expand   -> ( True, Cmd.none )
    Collapse -> ( False, Cmd.none )


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none


-- MAIN

main : Program Never
main = 
  Html.App.program
    { init = init,
      view = view,
      update = update,
      subscriptions = subscriptions
    }


