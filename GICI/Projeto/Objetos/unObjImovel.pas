unit unObjImovel;

interface

uses
  unDM;

  type TObjImovel = class

    private
      FnCodigo: Integer;
      FdDataCadastro: TDateTime;
      FnCodFK_TipoImovel: Integer;
      FnCodFK_Estado: Integer;
      FnCodFK_Cidade: Integer;
      FnCodFK_Bairro: Integer;
      FnCodFK_Rua: Integer;
      FsEnderecoCEP: String[9];
      FsEnderecoComplemento: String;
      FnStatus: Integer;
      FsSituacaoDesejavel: String[20];
      FdValorImovel: Double;
      FsDescricao: String;
      FsExibeTipoImovel: String;
      FsExibeEstado: String;
      FsExibeCidade: String;
      FsExibeBairro: String;
      FsExibeRua: String;
    public
      procedure setCodigo(pnCodigo: Integer);
      procedure setDataCadastro(pdDataCadastro: TDateTime);
      procedure setCodFK_TipoImovel(pnCodFK_TipoImovel: Integer);
      procedure setCodFK_Estado(pnCodFK_Estado: Integer);
      procedure setCodFK_Cidade(pnCodFK_Cidade: Integer);
      procedure setCodFK_Bairro(pnCodFK_Bairro: Integer);
      procedure setCodFK_Rua(pnCodFK_Rua: Integer);
      procedure setEnderecoCEP(psEnderecoCEP: String);
      procedure setEnderecoComplemento(psEnderecoComplemento: String);
      procedure setStatus(pnStatus: Integer);
      procedure setSituacaoDesejavel(psSituacaoDesejavel: String);
      procedure setValorImovel(pdValorImovel: Double);
      procedure setDescricao(psDescricao: String);
      procedure setExibeTipoImovel(const pbMostrarNaoDefinido: Boolean = True);
      procedure setExibeEstado(const pbMostrarNaoDefinido: Boolean = True);
      procedure setExibeCidade(const pbMostrarNaoDefinido: Boolean = True);
      procedure setExibeBairro(const pbMostrarNaoDefinido: Boolean = True);
      procedure setExibeRua(const pbMostrarNaoDefinido: Boolean = True);

      function getCodigo(): Integer;
      function getDataCadastro(): TDateTime;
      function getCodFK_TipoImovel(): Integer;
      function getCodFK_Estado(): Integer;
      function getCodFK_Cidade(): Integer;
      function getCodFK_Bairro(): Integer;
      function getCodFK_Rua(): Integer;
      function getEnderecoCEP(): String;
      function getEnderecoComplemento(): String;
      function getStatus(): Integer;
      function getSituacaoDesejavel(): String;
      function getValorImovel(): Double;
      function getDescricao(): String;
      function getExibeTipoImovel(): String;
      function getExibeEstado(): String;
      function getExibeCidade(): String;
      function getExibeBairro(): String;
      function getExibeRua(): String;

      //limpa os dados do objeto
      procedure limparObjeto();

      //verifica se existe diferenša no objeto. Quando estiver editando registro
      function verificarDiferencaCadastro(pnFkTipoImovel:Integer;
        pnFkEstado:Integer; pnFkCidade:Integer; pnFkBairro:Integer; pnFkRua:Integer;
        psEnderecoCEP:String; psEnderecoComplemento:String; psSituacaoDesejavel:String;
        pdValorImovel:Double; psDescricao:String): Boolean;
  end;

implementation

uses
  unConstantes;

{ TImovel }

{***** set's e get's *****}
procedure TObjImovel.setCodigo(pnCodigo: Integer);
begin
  try
    Self.FnCodigo := pnCodigo;
  except
    Self.FnCodigo := NUMERO_INDEFINIDO;
  end;
end;

function TObjImovel.getCodigo: Integer;
begin
  Result := Self.FnCodigo;
end;

procedure TObjImovel.setDataCadastro(pdDataCadastro: TDateTime);
begin
  try
    Self.FdDataCadastro := pdDataCadastro;
  except
    Self.FdDataCadastro := NUMERO_INDEFINIDO;
  end;
end;

function TObjImovel.getDataCadastro(): TDateTime;
begin
  Result := Self.FdDataCadastro;
end;

