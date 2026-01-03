module Core.UI where

import Miso
import Core.Model
import Core.Calc
import Core.Trace
import Core.Interop.CKernel

data Model = Model
  { params :: Params
  , result :: Maybe Result
  , trace  :: Maybe Trace
  }

data Action
  = Compute
  | NoOp

initialModel :: Model
initialModel = Model
  { params = defaultParams
  , result = Nothing
  , trace  = Nothing
  }

updateModel :: Action -> Model -> Effect Action Model
updateModel Compute m =
  let (r, t) = run params m
  in noEff m { result = Just r, trace = Just t }

updateModel _ m = noEff m

viewModel :: Model -> View Action
viewModel m =
  div_ []
    [ button_ [ onClick Compute ] [ text "Compute" ]
    , text (show (result m))
    ]

main :: IO ()
main = startApp App
  { initialAction = NoOp
  , model  = initialModel
  , update = updateModel
  , view   = viewModel
  , events = defaultEvents
  , subs   = []
  , mountPoint = Nothing
  }
