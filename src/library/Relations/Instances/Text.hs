{-# OPTIONS_GHC -Wno-orphans #-}

module Relations.Instances.Text where

import Data.Text (Text)
import qualified Data.Text
import Relations.Algebra
import Prelude

instance IsListOf Char Text where
  unpackList = Data.Text.unpack
  foldrList = Data.Text.foldr
  packList = Data.Text.pack
