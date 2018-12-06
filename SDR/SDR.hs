{-

    HTM-Modular-HS - A implementation of the HTM in Haskell 
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

module SDR.SDR
(
  SDR (..) ,
  concate  ,
  union    ,
  overlap  ,
  empty
) where
import Lib.Remove_Duplicates (remove_duplicates)

data SDR =
    SDR {
        active :: [Int]  ,
        size :: Int
        } deriving (Show)
instance Eq SDR where
    sdr1 == sdr2 = size sdr1 == size sdr2 && active sdr1 == active sdr2


-- | An SDR used for marking an Error
empty = SDR { active=[] , size=0 }

-- | Concatenate two SDRs
concate :: SDR -> SDR -> SDR
concate sdr1 sdr2 =
    SDR {
        size   = size sdr1 + size sdr2                                  ,
        active = (++) (active sdr1) (map (\x -> x+size sdr1) (active sdr2))
        }

-- | Union of two SDRs
-- Attention: if the size of both SDRs aren't equal the function will return empty
union :: SDR -> SDR -> SDR
union sdr1 sdr2
    | size sdr1 == size sdr2 = 
        SDR {
            active = remove_duplicates $ (active sdr1) ++ (active sdr2)  ,
            size = size sdr1
            }
    | otherwise = empty

-- | Overlap of two SDRs
-- overlapscore = size $ overlap sdr1 sdr2 
-- Attention if the size of sdr1 and sdr2 aren't equal
-- Overlap will return the empty SDR.
overlap :: SDR -> SDR -> SDR
overlap sdr1 sdr2
    | size sdr1 == size sdr2 =
        SDR {
            active = filter (\x -> x `elem` (active sdr1)) (active sdr2)  ,
            size = size sdr1
            }
    | otherwise = empty
