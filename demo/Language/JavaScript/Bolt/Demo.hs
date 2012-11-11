module Language.JavaScript.Bolt.Demo where

import Language.JavaScript.Bolt

runparse :: IO Deps
runparse = fmap dependencies' $ parsex "data/Example.js"
