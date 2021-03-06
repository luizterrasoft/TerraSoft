unit unIncluirCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, StdCtrls, Buttons, ExtCtrls, FMTBcd, Mask, SqlExpr,
  DB, Provider, DBClient, unFUncoes;

type
  TfrmIncluirCliente = class(TfrmCadastros)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblMunicipio: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    lblRegiao: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    lblUsuario: TLabel;
    Label11: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    mskDataCad: TMaskEdit;
    edtApelido: TEdit;
    CbxTipoPessoa: TComboBox;
    mskCPF: TMaskEdit;
    edtRG: TEdit;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    edtNumero: TEdit;
    edtCodMunicipio: TEdit;
    BtnBuscaMunicipio: TBitBtn;
    edtCodRegiao: TEdit;
    BtnBuscaRegiao: TBitBtn;
    mskFone1: TMaskEdit;
    mskFone2: TMaskEdit;
    mskCelular: TMaskEdit;
    edtLimiteCredito: TEdit;
    CbxSituacao: TComboBox;
    mskUltimaAqui: TMaskEdit;
    edtCodUsuario: TEdit;
    procedure edtCodMunicipioExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtCodMunicipioEnter(Sender: TObject);
    procedure edtCodRegiaoEnter(Sender: TObject);
    procedure edtCodRegiaoExit(Sender: TObject);
    procedure CbxTipoPessoaExit(Sender: TObject);
    procedure edtLimiteCreditoExit(Sender: TObject);
    procedure BtnBuscaMunicipioClick(Sender: TObject);
    procedure BtnBuscaRegiaoClick(Sender: TObject);
  private
    loFuncoes: TFuncoes;
    function ExisteCliente: boolean;

  public
    procedure TipoPessoa;
    procedure limpa; override;
    procedure incluir; override;
    procedure alterar; override;
  end;

var
  frmIncluirCliente: TfrmIncluirCliente;

implementation

uses unMunicipios, unRegioes, unConsultas, unDM, unPrincipal;


{$R *.dfm}

{ TfrmIncluirCliente }

procedure TfrmIncluirCliente.limpa;
begin
  inherited;
  lblMunicipio.Caption := '';
  lblRegiao.Caption    := '';
  lblUsuario.Caption   := '';
end;


procedure TfrmIncluirCliente.alterar;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE clientes SET nome=:nome,apelido=:apel,cpf=:cpf,rg=:rg,tipopessoa=:tipo,');
      Add('endereco=:ende,bairro=:bai,numero=:num,fone1=:fone1,');
      Add('fone2=:fone2,celular=:cel,codusuario=:usu,');
      Add('situacao=:sit,datacadastro=:dtcad');

      if edtCodMunicipio.Text <> trim('') then
        Add(',codmunicipio = :muni');

      if edtCodRegiao.Text <> trim('') then
        Add(',codregiao = :reg');

      if edtLimiteCredito.Text <> trim('0.00') then
        Add(',limitecredito = :limi');

      Add('WHERE codigo = :cod');
      ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
      ParamByName('nome').AsString := edtNome.Text;
      ParamByName('apel').AsString := edtApelido.Text;
      ParamByName('cpf').AsString  := mskCPF.Text;
      ParamByName('rg').AsString   := edtRG.Text;

      if CbxTipoPessoa.ItemIndex = 0 then
        ParamByName('tipo').AsString := 'F'
      else
        ParamByName('tipo').AsString := 'J';

      ParamByName('ende').AsString := edtEndereco.Text;
      ParamByName('bai').AsString  := edtBairro.Text;
      ParamByName('num').AsString  := edtNumero.Text;

      if edtCodMunicipio.Text <> trim('') then
        ParamByName('muni').AsInteger:= StrToInt(edtCodMunicipio.Text);

      ParamByName('fone1').AsString:= mskFone1.Text;
      ParamByName('fone2').AsString:= mskFone2.Text;
      ParamByName('cel').AsString  := mskCelular.Text;
      
      ParamByName('usu').AsInteger := frmPrincipal.iCodUsuario;

      if edtCodRegiao.Text <> trim('') then
        ParamByName('reg').AsInteger := StrToInt(edtCodRegiao.Text);

      if edtLimiteCredito.Text <> trim('0.00') then
        ParamByName('limi').AsFloat  := StrToFloat(edtLimiteCredito.Text);

      if CbxSituacao.ItemIndex = 0 then
        ParamByName('sit').AsString := 'A'
      else
        ParamByName('sit').AsString := 'I';

      ParamByName('dtcad').AsDate := Date;
      ExecSQL();
    end;

