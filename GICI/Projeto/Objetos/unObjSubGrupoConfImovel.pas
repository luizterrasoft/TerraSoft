unit unObjSubGrupoConfImovel;

interface

uses
  unDM;

  type TObjSubGrupoConfImovel = class

    private
      FnCodigo: Integer;
      FnFk_Grupo: Integer;
      FsNome: String[50];
      FsExibeGrupo: String;
    public
      procedure setCodigo(pnCodigo: Integer);
      procedure setFkGrupo(pnFkGrupo: Integer);
      procedure setNome(psNome: String);
      procedure setExibeGrupo();

      function getCodigo(): Integer;
      function getFkGrupo(): Integer;
      function getNome(): String;
      function getExibeGrupo(): String;
      //verifica se existe diferenša no objeto. Quando estiver editando registro
      function verificarDiferencaCadastro(pnFkGrupo:Integer; psNome:String): boolean;
  end;

implementation

uses
  unConstantes;

{ TObjSubGrupoConfImovel }


{***** set's e get's *****}
procedure TObjSubGrupoConfImovel.setCodigo(pnCodigo: Integer);
begin
  try
    Self.FnCodigo := pnCodigo;
  except
    Self.FnCodigo := NUMERO_INDEFINIDO;
  end;
end;

function TObjSubGrupoConfImovel.getCodigo: Integer;
begin
  Result := Self.FnCodigo;
end;

procedure TObjSubGrupoConfImovel.setFkGrupo(pnFkGrupo: Integer);
begin
  try
    Self.FnFk_Grupo := pnFkGrupo;
  except
    Self.FnFk_Grupo := NUMERO_INDEFINIDO;
  end;
end;

function TObjSubGrupoConfImovel.getFkGrupo: Integer;
begin
  Result := Self.FnFk_Grupo;
end;

procedure TObjSubGrupoConfImovel.setNome(psNome: String);
begin
  try
    Self.FsNome := psNome;
  except
    Self.FsNome := STRING_INDEFINIDO;
  end;
end;

function TObjSubGrupoConfImovel.getNome: String;
begin
  Result := Self.FsNome;
end;

procedure TObjSubGrupoConfImovel.setExibeGrupo();
begin
  Self.FsExibeGrupo := STRING_INDEFINIDO;

  if(Self.FnFk_Grupo <> NUMERO_INDEFINIDO)then
  begin
    DM.zQryGrupoConfiguracaoImovel.Close;
    DM.zQryGrupoConfiguracaoImovel.SQL.Clear;
    DM.zQryGrupoConfiguracaoImovel.SQL.Add('SELECT * FROM grupo_configuracao_imovel WHERE codigo=:cod');
    DM.zQryGrupoConfiguracaoImovel.ParamByName('cod').AsInteger := Self.FnFk_Grupo;
    DM.zQryGrupoConfiguracaoImovel.Open;
    if(DM.zQryGrupoConfiguracaoImovel.RecordCount = 1)then
      //Self.FsExibeEstado := DM.zQryEstadoCODIGO.AsString + ' - ' + DM.zQryEstadoNOME.AsString;
      Self.FsExibeGrupo := DM.zQryGrupoConfiguracaoImovelNOME.AsString;
  end;
end;

function TObjSubGrupoConfImovel.getExibeGrupo(): String;
begin
  Result := Self.FsExibeGrupo;
end;


{***** procedimentos diversos *****}
//verifica se existe diferenša no objeto. Quando estiver editando registro
function TObjSubGrupoConfImovel.verificarDiferencaCadastro(pnFkGrupo:Integer; psNome:String): boolean;
var
  retorno: Boolean;
begin
  retorno := False;

  if (pnFkGrupo <> Self.getFkGrupo) then
    retorno := True;
  if (psNome <> Self.getNome) then
    retorno := True;

  Result := retorno;
end;

end.