procedure TObjImovel.setCodFK_TipoImovel(pnCodFK_TipoImovel: Integer);
begin
  try
    Self.FnCodFK_TipoImovel := pnCodFK_TipoImovel;
  except
    Self.FnCodFK_TipoImovel := NUMERO_INDEFINIDO;
  end;
end;

function TObjImovel.getCodFK_TipoImovel(): Integer;
begin
  Result := Self.FnCodFK_TipoImovel;
end;

procedure TObjImovel.setCodFK_Estado(pnCodFK_Estado: Integer);
begin
  try
    Self.FnCodFK_Estado := pnCodFK_Estado;
  except
    Self.FnCodFK_Estado := NUMERO_INDEFINIDO;
  end;
end;

function TObjImovel.getCodFK_Estado(): Integer;
begin
  Result := Self.FnCodFK_Estado;
end;

procedure TObjImovel.setCodFK_Cidade(pnCodFK_Cidade: Integer);
begin
  try
    Self.FnCodFK_Cidade := pnCodFK_Cidade;
  except
    Self.FnCodFK_Cidade := NUMERO_INDEFINIDO;
  end;
end;

function TObjImovel.getCodFK_Cidade(): Integer;
begin
  Result := Self.FnCodFK_Cidade;
end;

procedure TObjImovel.setCodFK_Bairro(pnCodFK_Bairro: Integer);
begin
  try
    Self.FnCodFK_Bairro := pnCodFK_Bairro;
  except
    Self.FnCodFK_Bairro := NUMERO_INDEFINIDO;
  end;
end;

function TObjImovel.getCodFK_Bairro(): Integer;
begin
  Result := Self.FnCodFK_Bairro;
end;

procedure TObjImovel.setCodFK_Rua(pnCodFK_Rua: Integer);
begin
  try
    Self.FnCodFK_Rua := pnCodFK_Rua;
  except
    Self.FnCodFK_Rua := NUMERO_INDEFINIDO;
  end;
end;

function TObjImovel.getCodFK_Rua(): Integer;
begin
  Result := Self.FnCodFK_Rua;
end;

procedure TObjImovel.setEnderecoCEP(psEnderecoCEP: String);
begin
  try
    Self.FsEnderecoCEP := psEnderecoCEP;
  except
    Self.FsEnderecoCEP := STRING_INDEFINIDO;
  end;
end;

function TObjImovel.getEnderecoCEP(): String;
begin
  Result := Self.FsEnderecoCEP;
end;

procedure TObjImovel.setEnderecoComplemento(psEnderecoComplemento: String);
begin
  try
    Self.FsEnderecoComplemento := psEnderecoComplemento;
  except
    Self.FsEnderecoComplemento := STRING_INDEFINIDO;
  end;
end;

function TObjImovel.getEnderecoComplemento(): String;
begin
  Result := Self.FsEnderecoComplemento;
end;

procedure TObjImovel.setStatus(pnStatus: Integer);
begin
  try
    Self.FnStatus := pnStatus;
  except
    Self.FnStatus := NUMERO_INDEFINIDO;
  end;
end;

function TObjImovel.getStatus(): Integer;
begin
  Result := Self.FnStatus;
end;

procedure TObjImovel.setSituacaoDesejavel(psSituacaoDesejavel: String);
begin
  try
    Self.FsSituacaoDesejavel := psSituacaoDesejavel;
  except
    Self.FsSituacaoDesejavel := STRING_INDEFINIDO;
  end;
end;

function TObjImovel.getSituacaoDesejavel(): String;
begin
  Result := Self.FsSituacaoDesejavel;
end;

procedure TObjImovel.setValorImovel(pdValorImovel: Double);
begin
  try
    Self.FdValorImovel := pdValorImovel;
  except
    Self.FdValorImovel := NUMERO_INDEFINIDO;
  end;
end;

function TObjImovel.getValorImovel(): Double;
begin
  Result := Self.FdValorImovel;
end;

procedure TObjImovel.setDescricao(psDescricao: String);
begin
  try
    Self.FsDescricao := psDescricao;
  except
    Self.FsDescricao := STRING_INDEFINIDO;
  end;
end;

function TObjImovel.getDescricao(): String;
begin
  Result := Self.FsDescricao;
end;

