module RockPaperScissors.Types where

import Prelude

data RockPaperScissors
  = Rock
  | Paper
  | Scissors

instance showRockPaperScissors :: Show RockPaperScissors where
  show Rock     = "Rock"
  show Paper    = "Paper"
  show Scissors = "Scissors"

instance eqRockPaperScissors :: Eq RockPaperScissors where
  eq Rock Rock         = true
  eq Paper Paper       = true
  eq Scissors Scissors = true
  eq _ _               = false

instance ordRockPaperScissors :: Ord RockPaperScissors where
  compare Rock Rock         = EQ
  compare Paper Paper       = EQ
  compare Scissors Scissors = EQ

  compare Rock Scissors     = GT
  compare Paper Rock        = GT
  compare Scissors Paper    = GT

  compare Rock Paper        = LT
  compare Paper Scissors    = LT
  compare Scissors Rock     = LT
