module App.Main (main, Query) where

import Prelude

import Data.Array (filter)
import Data.Foldable (elem)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..), snd)
import DOM.Event.KeyboardEvent (code)
import DOM.Event.Types (KeyboardEvent)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Core as HC
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP

type TodoId = Int
type TodoName = String
type Todo = Tuple TodoId TodoName

type State =
    { field :: TodoName
    , list :: Array Todo
    , id :: TodoId
    }

type Component = H.ComponentHTML Query

data Query a = UpdateField String a
             | Remove Int a
             | Add a
             | KeyUp KeyboardEvent a
             | Clear a

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
        { field: ""
        , list: []
        , id: 0
        }

      render :: State -> Component
      render state =
        HH.div
          []
          ([ HH.br_ , addTodoSection state.field ] <> (todosSection state.list) <> [ HH.br_ , clearTodosSection ])

      addTodoSection :: TodoName -> Component
      addTodoSection fieldValue =
        HH.div
          [ HP.class_ $ HC.ClassName "row" ]
          [ HH.div
              [ HP.classes $ map HC.ClassName ["ten", "columns"] ]
              [ todoField fieldValue ]
          , HH.div
              [ HP.classes $ map HC.ClassName ["two", "columns"] ]
              [ addButton "Add" ]
          ]

      todosSection :: Array Todo -> Array Component
      todosSection = map todoItem

      clearTodosSection :: Component
      clearTodosSection =
        HH.div
          [ HP.class_ $ HC.ClassName "row" ]
          [ clearButton ]

      todoField :: TodoName -> Component
      todoField fieldValue =
        HH.input
          [ HE.onValueInput $ HE.input UpdateField
          , HE.onKeyUp $ HE.input KeyUp
          , HP.class_ $ HC.ClassName "u-full-width"
          , HP.type_ HP.InputText
          , HP.value fieldValue
          ]

      addButton :: String -> Component
      addButton label =
        HH.button
          [ HE.onClick $ HE.input_ Add ]
          [ HH.text label ]

      removeButton :: TodoId -> Component
      removeButton id =
        HH.span
          [ HP.classes $ map HC.ClassName ["helpers", "is-actionable", "is-mini"]
          ,  HE.onClick $ HE.input_ $ Remove id ]
          [ HH.text "╳" ]

      clearButton :: Component
      clearButton =
        HH.button
          [ HE.onClick $ HE.input_ Clear ]
          [ HH.text "Clear" ]


      todoItem :: Todo -> Component
      todoItem (Tuple todoId todoName) =
          HH.div
            [ HP.class_ $ HC.ClassName "row" ]
            [ HH.div
              [ HP.classes $ map HC.ClassName ["ten", "columns" ]]
              [ HH.text $ todoName ]
            , HH.div
              [ HP.classes $ map HC.ClassName ["two", "columns", "helpers", "is-right-aligned" ]]
              [ removeButton todoId ]
            ]

      eval :: Query ~> H.ComponentDSL State Query Void m
      eval query = case query of
        UpdateField text next -> do
          H.modify \state -> state { field = text }
          pure next
        Add next -> do
          H.modify \state ->
            case state.field of
              "" -> state
              _ -> case (elem state.field (map snd state.list)) of
                true -> state
                false -> do
                  state { list = state.list <> [(Tuple (state.id + 1) state.field)]
                        , id = state.id + 1
                        , field = ""
                        }
          pure next
        KeyUp event next -> do
          case code event of
            "Enter" -> do
              eval $ Add next
            _ -> pure next
        Remove id next -> do
          H.modify \state -> state { list = filter (\(Tuple todoId todoName) -> todoId /= id) state.list }
          pure next
        Clear next -> do
          H.modify \state -> state { list = [] }
          pure next
