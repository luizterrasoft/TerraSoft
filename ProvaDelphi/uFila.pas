unit uFila;

interface

type
  TFila = class

  private
    FoFila: variant;
    function GetUltimoIndiceFila: integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure InsereItem(psItem: string);
    function RemoveItem: string;
    function TotalItens: integer;

  end;

implementation


{ TFila }

constructor TFila.Create;
begin
  FoFila := Null;
  inherited Create;
end;

destructor TFila.Destroy;
begin
  inherited;

end;

function TFila.GetUltimoIndiceFila: integer;
begin
  Result := VarArrayHighBound(FoFila,1);
end;

procedure TFila.InsereItem(psItem: string);
begin
  if (VarIsNull(foFila)) then
    FoFila := VarArrayCreate([1,1], varVariant)
  else
    VarArrayRedim(FoFila, GetUltimoIndiceFila + 1);

  FoFila[GetUltimoIndiceFila] := psItem;
end;

function TFila.RemoveItem: string;
begin
  Result := '';
  if (TotalItens > 0) then
  begin
    Result := FoFila[getUltimoIndiceFila];
    VarArrayRedim(FoFila,GetUltimoIndiceFila-1);
  end;
end;

function TFila.TotalItens: integer;
begin
  Result := 0;

  if (not(VarIsNull(FoFila))) and (not(VarIsEmpty(FoFila))) then
    Result := VarArrayHighBound(FoFila, 1);
end;

end.
