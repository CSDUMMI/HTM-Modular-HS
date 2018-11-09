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
  
sdr_test = do
  
  expect $ empty_sdr `pred_compare_sdrs` SDR {len=0,sdr_active_indicies=[]}
  --Test duplicate function
  let list_with_dups = [1,2,3,1,2,3]
  let list_without_dups = [1,2,3]
  expect $ (remove_duplicates list_with_dups)
    `toBe`
    list_without_dups

    
  -- Test s_union
  let sdr_1 = SDR {
        sdr_active_indicies=[12,20],
        len=128
        }
  let sdr_to_fail = SDR {
        sdr_active_indicies=[12,20],
        len=21
       }
  let sdr_2 = SDR {
        sdr_active_indicies=[13,21,12],
        len=128
       }
        
  let union_fail = s_union sdr_1 sdr_to_fail
  expect $ union_fail `toBe` empty_sdr
  expect $ (s_union sdr_1 sdr_2) `pred_compare_sdrs` SDR { len=128,sdr_active_indicies=[12,20,13,21] }
