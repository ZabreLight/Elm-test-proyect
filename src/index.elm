import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Input.Number as Number
import Image exposing (Image)
import Styles exposing (..)

main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }

-- MODEL
type alias Model = {
          operator: String,
          number1 : Maybe Int,
          number2 : Maybe Int,
          result : Maybe Int
        }

type alias Image =
    { url : String
    , width : Int
    , height : Int
    }

model : Model
model = { operator = "Select an operator", number1 = Nothing, number2 = Nothing, result = Nothing}

test : Image
test = { url = "./assets/wallpaper.jpg", width = 500, height = 500}

inputOptions : Number.Options Msg
inputOptions = Number.defaultOptions SaveFirstNumber

inputOptions2 : Number.Options Msg
inputOptions2 = Number.defaultOptions SaveSecondNumber

-- UPDATE
type Msg = NoOp | SaveFirstNumber (Maybe Int) | SaveSecondNumber (Maybe Int)
  | Sum | Substract | Multiply | Divide | Clear

update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp ->
      model

    SaveFirstNumber value ->
        {model | number1 = value }

    SaveSecondNumber value ->
        {model | number2 = value }

    Sum  ->
        {model | operator = "+", result = Maybe.map2(+) model.number1 model.number2 }

    Substract ->
        {model | operator = "-", result = Maybe.map2(-) model.number1 model.number2 }

    Multiply ->
        {model | operator = "x", result = Maybe.map2(*) model.number1 model.number2 }

    Divide ->
        {model | operator = "/", result = Maybe.map2(//) model.number1 model.number2 }

    Clear ->
        {model | operator = "Select an operator", number1 = Nothing, number2 = Nothing, result = Nothing }

-- VIEW
view : Model -> Html Msg
view model =
  div [Styles.megaBox] [
    div [Styles.title] [text ( "Awsome Calculator" )]
  , div [Styles.inputs] [
        Number.input inputOptions [class "numberInput", Styles.label] model.number1
      , div [Styles.label] [text (model.operator)]
      , Number.input inputOptions2 [class "numberInput", Styles.label] model.number2
      , div [Styles.label] [text ("=")]
      , div [Styles.label] [text ( toString (Maybe.withDefault 0 model.result) )]
      ]
  , div [Styles.operations] [
        button [ Styles.myButton, onClick Sum ] [ text "Add" ]
      , button [ Styles.myButton, onClick Substract ] [ text "Substract" ]
      , button [ Styles.myButton, onClick Multiply ] [ text "Multiply" ]
      , button [ Styles.myButton, onClick Divide ] [ text "Divide" ]
      , button [ Styles.myButton, onClick Clear ] [ text "Clear" ]
      ]
  , Image.viewImg [Styles.margin] test
  , div[Styles.goodbye] [
      div [Styles.normal] [text ( "If you want to leave we understand" )]
    , a [ href "http://google.com" ] [ text "Click here to go to a more popular page" ]
    ]
 ]
