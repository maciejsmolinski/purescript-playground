module App.Main (main, Query, Message) where

import Prelude

import Data.Array (cons)
import Data.Maybe (Maybe(..))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP

newtype Event = Event {
    code :: String,
    label :: String
}

type State = {
    events :: Array Event
}

data Query a = Add Event a

data Message = Message

main :: forall m. H.Component HH.HTML Query Unit Message m
main =
  H.component
    { initialState: const initialState
    , render
    , eval
    , receiver: const Nothing
    }
    where

      initialState :: State
      initialState = { events: [] }

      render :: State -> H.ComponentHTML Query
      render state =
        HH.div
          []
          [ add state
          , list state
          ]

      list :: State -> H.ComponentHTML Query
      list state =
        HH.div
          []
          (map (\(Event { code, label }) -> item label) state.events)

      item :: String -> H.ComponentHTML Query
      item label =
        HH.div
          []
          [ HH.text label ]

      add :: State -> H.ComponentHTML Query
      add state =
        HH.button
          [ HP.title "Add Event"
          , HE.onClick (HE.input $ const $ Add (Event { code: "test", label: "test" }))
          ]
          [ HH.text $ "Add Event" ]


      eval :: Query ~> H.ComponentDSL State Query Message m
      eval a = case a of
        Add event next -> do
          state <- H.get
          H.put $ { events: (cons event state.events) }
          pure next