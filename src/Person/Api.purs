module Person.Api where

import Prelude
import Person.Data (person1, person2, maybePerson1, maybePerson2, maybePerson3)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

print :: forall e. Eff (console :: CONSOLE | e) Unit
print = do
  log $ (<>) "1. " $ show person1
  log $ (<>) "2. " $ show person2
  log $ (<>) "3. " $ show maybePerson1
  log $ (<>) "4. " $ show maybePerson2
  log $ (<>) "5. " $ show maybePerson3

  log ""

  log $ (<>) "person1 == person2         " $ show (person1 == person2)
  log $ (<>) "eq person1 person2         " $ show $ eq person1 person2

  log ""

  log $ (<>) "compare person1 person2    " $ show $ compare person1 person2
  log $ (<>) "person1  < person2         " $ show $ person1 < person2
  log $ (<>) "person1 == person2         " $ show $ person1 == person2
  log $ (<>) "person1  > person2         " $ show $ person1 > person2
