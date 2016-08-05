module RockPaperScissors.Api where

import Prelude
import RockPaperScissors.Types (RockPaperScissors(..))
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Random (RANDOM, randomInt)


pickOption :: Int -> RockPaperScissors
pickOption integer =
  case integer of
    1 -> Rock
    2 -> Paper
    _ -> Scissors

getHumanResult :: RockPaperScissors -> RockPaperScissors -> String
getHumanResult pick1 pick2 =
  case compare pick1 pick2 of
    LT -> show pick1 <> " loses with " <> show pick2
    EQ -> show pick1 <> " draws with " <> show pick2
    GT -> show pick1 <> " wins with "  <> show pick2

play :: forall e. Eff (console :: CONSOLE, random :: RANDOM | e) Unit
play = do
  number1 <- randomInt 1 3
  number2 <- randomInt 1 3

  let firstPick = pickOption number1
  let secondPick = pickOption number2

  log $ show $ getHumanResult firstPick secondPick
