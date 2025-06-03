module Relations.Algebra.List where

class IsListOf element sequence | sequence -> element where
  unpackSequence :: sequence -> [element]
  packSequence :: [element] -> sequence
  foldrSequence :: (element -> z -> z) -> z -> sequence -> z
