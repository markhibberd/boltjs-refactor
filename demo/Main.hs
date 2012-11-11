module Main where

import Language.JavaScript.Bolt.Demo


main ::
  IO ()
main =
  runparse >>= print


