module Language.JavaScript.Bolt.Demo where

import Language.ECMAScript3
import Language.JavaScript.Bolt

runparse :: IO Bool
runparse = fmap isBolt' $  parsex "data/Example.js"
