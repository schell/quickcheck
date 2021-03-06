module Test.QuickCheck.State where

import Test.QuickCheck.Text
import Test.QuickCheck.Random

--------------------------------------------------------------------------
-- State

-- | State represents QuickCheck's internal state while testing a property.
-- The state is made visible to callback functions.
data State
  = MkState
  -- static
  { terminal                  :: Terminal          -- ^ the current terminal
  , maxSuccessTests           :: Int               -- ^ maximum number of successful tests needed
  , maxDiscardedTests         :: Int               -- ^ maximum number of tests that can be discarded
  , computeSize               :: Int -> Int -> Int -- ^ how to compute the size of test cases from
                                                   -- #tests and #discarded tests

                                                   -- dynamic
  , numSuccessTests           :: Int               -- ^ the current number of tests that have succeeded
  , numDiscardedTests         :: Int               -- ^ the current number of discarded tests
  , numRecentlyDiscardedTests :: Int               -- ^ the number of discarded tests since the last successful test
  , collected                 :: [[(String,Int)]]  -- ^ all labels that have been collected so far
  , expectedFailure           :: Bool              -- ^ indicates if the property is expected to fail
  , randomSeed                :: QCGen             -- ^ the current random seed

                                                   -- shrinking
  , numSuccessShrinks         :: Int               -- ^ number of successful shrinking steps so far
  , numTryShrinks             :: Int               -- ^ number of failed shrinking steps since the last successful shrink
  , numTotTryShrinks          :: Int               -- ^ total number of failed shrinking steps
  }

--------------------------------------------------------------------------
-- the end.
