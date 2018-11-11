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
{-|
Module : SDR
Description : A SDR Data Structure and associated Operations
Copyrigth : (c) Joris Gutjahr, 2018
License : GPLv3
Maintainer : joris.gutjahr@gmail.com
Stability : experimental
-}

module SDR
  (
    SDR(..),
    remove_duplicates,
    s_union,
    s_overlap,
    empty_sdr,
    s_concate
  ) where

data SDR =
  SDR {
  sdr_active_indicies :: [Int],
  len :: Int
  } deriving (Show,Eq)

empty_sdr = SDR { len=0,sdr_active_indicies=[]}


-- | Important Helper Function
remove_duplicates ::(Eq a) =>  [a] -> [a]
remove_duplicates x =
  foldr (\x xs -> if x `elem` xs then xs else x:xs) [] x

-- | Union Property
s_union :: SDR -> SDR -> SDR
s_union s_1 s_2
  | len s_1 == len s_2 =
    SDR {
      sdr_active_indicies =
          remove_duplicates $ (sdr_active_indicies s_1) ++ (sdr_active_indicies s_2),
      len = len s_1
      }
  | otherwise = empty_sdr

-- | Get the Overlap.
-- if you want the overlap count, just take the length of the active_indicies
s_overlap s_1 s_2
  | len s_1 == len s_2 =
    SDR {
      len=len s_1,
      sdr_active_indicies =
          remove_duplicates [x | x <- sdr_active_indicies s_1, x `elem` sdr_active_indicies s_2]
    }
  | otherwise = empty_sdr
                             
-- | Concatenate two sdrs, just append the second to the first
s_concate :: SDR -> SDR -> SDR
s_concate s_1 s_2 =
  SDR {
  len=(len s_1) + (len s_2),
  sdr_active_indicies = (sdr_active_indicies s_1) ++ [x + (len s_1)| x <- (sdr_active_indicies s_2)]
  }
