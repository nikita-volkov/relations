{-# OPTIONS_GHC -Wno-orphans #-}

module Relations.Instances.LazyText where

import qualified Data.Text
import qualified Data.Text.Lazy
import Relations.Algebra
import Prelude

instance IsListOf Char Data.Text.Lazy.Text where
  unpackSequence = Data.Text.Lazy.unpack
  foldrSequence = Data.Text.Lazy.foldr
  packSequence = Data.Text.Lazy.pack

instance IsLazyFormOf Data.Text.Text Data.Text.Lazy.Text where
  fromStrict = Data.Text.Lazy.fromStrict
  toStrict = Data.Text.Lazy.toStrict
