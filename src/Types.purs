module Types where

import Prelude
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
