module Main where

import Prelude
import Person.Api (print)
import RockPaperScissors.Api (shuffle)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Random (RANDOM)

main :: forall e. Eff (console :: CONSOLE, random :: RANDOM | e) Unit
main = do
  print
  shuffle
