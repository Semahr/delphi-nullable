# delphi-nullable

A lightweight Delphi library providing generic nullable types with implicit conversions, default values, and database field helpers that preserve SQL NULL values.

## Installation

Add the library directory to your project's search path. Use `Nullable` for the generic type and `Nullable.Fields` for database field helpers.

## Usage

```pascal
uses
  Nullable;

var
  Age: TNullable<Integer>;
begin
  Age := TNullable<Integer>.Null;
  Writeln(Age.GetValueOrDefault(18)); // 18

  Age := 25;
  if Age.HasValue then
    Writeln(Age.Value); // 25

  Age.Clear;
  // Age.IsNull is now True.
end;
```

- `HasValue` / `IsNull`: check whether a value is present.
- `Value`: retrieve the value; raises `EInvalidOp` if null.
- `GetValueOrDefault`: return the value or `Default(T)`, or a supplied fallback.
- `Clear`: reset the instance to null.

Initialize nullable variables explicitly with `TNullable<T>.Null` or a value before reading them.

## Database fields

Use the `TField` helper to preserve the distinction between SQL `NULL` and values such as zero or an empty string:

```pascal
uses
  Data.DB,
  Nullable,
  Nullable.Fields;

var
  Age: TNullable<Integer>;
begin
  Age := DataSet.FieldByName('age').AsNullableInteger;
end;
```

Here, `DataSet` represents an existing dataset. Available helpers: `AsNullableString`, `AsNullableInteger`, `AsNullableInt64`, `AsNullableDateTime`, `AsNullableBoolean`, and `AsNullableFloat`.

## Compatibility

Intended for Delphi. Requires support for generic records, implicit conversion operators, class helpers, and scoped unit names. Specific compiler versions have not yet been verified.
