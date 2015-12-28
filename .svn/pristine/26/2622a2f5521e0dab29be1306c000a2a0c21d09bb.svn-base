unit uRepositorio.Base;

interface

uses
  DBclient, SqlExpr, SysUtils, DB, Variants, Forms;

type
  TRepositorioBase = class

    private
      FConexao: TSQLConnection;

    protected
      function ObterQuery: TSQLDataSet;

      constructor Create;

    public

  end;

implementation


{ TRepositorioBase }

constructor TRepositorioBase.Create;
begin
  if not Assigned(FConexao) then
    begin
      FConexao.ConnectionName := 'Singleton';
      FConexao.DriverName     := 'Interbase';
      FConexao.GetDriverFunc  := 'getSQLDriverINTERBASE';
      FConexao.LibraryName    := 'gds32.dll';
      FConexao.LoginPrompt    := False;
      FConexao.Params.Values['DriverName'] := 'Interbase';
      FConexao.Params.Values['Database'] := 'xxx';
      FConexao.Params.Values['User_Name'] := 'SYSDBA';
      FConexao.Params.Values['Password'] := 'masterkey';
      FConexao.Params.Values['HostName'] := 'localhost';
      FConexao.VendorLib   := 'gds32.dll';

      try
        FConexao.Open;
      except
        on e: Exception do
        begin
          raise Exception.Create('Não foi possível conectar-se com o Banco de Dados. ' + #13 + e.Message);
        end;

      end;

    end;
end;

function TRepositorioBase.ObterQuery: TSQLDataSet;
begin
  Result := TSQLDataSet.Create(nil);
  Result.SqlConnection := FConexao;
end;

end.