procedure TObjImovel.setExibeTipoImovel(const pbMostrarNaoDefinido: Boolean = True);
begin
  FsExibeTipoImovel := STRING_INDEFINIDO;

  if(not(pbMostrarNaoDefinido) and (FnCodFK_TipoImovel=REGISTRO_NULO))then
    FsExibeTipoImovel := STRING_INDEFINIDO
  else
  begin
    if(Self.FnCodFK_TipoImovel <> NUMERO_INDEFINIDO)then
    begin
      DM.zQryTipoImovel.Close;
      DM.zQryTipoImovel.SQL.Clear;
      DM.zQryTipoImovel.SQL.Add('SELECT * FROM tipo_imovel WHERE codigo=:cod');
      DM.zQryTipoImovel.ParamByName('cod').AsInteger := Self.FnCodFK_TipoImovel;
      DM.zQryTipoImovel.Open;
      if(DM.zQryTipoImovel.RecordCount = 1)then
        //Self.FsExibeTipoImovel := DM.zQryTipoImovelCODIGO.AsString + ' - ' + DM.zQryTipoImovelNOME.AsString;
        Self.FsExibeTipoImovel := DM.zQryTipoImovelNOME.AsString;
    end;
  end;
end;

function TObjImovel.getExibeTipoImovel(): String;
begin
  Result := Self.FsExibeTipoImovel;
end;

procedure TObjImovel.setExibeEstado(const pbMostrarNaoDefinido: Boolean = True);
begin
  FsExibeEstado := STRING_INDEFINIDO;

  if(not(pbMostrarNaoDefinido) and (FnCodFK_Estado=REGISTRO_NULO))then
    FsExibeEstado := STRING_INDEFINIDO
  else
  begin
    if(FnCodFK_Estado <> NUMERO_INDEFINIDO)then
    begin
      DM.zQryEstado.Close;
      DM.zQryEstado.SQL.Clear;
      DM.zQryEstado.SQL.Add('SELECT * FROM estado WHERE codigo=:cod');
      DM.zQryEstado.ParamByName('cod').AsInteger := Self.FnCodFK_Estado;
      DM.zQryEstado.Open;
      if(DM.zQryEstado.RecordCount = 1)then
        //Self.FsExibeEstado := DM.zQryEstadoCODIGO.AsString + ' - ' + DM.zQryEstadoNOME.AsString;
        Self.FsExibeEstado := DM.zQryEstadoNOME.AsString;
    end;
  end;
end;

function TObjImovel.getExibeEstado(): String;
begin
  Result := Self.FsExibeEstado;
end;

procedure TObjImovel.setExibeCidade(const pbMostrarNaoDefinido: Boolean = True);
begin
  FsExibeCidade := STRING_INDEFINIDO;

  if(not(pbMostrarNaoDefinido) and (FnCodFK_Cidade=REGISTRO_NULO))then
    FsExibeCidade := STRING_INDEFINIDO
  else
  begin
    if(Self.FnCodFK_Cidade <> NUMERO_INDEFINIDO)then
    begin
      DM.zQryCidade.Close;
      DM.zQryCidade.SQL.Clear;
      DM.zQryCidade.SQL.Add('SELECT * FROM cidade WHERE codigo=:cod');
      DM.zQryCidade.ParamByName('cod').AsInteger := Self.FnCodFK_Cidade;
      DM.zQryCidade.Open;
      if(DM.zQryCidade.RecordCount = 1)then
        //Self.FsExibeCidade := DM.zQryCidadeCODIGO.AsString + ' - ' + DM.zQryCidadeNOME.AsString;
        Self.FsExibeCidade := DM.zQryCidadeNOME.AsString;
    end;
  end;
end;

function TObjImovel.getExibeCidade(): String;
begin
  Result := Self.FsExibeCidade;
end;

procedure TObjImovel.setExibeBairro(const pbMostrarNaoDefinido: Boolean = True);
begin
  Self.FsExibeBairro := STRING_INDEFINIDO;

  if(not(pbMostrarNaoDefinido) and (FnCodFK_Bairro=REGISTRO_NULO))then
    FsExibeBairro := STRING_INDEFINIDO
  else
  begin
    if(Self.FnCodFK_Bairro <> NUMERO_INDEFINIDO)then
    begin
      DM.zQryBairro.Close;
      DM.zQryBairro.SQL.Clear;
      DM.zQryBairro.SQL.Add('SELECT * FROM bairro WHERE codigo=:cod');
      DM.zQryBairro.ParamByName('cod').AsInteger := Self.FnCodFK_Bairro;
      DM.zQryBairro.Open;
      if(DM.zQryBairro.RecordCount = 1)then
        //Self.FsExibeBairro := DM.zQryBairroCODIGO.AsString + ' - ' + DM.zQryBairroNOME.AsString;
        Self.FsExibeBairro := DM.zQryBairroNOME.AsString;
    end;
  end;
