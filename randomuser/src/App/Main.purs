module App.Main (main, Query) where

import Prelude

import Data.Argonaut (Json)
import Data.Maybe (Maybe(..))
import Data.Either (Either(..))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Core as HC
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Control.Monad.Aff (Aff)
import Network.HTTP.Affjax as AX


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

main :: forall eff. H.Component HH.HTML Query Unit Void (Aff (ajax :: AX.AJAX | eff))
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
        HH.div_
          [ wrapper, actions ]
        where
          actions :: Component
          actions =
            HH.div
              [ HP.classes $ map HC.ClassName ["helpers", "with-top-gap", "small", "centered-text"] ]
              [ HH.button
                [ HE.onClick $ HE.input_ $ Load ]
                [ HH.text "Load" ]
              ]


          wrapper :: Component
          wrapper =
            HH.div
              [ HP.classes $ map HC.ClassName ["ui", "card", "helpers", "centered-horizontally", "with-double-top-gap"] ]
              [ image, content, extra ]

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

      eval :: Query ~> H.ComponentDSL State Query Void (Aff (ajax :: AX.AJAX | eff))
      eval query = case query of
        Load next -> do
          (response :: AX.AffjaxResponse Json) <- H.liftAff $ AX.get "https://randomuser.me/api/"
          case extractData response.response of
            Left _ -> pure next
            Right state -> eval $ UpdateFields state next

        UpdateFields state next -> do
          H.put state
          pure next

      extractData :: Json -> Either String State
      extractData json = do
        pure $ initialState { picture = "https://placehold.it/300x300?text=loaded" }

