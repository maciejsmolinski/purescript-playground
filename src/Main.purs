module Main where

import Prelude
import Data (printPpl)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)


main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  printPpl