end;

function TObjImovel.getExibeBairro(): String;
begin
  Result := Self.FsExibeBairro;
end;

procedure TObjImovel.setExibeRua(const pbMostrarNaoDefinido: Boolean = True);
begin
  Self.FsExibeRua := STRING_INDEFINIDO;

  if(not(pbMostrarNaoDefinido) and (FnCodFK_Rua=REGISTRO_NULO))then
    FsExibeRua := STRING_INDEFINIDO
  else
  begin
    if(Self.FnCodFK_Rua <> NUMERO_INDEFINIDO)then
    begin
      DM.zQryRua.Close;
      DM.zQryRua.SQL.Clear;
      DM.zQryRua.SQL.Add('SELECT * FROM rua WHERE codigo=:cod');
      DM.zQryRua.ParamByName('cod').AsInteger := Self.FnCodFK_Rua;
      DM.zQryRua.Open;
      if(DM.zQryRua.RecordCount = 1)then
        //Self.FsExibeRua := DM.zQryRuaCODIGO.AsString + ' - ' + DM.zQryRuaNOME.AsString;
        Self.FsExibeRua := DM.zQryRuaNOME.AsString;
    end;
  end;
end;

function TObjImovel.getExibeRua(): String;
begin
  Result := Self.FsExibeRua;
end;

procedure TObjImovel.limparObjeto();
begin
  Self.setCodigo(NUMERO_INDEFINIDO);
  Self.setDataCadastro(NUMERO_INDEFINIDO);
  Self.setCodFK_TipoImovel(NUMERO_INDEFINIDO);
  Self.setCodFK_Estado(NUMERO_INDEFINIDO);
  Self.setCodFK_Cidade(NUMERO_INDEFINIDO);
  Self.setCodFK_Bairro(NUMERO_INDEFINIDO);
  Self.setCodFK_Rua(NUMERO_INDEFINIDO);
  Self.setEnderecoCEP(STRING_INDEFINIDO);
  self.setEnderecoComplemento(STRING_INDEFINIDO);
  Self.setStatus(NUMERO_INDEFINIDO);
  Self.setSituacaoDesejavel(STRING_INDEFINIDO);
  Self.setValorImovel(NUMERO_INDEFINIDO);
  Self.setDescricao(STRING_INDEFINIDO);
  Self.setExibeTipoImovel();
end;

//verifica se existe diferenša no objeto. Quando estiver editando registro
function TObjImovel.verificarDiferencaCadastro(pnFkTipoImovel:Integer;
  pnFkEstado:Integer; pnFkCidade:Integer; pnFkBairro:Integer; pnFkRua:Integer;
  psEnderecoCEP:String; psEnderecoComplemento:String; psSituacaoDesejavel:String;
  pdValorImovel:Double; psDescricao:String): Boolean;
var
  retorno: Boolean;
begin
  retorno := False;

  if (pnFkTipoImovel <> Self.getCodFK_TipoImovel) then
    retorno := True;
  if(pnFkEstado <> Self.getCodFK_Estado) then
    retorno := True;
  if(pnFkCidade <> Self.getCodFK_Cidade) then
    retorno := True;
  if(pnFkBairro <> Self.getCodFK_Bairro) then
    retorno := True;
  if(pnFkRua <> Self.getCodFK_Rua) then
    retorno := True;
  if(psEnderecoCEP <> Self.getEnderecoCEP) then
    retorno := True;
  if(psEnderecoComplemento <> Self.getEnderecoComplemento) then
    retorno := True;
  if (psSituacaoDesejavel <> Self.getSituacaoDesejavel) then
    retorno := True;
  if (pdValorImovel <> Self.getValorImovel) then
    retorno := True;
  if (psDescricao <> Self.getDescricao) then
    retorno := True;

  Result := retorno;
end;

end.
