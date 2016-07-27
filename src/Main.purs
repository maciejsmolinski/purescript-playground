module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Ordering (Ordering(..))


newtype Person = Person
  { name :: String
  , age :: Int
  }

instance showPerson :: Show Person where
  show (Person { name, age }) = "Person (" <> details <> ")"
    where
      details :: String
      details = "name=" <> name <> ", age=" <> show age

instance eqPerson :: Eq Person where
  eq (Person person1) (Person person2) = sameNames && sameAge
    where
      sameNames :: Boolean
      sameNames = person1.name == person2.name
      sameAge :: Boolean
      sameAge = person1.age == person2.age

instance ordPerson :: Ord Person where
  compare (Person person1) (Person person2)
    | person1.age > person2.age = GT
    | person1.age < person2.age = LT
    | otherwise = EQ

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
