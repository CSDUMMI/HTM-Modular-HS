-- Desired Syntax:
-- expect $ 12 `predicate` 12
-- expect $ predicate 12 12 12
module Test
  (
    Test (..),
    fromBool,
    toBool,
    expect,
    toBe,
    notToBe,
    toBeGreaterThen,
    toBeLessThen
  ) where


-- | Simple Test Result
data Test = Success | Failure

-- | Complex Test Result
-- A predicate return this.
-- you shouldn't try to access
-- this outside of this module.
data TestInfo =
  TestInfo {
    test::Test,
    test_info::String
  }

-- |Conversion of Bool to Test
fromBool :: Bool -> Test
fromBool True = Success
fromBool _ = Failure
-- |Conversion of Test to Bool
toBool :: Test -> Bool
toBool Success = True
toBool _ = False

-- |If test was succesfull then do nothing
-- if there is a Failure: return it.
expect :: TestInfo -> IO ()
expect TestInfo {
                  test=Success,
                  test_info=desc
                }
  = putStr ""
expect TestInfo {
                 test=Failure,
                 test_info=desc
                }
  = putStrLn ("Test Failed " ++ desc)


-- |A Collection of predicates to use for expect.

toBe :: (Eq a,Show a) => a -> a -> TestInfo
v1 `toBe` v2 =
  TestInfo  {
    test=fromBool $ v1==v2,
    test_info = show v1 ++ " should be equal to " ++ show v2
  }

notToBe :: (Eq a,Show a) => a -> a -> TestInfo
v1 `notToBe` v2 =
  TestInfo {
    test=fromBool $ v1 /= v2,
    test_info = show v1 ++ " should not be equal to " ++ show v2
  }

toBeGreaterThen :: (Ord a, Show a) => a -> a -> TestInfo
v1 `toBeGreaterThen` v2 =
  TestInfo {
     test=fromBool $ v1 > v2,
     test_info = show v1 ++ " should be greater then " ++ show v2
  }

toBeLessThen :: (Ord a,Show a) => a -> a -> TestInfo
v1 `toBeLessThen` v2  =
  TestInfo {
    test=fromBool $ v1 < v2,
    test_info = show v1 ++ " should be less then "  ++ show v2
  }
