{-# OPTIONS_GHC -Wno-orphans #-}

module Relations.Instances.String where

import qualified Data.Time as Time
import qualified Data.Time.Format.ISO8601 as Time
import Relations.Algebra
import Prelude

instance IsListOf Char String where
  list = id
  unlist = id

instance IsIso8601EncodingOf Time.UTCTime String where
  decodeIso8601 = Time.formatParseM Time.iso8601Format
  encodeIso8601 = Time.formatShow Time.iso8601Format
