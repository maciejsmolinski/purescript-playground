module Data where

import Prelude
import Data.Maybe (Maybe(..))
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
