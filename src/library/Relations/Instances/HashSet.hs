{-# OPTIONS_GHC -Wno-orphans #-}

module Relations.Instances.HashSet where

import qualified Data.HashSet
import Data.Hashable (Hashable)
import Relations.Algebra

instance (Hashable element) => IsListOf element (Data.HashSet.HashSet element) where
  list = Data.HashSet.toList
  unlist = Data.HashSet.fromList

instance (Hashable element) => IsSetOf element (Data.HashSet.HashSet element) where
  contains = Data.HashSet.member
  include = Data.HashSet.insert
  exclude = Data.HashSet.delete
