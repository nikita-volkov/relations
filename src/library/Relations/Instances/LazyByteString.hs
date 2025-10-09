{-# OPTIONS_GHC -Wno-orphans #-}

module Relations.Instances.LazyByteString where

import qualified Data.ByteString
import qualified Data.ByteString.Lazy
import qualified Data.Text
import qualified Data.Text.Encoding.Error
import qualified Data.Text.Lazy
import qualified Data.Text.Lazy.Encoding
import Relations.Algebra
import Prelude

instance IsUtf8EncodingOf Data.Text.Lazy.Text Data.ByteString.Lazy.ByteString where
  encodeUtf8 = Data.Text.Lazy.Encoding.encodeUtf8
  decodeUtf8 bytes =
    case Data.Text.Lazy.Encoding.decodeUtf8' bytes of
      Left (Data.Text.Encoding.Error.DecodeError desc _) ->
        Left (Utf8DecodingError Nothing Nothing (Data.Text.pack desc))
      Left _ ->
        Left (Utf8DecodingError Nothing Nothing "Unexpected decoding error")
      Right text ->
        Right text
  decodeUtf8Lenient = Data.Text.Lazy.Encoding.decodeUtf8With Data.Text.Encoding.Error.lenientDecode

instance IsLazyFormOf Data.ByteString.ByteString Data.ByteString.Lazy.ByteString where
  fromStrict = Data.ByteString.Lazy.fromStrict
  toStrict = Data.ByteString.Lazy.toStrict
