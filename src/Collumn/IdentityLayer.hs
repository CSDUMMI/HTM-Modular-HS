module StandardLayers
(
  identityLayer
) where
  import qualified Collumn

  identity :: Collumn.Collumn -> Collumn.LayerData -> Int -> Collumn.Collumn
  identity coll layer_data index = coll
  identityLayer = Collumn.Layer {
    Collumn.activationFunction=identity,
    Collumn.layer_data = Collumn.LayerData [[0.0]]
  }
