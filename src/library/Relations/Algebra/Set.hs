module Relations.Algebra.Set
  ( IsSetOf (..),
  )
where

import Relations.Algebra.List
import Prelude

class (IsListOf element set) => IsSetOf element set | set -> element where
  contains :: element -> set -> Bool
  include :: element -> set -> set
  exclude :: element -> set -> set
