module Relations.Algebra.List where

class IsListOf element list | list -> element where
  unpackList :: list -> [element]
  packList :: [element] -> list
  foldrList :: (element -> z -> z) -> z -> list -> z
