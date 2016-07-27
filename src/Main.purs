module Main where

import Prelude
import Data.Maybe (Maybe(..))
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Types (Person(..))

createPerson :: String -> Int -> Person
createPerson name age =
  Person { name: name, age: age }

person1 :: Person
person1 = createPerson "John" 18

person2 :: Person
person2 = createPerson "Sam" 20

maybePerson1 :: Maybe Person
maybePerson1 = createPerson <$> Just "Joe" <*> Nothing

maybePerson2 :: Maybe Person
maybePerson2 = createPerson <$> Nothing <*> Just 27

maybePerson3 :: Maybe Person
maybePerson3 = createPerson <$> Just "Joe" <*> Just 27

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
