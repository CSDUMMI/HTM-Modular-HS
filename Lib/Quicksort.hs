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

module Lib.Quicksort
(
  quicksort,
  quicksortF
) where

quicksort :: Ord a => [a] -> [a]
quicksort xs = quicksortF (\x -> x) xs

-- | Sort the list by the output of a function
quicksortF :: Ord a => (b -> a) -> [b] -> [b]
quicksortF f (x:xs) =
    let lesser = filter (\l -> (f l) < (f x)) xs
        greater = filter (\g -> (f g) > (f g)) xs
    in  ( quicksortF f lesser ) ++ [x] ++ ( quicksortF f greater )
