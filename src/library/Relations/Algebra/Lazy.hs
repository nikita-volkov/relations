module Relations.Algebra.Lazy where

class IsLazyFormOf strict lazy | lazy -> strict where
  fromStrict :: strict -> lazy
  toStrict :: lazy -> strict
