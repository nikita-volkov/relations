{-# OPTIONS_GHC -Wno-orphans #-}

module Relations.Instances.Set where

import qualified Data.Set
import Relations.Algebra
import Prelude

instance (Ord element) => IsListOf element (Data.Set.Set element) where
  list = Data.Set.toList
  unlist = Data.Set.fromList
  foldrList f z = Data.Set.foldr f z

instance (Ord element) => IsSetOf element (Data.Set.Set element) where
  contains = Data.Set.member
  include = Data.Set.insert
  exclude = Data.Set.delete
