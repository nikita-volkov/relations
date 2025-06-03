{-# OPTIONS_GHC -Wno-orphans #-}

module Relations.Instances.TextBuilder where

import qualified Data.Text
import Relations.Algebra
import Relations.Instances.Text ()
import TextBuilder (TextBuilder)
import qualified TextBuilder
import Prelude

instance IsListOf Char TextBuilder where
  unpackSequence = Data.Text.unpack . TextBuilder.toText
  foldrSequence f z = Data.Text.foldr f z . TextBuilder.toText
  packSequence = foldMap TextBuilder.char
