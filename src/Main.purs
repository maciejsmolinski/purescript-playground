module Main where

import Prelude
import Data (person1, person2, maybePerson1, maybePerson2, maybePerson3)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)


main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log ""
  log "-- Person Data --"
  log ""
  log $ (<>) "1. " $ show person1
  log $ (<>) "2. " $ show person2
  log $ (<>) "3. " $ show maybePerson1
  log $ (<>) "4. " $ show maybePerson2
  log $ (<>) "5. " $ show maybePerson3

  log ""
  log ""
  log "-- Person Eq (1 vs 2) --"
  log ""
  log $ (<>) "== " $ show (person1 == person2)
  log $ (<>) "eq " $ show $ eq person1 person2

  log ""
  log ""
  log "-- Person Ord (1 vs 2) --"
  log ""
  log $ show $ compare person1 person2
  log $ (<>) "<  " $ show $ person1 < person2
  log $ (<>) "== " $  show $ person1 == person2
  log $ (<>) ">  " $  show $ person1 > person2
