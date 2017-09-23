module App.Main (main, Query) where

import Prelude

import Data.Maybe (Maybe(..))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.HTML.Core as HC

type State =
  { email :: String
  , picture :: String
  , username :: String
  , city :: String
  , joined :: String
  }

type Component = H.ComponentHTML Query

data Query a = Load a
             | UpdateFields State a

main :: forall m. H.Component HH.HTML Query Unit Void m
main =
  H.component
    { initialState: const initialState
    , render
    , eval
    , receiver: const Nothing
    }
    where

      initialState :: State
      initialState =
        { email: "..."
        , picture: "https://placehold.it/300x300?text=loading+picture"
        , username: "..."
        , city: "..."
        , joined: "..."
        }

      render :: State -> Component
      render state =
        HH.div
          [ HP.classes $ map HC.ClassName ["ui", "card", "helpers", "centered-horizontally", "with-double-top-gap"] ]
          [ image, content, extra ]
        where
          image :: Component
          image =
            HH.div
              [ HP.class_ $ HC.ClassName "image" ]
              [ HH.img
                  [ HP.src state.picture ]
              ]

          content :: Component
          content =
            HH.div
              [ HP.class_ $ HC.ClassName "content" ]
              [ HH.div
                  [ HP.class_ $ HC.ClassName "header" ]
                  [ HH.text state.username ]
              , HH.br_
              , HH.div
                  [ HP.class_ $ HC.ClassName "meta" ]
                  [ HH.span
                      [ HP.class_ $ HC.ClassName "date" ]
                      [ HH.text $ "Joined in " <> state.joined ]
                  , HH.div
                      [ HP.classes $ map HC.ClassName [ "description", "helpers", "capitalized" ] ]
                      [ HH.text $ "Based in: " <> state.city ]
                  ]
              ]

          extra :: Component
          extra =
            HH.div
              [ HP.classes $ map HC.ClassName [ "extra", "content" ] ]
              [ HH.div_
                  [ HH.i
                      [ HP.classes $ map HC.ClassName [ "mail", "outline", "icon" ] ]
                      []
                  , HH.text state.email
                  ]
              ]

      eval :: Query ~> H.ComponentDSL State Query Void m
      eval query = case query of
        Load next -> pure next
        UpdateFields _ next -> pure next