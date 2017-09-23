module Main where

import Prelude

import App.Main as AM
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (error)
import Control.Monad.Error.Class (throwError)
import DOM.Node.ParentNode (QuerySelector(..))
import Data.Maybe (Maybe(..))
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)
import Network.HTTP.Affjax as AX

main :: Eff (HA.HalogenEffects (ajax :: AX.AJAX)) Unit
main = HA.runHalogenAff do
  HA.awaitLoad
  element <- HA.selectElement $ QuerySelector "[data-module='Main']"
  case element of
    Nothing -> throwError (error "Could not find [data-module='Main']")
    Just node -> runUI AM.main unit node
