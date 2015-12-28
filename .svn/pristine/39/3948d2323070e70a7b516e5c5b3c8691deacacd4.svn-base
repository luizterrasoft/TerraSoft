unit uspQuery;

interface

uses
  DBTables, Classes;

type
  TspQuery = class(TQuery)
  private
    FospColunas: TStringList;
    FospTabelas: TStringList;
    FospCondicoes: TStringList;

    function GetColunas: TStringList;
    function GetTabelas: TStringList;
    function GetCondicoes: TStringList;
  public
    procedure GeraSQL;
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
  published
    property spColunas: TStringList read GetColunas;
    property spTabelas: TStringList read GetTabelas;
    property spCondicoes: TStringList read GetCondicoes;
  end;

//procedure Register;

implementation

uses SysUtils;

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited;
  FospColunas := TStringList.Create;
  FospTabelas := TStringList.Create;
  FospCondicoes := TStringList.Create;
end;

destructor TspQuery.Destroy;
begin
  if Assigned(FospColunas) then
    FreeAndNil(FospColunas);
  if Assigned(FospTabelas) then
    FreeAndNil(FospTabelas);
  if Assigned(FospCondicoes) then
    FreeAndNil(FospCondicoes);

  inherited;
end;

procedure TspQuery.GeraSQL;
var
  i: Integer;
  sSql: String;
begin
  sSql := '';
  SQL.Clear;
  
  sSql := 'SELECT ';
  sSql := sSql + spColunas.CommaText + ' ';
  sSql := sSql + ' FROM ';
  sSql := sSql + spTabelas.CommaText + ' ';
  if (spCondicoes.Count > 0) then
  begin
    for i:=0 to spCondicoes.Count-1 do
    begin
      if (i=0) then
        sSql := sSql + ' WHERE '
      else
        sSql := sSql + ' AND ';
      sSql := sSql + spCondicoes.Strings[i];
    end;
  end;
  
  SQL.Add(sSql);
end;

function TspQuery.GetColunas: TStringList;
begin
  Result := FospColunas;
end;

function TspQuery.GetTabelas: TStringList;
begin
  Result := FospTabelas;
end;

function TspQuery.GetCondicoes: TStringList;
begin
  Result := FospCondicoes;
end;

end.
