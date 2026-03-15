# relations

[![Hackage](https://img.shields.io/hackage/v/relations.svg)](https://hackage.haskell.org/package/relations)
[![Continuous Haddock](https://img.shields.io/badge/haddock-master-blue)](https://nikita-volkov.github.io/relations/)

Haskell library of lawful typeclasses capturing named relations between pairs of data types. A successor to [`lawful-conversions`](https://hackage.haskell.org/package/lawful-conversions) and [`isomorphism-class`](https://hackage.haskell.org/package/isomorphism-class), addressing the limitation that `to`/`from` naming does not scale when multiple distinct conversions exist between two types.

## Typeclasses

### `IsUtf8EncodingOf decoding encoding`

Relation between a UTF-8 encoded form and its decoded form.

```haskell
encodeUtf8        :: decoding -> encoding
decodeUtf8        :: encoding -> Either Utf8DecodingError decoding
decodeUtf8Lenient :: encoding -> decoding
```

Instances: `ByteString` ↔ `Text`, `ByteString` ↔ `Lazy.Text`, `LazyByteString` ↔ `Text`, etc.

### `IsLazyFormOf strict lazy`

Relation between a strict and lazy form of the same data.

```haskell
fromStrict :: strict -> lazy
toStrict   :: lazy   -> strict
```

Instances: `Text` / `Lazy.Text`, `ByteString` / `Lazy.ByteString`.

### `IsListOf element list`

Relation between a list-like container and its element type.

```haskell
list   :: list -> [element]
unlist :: [element] -> list
```

Instances: `Text` (`Char`), `Lazy.Text` (`Char`), `[a]` (`a`), `Set a` (`a`), `HashSet a` (`a`).

### `IsSetOf element set`

Extends `IsListOf` with set semantics.

```haskell
contains :: element -> set -> Bool
include  :: element -> set -> set
exclude  :: element -> set -> set
```

Instances: `Set a`, `HashSet a`.

### `IsBuilderOf buildable builder`

Relation between a type and its associated builder.

```haskell
build   :: builder   -> buildable
unbuild :: buildable -> builder
```

### `IsIso8601EncodingOf time encoding`

Relation between a time value and its ISO 8601 textual encoding.

```haskell
encodeIso8601 :: time -> encoding
decodeIso8601 :: encoding -> Maybe time
```

Instances: `UTCTime` ↔ `Text`.

## Installation

```cabal
build-depends: relations
```

## Design

All typeclasses are parameterised over two types and use functional dependencies for unambiguous instance resolution. The descriptive naming convention (`IsUtf8EncodingOf`, `IsLazyFormOf`, etc.) keeps multiple relations between the same pair of types distinguishable, unlike generic `to`/`from`.