end;

procedure TfrmIncluirCliente.incluir;
begin
  inherited;

  if ExisteCliente = true then
    Exit;

  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('INSERT INTO clientes (nome,apelido,cpf,rg,tipopessoa,endereco,bairro,numero,');
      Add('fone1,fone2,celular,situacao,datacadastro');

      if frmPrincipal.iCodUsuario > 0 then
        Add(',codusuario');

      if edtCodMunicipio.Text <> trim('') then
        Add(',codmunicipio');

      if edtCodRegiao.Text <> trim('') then
        Add(',codregiao');

      if (edtLimiteCredito.Text <> ('0.00')) and (edtLimiteCredito.Text <> ('0,00'))
      and (edtLimiteCredito.Text <> ('0')) and (edtLimiteCredito.Text <> trim('')) then
        Add(',limitecredito');

      Add(')');

      Add('VALUES (:nome,:apel,:cpf,:rg,:tipo,:ende,:bai,:num,:fone1,:fone2,:cel,');
      Add(':sit,:dtcad');

      if frmPrincipal.iCodUsuario > 0 then
        Add(',:usu');

      if edtCodMunicipio.Text <> trim('') then
        Add(',:muni');

      if edtCodRegiao.Text <> trim('') then
        Add(',:reg');

      if (edtLimiteCredito.Text <> ('0.00')) and (edtLimiteCredito.Text <> ('0,00'))
      and (edtLimiteCredito.Text <> ('0')) and (edtLimiteCredito.Text <> trim('')) then
        Add(',:limi');

      Add(')');

      ParamByName('nome').AsString := edtNome.Text;
      ParamByName('apel').AsString := edtApelido.Text;
      ParamByName('cpf').AsString  := mskCPF.Text;
      ParamByName('rg').AsString   := edtRG.Text;

      if CbxTipoPessoa.ItemIndex = 0 then
        ParamByName('tipo').AsString := 'F'
      else
        ParamByName('tipo').AsString := 'J';

      ParamByName('ende').AsString := edtEndereco.Text;
      ParamByName('bai').AsString  := edtBairro.Text;
      ParamByName('num').AsString  := edtNumero.Text;

      if edtCodMunicipio.Text <> trim('') then
        ParamByName('muni').AsInteger:= StrToInt(edtCodMunicipio.Text);

      ParamByName('fone1').AsString:= mskFone1.Text;
      ParamByName('fone2').AsString:= mskFone2.Text;
      ParamByName('cel').AsString  := mskCelular.Text;

      if frmPrincipal.iCodUsuario > 0 then
        ParamByName('usu').AsInteger := frmPrincipal.iCodUsuario;

      if edtCodRegiao.Text <> trim('') then
        ParamByName('reg').AsInteger := StrToInt(edtCodRegiao.Text);

      if (edtLimiteCredito.Text <> ('0.00')) and (edtLimiteCredito.Text <> ('0,00'))
      and (edtLimiteCredito.Text <> ('0')) and (edtLimiteCredito.Text <> trim('')) then
        ParamByName('limi').AsFloat  := StrToFloat(edtLimiteCredito.Text);

      if CbxSituacao.ItemIndex = 0 then
        ParamByName('sit').AsString := 'A'
      else
        ParamByName('sit').AsString := 'I';

      ParamByName('dtcad').AsDate := Date;
      ExecSQL();
    end;
end;

