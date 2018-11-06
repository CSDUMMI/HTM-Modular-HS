{- |
Module : SDR
Description : A SDR Data Structure and associated Operations
Copyrigth : (c) Joris Gutjahr, 2018
License : MIT
Maintainer : joris.gutjahr@gmail.com
Stability : experimental
-}

module SDR
  (
    SDR(..),
    remove_duplicates,
    s_union
  ) where

data SDR =
  SDR {
  sdr_active_indicies :: [Int],
  len :: Int
  } deriving (Show,Eq)

remove_duplicates ::(Eq a) =>  [a] -> [a]
adIfnotIn x xs 
  | x `elem` xs = xs
  | otherwise = x:xs
remove_duplicates x =
  foldr adIfnotIn [] x

s_union :: SDR -> SDR -> SDR
s_union s_1 s_2
  | len s_1 == len s_2 =
    SDR {
      sdr_active_indicies =
          remove_duplicates $ (sdr_active_indicies s_1) ++ (sdr_active_indicies s_2),
      len = len s_1
      }
  | otherwise = s_1

