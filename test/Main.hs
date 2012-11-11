module Main where

import qualified Language.JavaScript.Bolt.Tests
import Test.Framework

main ::
  IO ()
main = 
  defaultMain tests 

tests ::
  [Test]
tests =
  [
    testGroup "Tests"
      [
        Language.JavaScript.Bolt.Tests.test
      ]
  ]

