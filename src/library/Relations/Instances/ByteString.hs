{-# OPTIONS_GHC -Wno-orphans #-}

module Relations.Instances.ByteString where

import qualified Data.ByteString
import qualified Data.ByteString.Lazy
import qualified Data.Text
import qualified Data.Text.Encoding
import qualified Data.Text.Encoding.Error
import qualified Data.Text.Lazy
import qualified Data.Text.Lazy.Encoding
import Relations.Algebra
import Relations.Instances.Text ()
import Prelude

instance IsUtf8EncodingOf Data.Text.Text Data.ByteString.ByteString where
  encodeUtf8 = Data.Text.Encoding.encodeUtf8
  decodeUtf8 bytes =
    case Data.Text.Encoding.decodeUtf8' bytes of
      Left (Data.Text.Encoding.Error.DecodeError desc _) ->
        Left (Utf8DecodingError Nothing Nothing (Data.Text.pack desc))
      Left _ ->
        Left (Utf8DecodingError Nothing Nothing "Unexpected decoding error")
      Right text ->
        Right text

instance IsUtf8EncodingOf Data.Text.Lazy.Text Data.ByteString.ByteString where
  encodeUtf8 = Data.ByteString.Lazy.toStrict . Data.Text.Lazy.Encoding.encodeUtf8
  decodeUtf8 bytes =
    let lazyBytes = Data.ByteString.Lazy.fromStrict bytes
     in case Data.Text.Lazy.Encoding.decodeUtf8' lazyBytes of
          Left (Data.Text.Encoding.Error.DecodeError desc _) ->
            Left (Utf8DecodingError Nothing Nothing (Data.Text.pack desc))
          Left _ ->
            Left (Utf8DecodingError Nothing Nothing "Unexpected decoding error")
          Right text ->
            Right text
