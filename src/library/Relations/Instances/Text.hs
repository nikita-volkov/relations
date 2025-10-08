{-# OPTIONS_GHC -Wno-orphans #-}

module Relations.Instances.Text where

import Data.Text (Text)
import qualified Data.Text
import qualified Data.Time as Time
import qualified Data.Time.Format.ISO8601 as Time
import Relations.Algebra
import Prelude

instance IsListOf Char Text where
  list = Data.Text.unpack
  foldrList = Data.Text.foldr
  unlist = Data.Text.pack

instance IsIso8601EncodingOf Time.UTCTime Text where
  decodeIso8601 = Time.formatParseM Time.iso8601Format . list
  encodeIso8601 = unlist . Time.formatShow Time.iso8601Format
