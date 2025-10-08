module Relations.Algebra.Set
  ( IsSetOf (..),
    underUnion,
    SetUnderUnion,
    fromUnderUnion,
  )
where

import Data.Semigroup
import Prelude

class IsSetOf element set | set -> element where
  contains :: element -> set -> Bool
  include :: element -> set -> set
  exclude :: element -> set -> set
  nil :: set
  unite :: set -> set -> set
  intersect :: set -> set -> set

fromUnderUnion :: SetUnderUnion set element -> set
fromUnderUnion (SetUnderUnion s) = s

newtype SetUnderUnion set element = SetUnderUnion set

instance (IsSetOf element set) => Semigroup (SetUnderUnion set element) where
  SetUnderUnion x <> SetUnderUnion y = SetUnderUnion (unite x y)

instance (IsSetOf element set) => Monoid (SetUnderUnion set element) where
  mempty = SetUnderUnion nil

underUnion :: (IsSetOf element set) => set -> SetUnderUnion set element
underUnion = SetUnderUnion
