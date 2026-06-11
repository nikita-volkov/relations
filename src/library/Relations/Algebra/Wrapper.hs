module Relations.Algebra.Wrapper where

-- |
-- A wrapper is a type that wraps another type.
-- For one wrapper there exists exactly one content type.
--
-- All newtypes that expose their contents should be instances of this type class.
class IsWrapperOf content wrapper | wrapper -> content where
  wrap :: content -> wrapper
  unwrap :: wrapper -> content
