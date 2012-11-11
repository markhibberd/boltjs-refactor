module Language.JavaScript.Bolt.Core where

import Language.ECMAScript3

type XStatement = Statement SourcePos

parsex :: String -> IO [XStatement]
parsex = parseJavaScriptFromFile

isBolt' :: [XStatement] -> Bool
isBolt' (x:[]) = isBolt x
isBolt' _ = False

isBolt :: XStatement -> Bool
isBolt (ExprStmt _ (CallExpr _ (VarRef _ (Id _ "define")) args)) =
  case args of
    [StringLit _ _, ArrayLit _ _, FuncExpr _ _ _ _] -> True
    _ -> False
isBolt _ = False
