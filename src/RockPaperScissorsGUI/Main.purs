module RockPaperScissorsGUI.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Halogen as H
import Halogen.HTML.Events.Indexed as HE
import Halogen.HTML.Indexed as HH
import Halogen.Util (awaitBody, runHalogenAff)

-- | The state of the component
type State =
  { wins  :: Int
  , draws :: Int
  , loses :: Int
  }

initialState :: State
initialState =
  { wins : 0
  , draws : 0
  , loses : 0
  }

-- | The query algebra for the component
data Query a
  = IncreaseWins a
  | IncreaseLoses a
  | IncreaseDraws a


ui :: forall g. H.Component State Query g
ui = H.component { render, eval }
  where

    render :: State -> H.ComponentHTML Query
    render state =
      HH.div_
        [ HH.h1_
            [ HH.text "Hello world!" ]
        , HH.p_
            [ HH.text "Why not toggle this button:" ]
        , HH.button
            [ HE.onClick (HE.input_ IncreaseWins) ]
            [ HH.text $ show state.wins ]
        ]

    eval :: Query ~> H.ComponentDSL State Query g
    eval (IncreaseWins next) = do
      H.modify (\state -> state { wins = state.wins + 1 })
      pure next
    eval (IncreaseDraws next) = do
      H.modify (\state -> state { draws = state.draws + 1 })
      pure next
    eval (IncreaseLoses next) = do
      H.modify (\state -> state { loses = state.loses + 1 })
      pure next

main :: Eff (H.HalogenEffects ()) Unit
main = runHalogenAff do
  body <- awaitBody
  H.runUI ui initialState body