procedure TfrmIncluirCliente.edtCodMunicipioExit(Sender: TObject);
begin
  inherited;
  if edtCodMunicipio.Text <> trim('') then
    begin
      lblMunicipio.Caption := loFuncoes.BuscaFk(edtCodMunicipio.Text,'municipios','nome');

      if lblMunicipio.Caption = trim('') then
        begin
          edtCodMunicipio.Clear;
          BtnBuscaMunicipio.SetFocus;
        end
      else
        edtCodRegiao.SetFocus;
    end;
end;

procedure TfrmIncluirCliente.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmIncluirCliente.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmIncluirCliente.edtCodMunicipioEnter(Sender: TObject);
begin
  inherited;
  lblMunicipio.Caption := '';
end;

procedure TfrmIncluirCliente.edtCodRegiaoEnter(Sender: TObject);
begin
  inherited;
  lblRegiao.Caption := '';
end;

procedure TfrmIncluirCliente.edtCodRegiaoExit(Sender: TObject);
begin
  inherited;
  if edtCodRegiao.Text <> trim('') then
    begin
      lblRegiao.Caption := loFuncoes.BuscaFk(edtCodRegiao.Text,'regioes','descricao');

      if lblRegiao.Caption = trim('') then
        begin
          edtCodRegiao.Clear;
          BtnBuscaRegiao.SetFocus;
        end
      else
        mskFone1.SetFocus;
    end;
end;

procedure TfrmIncluirCliente.TipoPessoa;
begin
  if CbxTipoPessoa.ItemIndex = 0 then
    begin
      Label7.Caption := 'CPF';
      mskCPF.EditMask:= '999.999.999-99;1;_';
      Label5.Caption := 'RG';
    end
  else
    begin
      Label7.Caption := 'CNPJ';
      mskCPF.EditMask:= '99.999.999/9999-99;1;_';
      Label5.Caption := 'IE';
    end;
end;

procedure TfrmIncluirCliente.CbxTipoPessoaExit(Sender: TObject);
begin
  inherited;
  TipoPessoa;
end;

procedure TfrmIncluirCliente.edtLimiteCreditoExit(Sender: TObject);
begin
  inherited;
  edtLimiteCredito.Text := loFuncoes.TrataReal(edtLimiteCredito.Text);
end;

procedure TfrmIncluirCliente.BtnBuscaMunicipioClick(Sender: TObject);
begin
  inherited;
  frmMunicipios := TfrmMunicipios.Create(self);
  frmMunicipios.telaChamando := 1;
  frmMunicipios.ShowModal;
  FreeAndNil(frmMunicipios);

  if lblMunicipio.Caption <> trim('') then
    edtCodRegiao.SetFocus;
end;

procedure TfrmIncluirCliente.BtnBuscaRegiaoClick(Sender: TObject);
begin
  inherited;
  frmRegioes := TfrmRegioes.Create(self);
  frmRegioes.telaChamando := 1;
  frmRegioes.ShowModal;
  FreeAndNil(frmRegioes);

  if lblRegiao.Caption <> trim('') then
    mskFone1.SetFocus;
end;

function TfrmIncluirCliente.ExisteCliente: boolean;
var
  bRet: boolean;
begin
  bRet := False;

  with qryAux do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT nome, cpf FROM clientes');
      SQL.Add('WHERE nome = :nom OR ((cpf = :cpf) AND (cpf <> :vazio))');
      ParamByName('nom').AsString := edtNome.Text;
      ParamByName('cpf').AsString := mskCPF.Text;
      ParamByName('vazio').AsString := '   .   .   -  ';
      Open;
    end;

  cdsAux.Close;
  cdsAux.Open;

  if (cdsAux.FieldByName('nome').AsString = edtNome.Text) or ((cdsAux.FieldByName('cpf').AsString = mskCPF.Text) and (cdsAux.FieldByName('cpf').AsString <> ('   .   .   -  ')))  then
    begin
      MessageDlg('Cliente j� cadastrado no sistema!',mtWarning,[mbOk],0);
      bRet := True;
    end;

  Result := bRet;
end;

end.
