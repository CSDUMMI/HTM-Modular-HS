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
module SDR_test
  (
    sdr_test
  ) where
import Test
import SDR

pred_compare_sdrs :: SDR -> SDR -> TestInfo
pred_compare_sdrs s1 s2 =
  TestInfo {
  test = fromBool $ length [x |x <- sdr_active_indicies s1,x `elem` sdr_active_indicies s2]
  == length (sdr_active_indicies s1) &&  len s1 == len s2,
  test_info = show s1 ++ " isn't equal to " ++ show s2
  }

test_remove_duplicates =
  let
    list_with_dups = [1,2,3,1,2,3];
    list_without_dups = [1,2,3];
  in expect $ (remove_duplicates list_with_dups)
     `toBe` list_without_dups
    

test_s_union =
  let sdr_1 = SDR {len=128,sdr_active_indicies=[12,20,13] }
      sdr_2 = SDR {len=128,sdr_active_indicies=[21,31,13] }
      sdr_union_1_2 = SDR {len=128,sdr_active_indicies=[12,20,13,21,31] }
  in expect $ (s_union sdr_1 sdr_2) `pred_compare_sdrs` sdr_union_1_2

test_s_overlap =
  let s_1 = SDR {len=128,sdr_active_indicies=[21,23,24,100]}
      s_2 = SDR {len=128,sdr_active_indicies=[21,23,24]}
      s_overlap_1_2 = SDR {len=128,sdr_active_indicies=[21,23,24]}
  in expect $ (s_overlap s_1 s_2) `pred_compare_sdrs` s_overlap_1_2
sdr_test = do 
  test_s_overlap
  test_s_union
