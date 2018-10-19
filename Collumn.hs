data LayerData = LayerData [[Double]]
data Layer = Layer  {
 activationFunction :: (Collumn -> Int -> Collumn),
 layer_data :: LayerData
}
data Collumn = Collumn {
  layers::[Layer],
  layer_num::Int
}
