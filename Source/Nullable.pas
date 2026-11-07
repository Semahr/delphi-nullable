unit Nullable;

interface

type
  TNullable<T> = record
  private
    FValue: T;
    FHasValue: Boolean;

    function GetValue: T;
    function GetIsNull: Boolean;
  public
    constructor Create(const AValue: T);

    class function Null: TNullable<T>; static;

    procedure Clear;

    function GetValueOrDefault: T; overload;
    function GetValueOrDefault(const ADefault: T): T; overload;

    class operator Implicit(const AValue: T): TNullable<T>;

    property HasValue: Boolean read FHasValue;
    property IsNull: Boolean read GetIsNull;
    property Value: T read GetValue;
  end;

implementation

uses
  System.SysUtils;

{ TNullable<T> }

constructor TNullable<T>.Create(const AValue: T);
begin
  FValue := AValue;
  FHasValue := True;
end;

class function TNullable<T>.Null: TNullable<T>;
begin
  Result := Default(TNullable<T>);
end;

procedure TNullable<T>.Clear;
begin
  FValue := Default(T);
  FHasValue := False;
end;

function TNullable<T>.GetValue: T;
begin
  if not FHasValue then
    raise EInvalidOp.Create('Cannot access the value of a NULL instance.');

  Result := FValue;
end;

function TNullable<T>.GetIsNull: Boolean;
begin
  Result := not FHasValue;
end;

function TNullable<T>.GetValueOrDefault: T;
begin
  Result := GetValueOrDefault(Default(T));
end;

function TNullable<T>.GetValueOrDefault(
  const ADefault: T): T;
begin
  if FHasValue then
    Result := FValue
  else
    Result := ADefault;
end;

class operator TNullable<T>.Implicit(
  const AValue: T): TNullable<T>;
begin
  Result := TNullable<T>.Create(AValue);
end;

end.
