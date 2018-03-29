module Styles exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

megaBox =
  style
    [ ("display", "flex")
    , ("flex-direction", "column")
    , ("background-color", "#F5F5F5")
    , ("align-items", "center")
    , ("padding", "100px 340px") ]

inputs =
  style
    [ ("display", "flex")
    , ("flex-direction", "row")
    , ("justify-content", "space-around")
    , ("align-items", "baseline")
    , ("text-align", "center")
    , ("margin-bottom", "30px") ]

myButton =
  style
  [ ("border-radius", "5px")
  , ("background-color", "#1E90FF")
  , ("height", "30px")
  , ("width", "100px")
  , ("color", "white")
  , ("font-size", "20px")
  , ("margin-right", "30px") ]

label =
  style
  [  ("font-size", "25px")
  , ("margin-right", "30px")
  , ("text-align", "center") ]

title =
  style
  [ ("align-self", "center")
  , ("font-size", "45px")
  , ("margin-bottom", "50px") ]

operations =
  style
  [ ("display", "flex")
  , ("flex-direction", "row")
  , ("justify-content", "space-around")
  , ("margin-bottom", "50px") ]

margin =
  style [("margin-bottom", "50px")]

normal =
  style
  [ ("font-size", "18px")
  , ("margin-right", "10px")]  

goodbye =
  style
  [ ("display", "flex")
  , ("flex-direction", "row")
  , ("margin-bottom", "50px") ]
