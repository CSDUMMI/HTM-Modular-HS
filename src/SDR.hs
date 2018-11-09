{-|
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
    s_union,
    s_overlap,
    empty_sdr
  ) where

data SDR =
  SDR {
  sdr_active_indicies :: [Int],
  len :: Int
  } deriving (Show,Eq)

empty_sdr = SDR { len=0,sdr_active_indicies=[]}

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
  | otherwise = empty_sdr

s_overlap s_1 s_2
  | len s_1 == len s_2 =
    SDR {
    }
  | otherwise = empty_sdr
                             
