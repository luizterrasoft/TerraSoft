unit unMetodos;

interface

uses
  SQLExpr, Classes;

type
  TMetodos = class

    private

    public
      procedure pCriarQuery(var oQry: TSQLQuery);

  end;

implementation

uses unDM;

{ TFuncoes }


{ TFuncoes }

procedure TMetodos.pCriarQuery(
  var oQry: TSQLQuery);
begin
  if Assigned(oQry) then
    oQry.Free;

  oQry := TSQLQuery.Create(nil);
  oQry.SQL
  NomeQry.RequestLive  := False;
  nomeDS.DataSet       := NomeQry;
end;

end.
