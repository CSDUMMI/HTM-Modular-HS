{- |
Module      : Collumn
Description : Interface for structures and functions
              for the Cortical Collumn
Copyright   : (c) Joris Gutjahr, 2018
License     : MIT
Maintainer  : joris.gutjahr@gmail.com
Stability   : experimental

-}
module Collumn
( LayerData,
  Layer,
  Collumn,
  pushLayer
) where



-- |Simple Datatype for storing things like connections  with other Layer
data LayerData  = LayerData [[Double]] deriving (Show)

-- |Layer Data stores a activationFunction that gets applied
-- each time we want the output of a Layer on a current Collumn.
-- As this activationFunction you can for example implement a SP.
data Layer = Layer  {
 activationFunction :: (Collumn -> LayerData  -> Int -> Collumn),
 layer_data :: LayerData
}

-- |For getting the Layer to print out something on debugging
-- I ignore the activationFunction because that would only
-- give me "function" as output
instance Show Layer where
  show Layer{layer_data=ld} = show ld

-- | Data for many Layers where the
-- activationFunctions are called in order of
-- the layers list, layer_num indicates the
-- currently executing layers index
data Collumn = Collumn {
  layers::[Layer],
  layer_num::Int
}
-- | Add a Layer to the Collumn
-- Arguments:
--    The Collumn
--    to wish  there should
--    be added something
--    The Layer that shall be added
pushLayer :: Collumn -> Layer -> Collumn
pushLayer (Collumn {layers = orgLayers,layer_num = ln}) new_layer =
  Collumn {
  layers = orgLayers ++ [new_layer],
  layer_num = ln
  }
