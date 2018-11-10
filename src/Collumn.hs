{-
    A Modular HTM Implementation using Haskell (HTM-Modular-HS)
    Copyright (C) 2018 Joris Gutjahr

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
-}
{- |
Module      : Collumn
Description : Interface for structures and functions
              for the Cortical Collumn
Copyright   : (c) Joris Gutjahr, 2018
License     : GPLv3
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
