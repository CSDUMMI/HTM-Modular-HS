{-
    A simple Haskell Testing Framework (TestHaskell)
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
-- Desired Syntax:
-- expect $ 12 `predicate` 12
-- expect $ predicate 12 12 12
module Test
  (
    Test (..),
    TestInfo(..),
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
