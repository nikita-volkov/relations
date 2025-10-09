{-# OPTIONS_GHC -Wno-orphans #-}

module Relations.Instances.LazyTextBuilder where

import qualified Data.Text.Lazy
import Data.Text.Lazy.Builder
import Relations.Algebra
import Prelude

instance IsListOf Char Builder where
  list = Data.Text.Lazy.unpack . toLazyText
  unlist = fromString

instance IsBuilderOf Data.Text.Lazy.Text Builder where
  build = toLazyText
  unbuild = fromLazyText
