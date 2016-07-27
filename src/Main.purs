module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Types (Person(..))


person1 :: Person
person1 = Person { name: "John", age: 18 }

person2 :: Person
person2 = Person { name: "Sam", age: 20 }

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log ""
  log "-- Person Data --"
  log ""
  log $ show person1
  log $ show person2

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
