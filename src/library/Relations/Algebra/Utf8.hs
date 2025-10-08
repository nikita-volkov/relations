module Relations.Algebra.Utf8 where

import Data.Text (Text)
import Data.Word
import Prelude

class IsUtf8EncodingOf decoding encoding where
  decodeUtf8 :: encoding -> Either Utf8DecodingError decoding
  encodeUtf8 :: decoding -> encoding

data Utf8DecodingError
  = Utf8DecodingError
      -- | Offset in the input if the relation supports it.
      (Maybe Int)
      -- | Input bytes of the invalid sequence depending on its length.
      (Maybe (Word8, Maybe (Word8, Maybe (Word8, Maybe Word8))))
      -- | Description of the error.
      Text
