module Collumn
( LayerData,
  Layer,
  Collumn,
  pushLayer
) where




data LayerData  = LayerData [[Double]] deriving (Show)

data Layer = Layer  {
 activationFunction :: (Collumn -> Int -> Collumn),
 layer_data :: LayerData
}

instance Show Layer where
  show Layer{layer_data=ld} = show ld

data Collumn = Collumn {
  layers::[Layer],
  layer_num::Int
}

pushLayer :: Collumn -> Layer -> Collumn
pushLayer (Collumn {layers = orgLayers,layer_num = ln}) new_layer =
  Collumn {
  layers = orgLayers ++ [new_layer],
  layer_num = ln
}
