module RockPaperScissors.Api where

import Prelude
import RockPaperScissors.Types (RockPaperScissors(..))
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Random (RANDOM, randomInt)


getResult :: Int -> RockPaperScissors
getResult integer =
  case integer of
    1 -> Rock
    2 -> Paper
    _ -> Scissors

shuffle :: forall e. Eff (console :: CONSOLE, random :: RANDOM | e) Unit
shuffle = do
  number <- randomInt 1 3
  log $ show $ getResult number
