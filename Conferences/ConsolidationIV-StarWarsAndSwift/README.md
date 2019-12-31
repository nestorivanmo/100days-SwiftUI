# What Star Wars Can Teach Us About Swift

[Original Conference](https://vimeo.com/295238750)

## Change

## Code

### Value Types

Value vs Reference

| Val               | Ref      |
| ----------------- | -------- |
| String, Integer   | Classes  |
| Array, Dictionary | Closures |
| Double, Boolean   |          |
| Set, Enum         |          |
| Tuple, Struct     |          |

> Although strings in Swift have value semantics, strings use a copy-on-write strategy to store their data in a buffer. This buffer can then be shared by different copies on a string.

*Strings wrap buffer references with value semantics*