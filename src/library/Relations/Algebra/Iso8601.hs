module Relations.Algebra.Iso8601 where

import Prelude

class IsIso8601EncodingOf time encoding where
  decodeIso8601 :: encoding -> Maybe time
  encodeIso8601 :: time -> encoding
