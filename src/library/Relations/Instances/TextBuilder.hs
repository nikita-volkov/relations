{-# OPTIONS_GHC -Wno-orphans #-}

module Relations.Instances.TextBuilder where

import qualified Data.Text
import Relations.Algebra
import Relations.Instances.Text ()
import TextBuilder (TextBuilder)
import qualified TextBuilder
import Prelude

instance IsListOf Char TextBuilder where
  list = Data.Text.unpack . TextBuilder.toText
  foldrList f z = Data.Text.foldr f z . TextBuilder.toText
  unlist = foldMap TextBuilder.char
