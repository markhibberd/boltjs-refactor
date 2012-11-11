module Language.JavaScript.Bolt.Tests
  (
    main
  , test
  ) where

import Test.Framework
import Test.Framework.Providers.QuickCheck2 (testProperty)
import Language.JavaScript.Bolt

main ::
  IO ()
main =
  defaultMain [test]

test ::
  Test
test =
    testGroup "Language.JavaScript.Bolt"
      [
        testProperty "Identity" prop_identity
      ]

prop_identity ::
  Int
  -> Bool
prop_identity n =
  bletch n == n

