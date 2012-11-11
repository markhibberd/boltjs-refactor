module Language.JavaScript.Bolt.Core where

import Language.ECMAScript3

type XStatement = Statement SourcePos
type XExpression = Expression SourcePos
type XId = Id SourcePos

type DepDecl = (String, XExpression)
type DepArg = (String, XId)
type Dep = (DepDecl, DepArg)
type Deps = [Dep]


-- FIX pull out "BoltModule type, then write AST -> Maybe BoltModule"

parsex :: String -> IO [XStatement]
parsex = parseJavaScriptFromFile

dependencies' :: [XStatement] -> Deps
dependencies' (x:[]) = dependencies x
dependencies' _ = []

dependencies :: XStatement -> Deps
dependencies (ExprStmt _ (CallExpr _ (VarRef _ (Id _ "define")) args)) =
  case args of
    [StringLit _ _, ArrayLit _ decls, FuncExpr _ _ declargs _] ->
      fmap (\(d, a) ->
             case (d, a) of
               (StringLit _ dd, Id _ aa) -> ((dd, d), (aa, a))
               _ -> error "filter out dodge bolt modules... "
           ) $ zip decls declargs
    _ -> []
dependencies _ = []

isBolt' :: [XStatement] -> Bool
isBolt' (x:[]) = isBolt x
isBolt' _ = False

isBolt :: XStatement -> Bool
isBolt (ExprStmt _ (CallExpr _ (VarRef _ (Id _ "define")) args)) =
  case args of
    [StringLit _ _, ArrayLit _ _, FuncExpr _ _ _ _] -> True
    _ -> False
isBolt _ = False


