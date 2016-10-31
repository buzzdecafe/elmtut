module Message exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Html.App
import Random


type alias Model = Int


init : ( Model, Cmd Msg )
init = ( 1, Cmd.none )


type Msg 
  = Roll
  | OnResult Int


view : Model -> Html Msg
view model = 
  div [] [ 
    button [ onClick Roll ] [ text "Roll" ],
    text (toString model) 
  ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
  case msg of
    Roll         -> ( model, Random.generate OnResult (Random.int 1 6) )
    OnResult res -> ( res, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model = 
  Sub.none


main : Program Never
main = 
  Html.App.program {
    init = init,
    view = view,
    update = update,
    subscriptions = subscriptions
  }


