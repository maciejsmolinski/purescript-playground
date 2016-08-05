module Main where

import Prelude
import Person.Api as Person
import RockPaperScissors.Api as RockPaperScissors
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Random (RANDOM)

newline :: forall e. Eff (console :: CONSOLE | e) Unit
newline = log $ "\n" <> "************************" <> "\n"

main :: forall e. Eff (console :: CONSOLE, random :: RANDOM | e) Unit
main = do
  newline
  Person.print

  newline
  RockPaperScissors.play
