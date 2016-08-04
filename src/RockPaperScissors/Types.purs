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
