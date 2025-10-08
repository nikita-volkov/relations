module Relations.Algebra.List where

class IsListOf element list | list -> element where
  list :: list -> [element]
  unlist :: [element] -> list
  foldrList :: (element -> z -> z) -> z -> list -> z
