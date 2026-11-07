unit Nullable.Fields;

interface

uses
  Data.DB,
  Nullable;

type
  TNullableFieldHelper = class helper for TField
  public
    function AsNullableString: TNullable<string>;
    function AsNullableInteger: TNullable<Integer>;
    function AsNullableInt64: TNullable<Int64>;
    function AsNullableDateTime: TNullable<TDateTime>;
    function AsNullableBoolean: TNullable<Boolean>;
    function AsNullableFloat: TNullable<Double>;
  end;

implementation

function TNullableFieldHelper.AsNullableString: TNullable<string>;
begin
  if IsNull then
    Result := TNullable<string>.Null
  else
    Result := AsString;
end;

function TNullableFieldHelper.AsNullableInteger: TNullable<Integer>;
begin
  if IsNull then
    Result := TNullable<Integer>.Null
  else
    Result := AsInteger;
end;

function TNullableFieldHelper.AsNullableInt64: TNullable<Int64>;
begin
  if IsNull then
    Result := TNullable<Int64>.Null
  else
    Result := AsLargeInt;
end;

function TNullableFieldHelper.AsNullableDateTime: TNullable<TDateTime>;
begin
  if IsNull then
    Result := TNullable<TDateTime>.Null
  else
    Result := AsDateTime;
end;

function TNullableFieldHelper.AsNullableBoolean: TNullable<Boolean>;
begin
  if IsNull then
    Result := TNullable<Boolean>.Null
  else
    Result := AsBoolean;
end;

function TNullableFieldHelper.AsNullableFloat: TNullable<Double>;
begin
  if IsNull then
    Result := TNullable<Double>.Null
  else
    Result := AsFloat;
end;

end.
