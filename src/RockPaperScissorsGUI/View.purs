module RockPaperScissorsGUI.View where

import Prelude
import Halogen.HTML.Core (HTML)
import Halogen.HTML.Indexed as H
import Halogen.HTML.Properties.Indexed as P

class_ :: String -> H.ClassName
class_ = H.className

box :: forall p i . String -> Int -> HTML p i
box label value =
  H.div
      [ P.classes [ class_ "level-item has-text-centered" ] ]
      [ H.p
          [ P.classes [ class_ "heading" ] ]
          [ H.text label ]
      , H.p
          [ P.classes [ class_ "title" ] ]
          [ H.text $ show value ]
      ]


stats :: forall s p i . { wins :: Int, draws :: Int, loses :: Int | s } -> HTML p i
stats state =
  section
    [ H.nav
        [ P.classes [ class_ "level" ] ]
        [ box "Wins" state.wins
        , box "Draws" state.draws
        , box "Loses" state.loses
        ]
    ]

notification :: forall p i. String -> HTML p i
notification text =
  section
    [ H.div
        [ P.classes [ class_ "columns" ] ]
        [ H.div
            [ P.classes [ class_ "column" ] ]
            [ H.div
              [ P.classes [ class_ "notification" ] ]
              [ H.text text ]
            ]
        ]
    ]

section elements =
  H.div
    [ P.classes [ class_ "section" ] ]
    elements
