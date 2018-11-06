{- |
Module      : Collumn
Description : Interface for structures and functions
              for the Cortical Collumn
Copyright   : (c) Joris Gutjahr, 2018
License     : MIT
Maintainer  : joris.gutjahr@gmail.com
Stability   : experimental
Depending   : Data.Map
-}
module Collumn
( LData (..),
  Layer (..),
  Collumn (..),
  pushLayer,
  initCollumn
) where
import qualified Data.Map as Map


data Collumn =
  Collumn {
  output_cl :: SDR,
  input_cl :: SDR,
  layers :: [Layer],
  last_active :: Num
  }
