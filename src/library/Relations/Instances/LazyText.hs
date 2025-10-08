{-# OPTIONS_GHC -Wno-orphans #-}

module Relations.Instances.LazyText where

import qualified Data.Text
import qualified Data.Text.Lazy
import Relations.Algebra
import Prelude

instance IsListOf Char Data.Text.Lazy.Text where
  list = Data.Text.Lazy.unpack
  foldrList = Data.Text.Lazy.foldr
  unlist = Data.Text.Lazy.pack

instance IsLazyFormOf Data.Text.Text Data.Text.Lazy.Text where
  fromStrict = Data.Text.Lazy.fromStrict
  toStrict = Data.Text.Lazy.toStrict
