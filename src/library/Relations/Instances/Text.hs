{-# OPTIONS_GHC -Wno-orphans #-}

module Relations.Instances.Text where

import Data.Text (Text)
import qualified Data.Text
import Relations.Algebra
import Prelude

instance IsListOf Char Text where
  unpackSequence = Data.Text.unpack
  foldrSequence = Data.Text.foldr
  packSequence = Data.Text.pack
