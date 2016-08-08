module Main where

import Prelude
import RockPaperScissorsGUI.Main as RPSG
import Control.Monad.Eff (Eff)
import Halogen as H

main :: Eff (H.HalogenEffects ()) Unit
main = RPSG.main
