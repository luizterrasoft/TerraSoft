unit uFila;

interface

type
  TFila = class

  private
    FoFila: Variant;
    function GetUltimoIndiceFila: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure InsereItem(psItem: String);
    function RemoveItem: String;
    function TotalItens: Integer;
  end;

implementation

uses Variants;

{ TFila }

constructor TFila.Create;
begin
  FoFila:= Null;
  inherited Create;
end;

destructor TFila.Destroy;
begin
  inherited;
end;

function TFila.GetUltimoIndiceFila: Integer;
begin
  Result:= VarArrayHighBound(FoFila, 1);
end;

procedure TFila.InsereItem(psItem: String);
begin
  if (VarIsNull(FoFila)) then
    FoFila:= VarArrayCreate([1,1], varVariant)
  else
    VarArrayRedim(FoFila, GetUltimoIndiceFila + 1);

    FoFila[GetUltimoIndiceFila]:= psItem;
end;

function TFila.RemoveItem: String;
begin
  Result:= '';
  if (TotalItens > 0) then
  begin
    Result:= FoFila[GetUltimoIndiceFila];
    VarArrayRedim(FoFila, GetUltimoIndiceFila - 1);
  end;
end;

function TFila.TotalItens: Integer;
begin
  Result:= 0;

  if (not(VarIsNull(FoFila))) and (not(VarIsEmpty(FoFila))) then
    Result:= VarArrayHighBound(FoFila, 1);
end;

end.
