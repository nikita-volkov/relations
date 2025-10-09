module Relations.Algebra.Builder where

-- | A typeclass for types that have an associated builder.
class IsBuilderOf buildable builder | builder -> buildable where
  -- | Materialize a builder into a buildable.
  build :: builder -> buildable

  -- | Create a builder from a buildable.
  unbuild :: buildable -> builder
