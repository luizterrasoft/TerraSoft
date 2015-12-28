unit unIncluirEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls, Mask, unFuncoes;

type
  TfrmIncluirEmpresa = class(TfrmCadastros)
    edtCodigo: TEdit;
    edtRazaoSocial: TEdit;
    edtFantasia: TEdit;
    edtIE: TEdit;
    edtEndereco: TEdit;
    edtCodMunicipio: TEdit;
    edtBairro: TEdit;
    edtNumero: TEdit;
    edtComplemento: TEdit;
    edtEmail: TEdit;
    edtwebSite: TEdit;
    edtAliquotaSimples: TEdit;
    mskCNPJ: TMaskEdit;
    mskFone1: TMaskEdit;
    mskFone2: TMaskEdit;
    mskCelular: TMaskEdit;
    CbxTipoEmpresa: TComboBox;
    lblMunicipio: TLabel;
    BtnBuscaMunicipio: TBitBtn;
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
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtAliquotaSimplesExit(Sender: TObject);
    procedure BtnBuscaMunicipioClick(Sender: TObject);
    procedure edtCodMunicipioEnter(Sender: TObject);
    procedure edtCodMunicipioExit(Sender: TObject);
  private
    loFuncoes: TFuncoes;

    procedure incluir; override;
    procedure alterar; override;
  public
    { Public declarations }
  end;

var
  frmIncluirEmpresa: TfrmIncluirEmpresa;

implementation

uses unMunicipios;

{$R *.dfm}

procedure TfrmIncluirEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmIncluirEmpresa.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmIncluirEmpresa.edtAliquotaSimplesExit(Sender: TObject);
begin
  inherited;
  edtAliquotaSimples.Text := loFuncoes.TrataReal(edtAliquotaSimples.Text);
end;

procedure TfrmIncluirEmpresa.alterar;
begin
  inherited;
  try
    qryPadrao.Close;
    qryPadrao.SQL.Clear;
    qryPadrao.SQL.Add('UPDATE empresas SET razaosocial = :rz, fantasia = :fa, cnpj = :cn, ie = :ie,');
    qryPadrao.SQL.Add('endereco = :en, bairro = :ba, numero = :nu, complemento = :co, fone1 = :f1, fone2 = :f2,');
    qryPadrao.SQL.Add('celular = :ce, email = :em, website = :ws');

    if edtCodMunicipio.Text <> trim('') then
      qryPadrao.SQL.Add(',codmunicipio = :cm');

    if CbxTipoEmpresa.ItemIndex > 0 then
      qryPadrao.SQL.Add(',tipoempresa = :te');

    if edtAliquotaSimples.Text <> trim('0,00') then
      qryPadrao.SQL.Add(',aliquotasimples = :as');

    qryPadrao.SQL.Add('WHERE codigo = :cod');

    qryPadrao.ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
    qryPadrao.ParamByName('rz').AsString := edtRazaoSocial.Text;
    qryPadrao.ParamByName('fa').AsString := edtFantasia.Text;
    qryPadrao.ParamByName('cn').AsString := mskCNPJ.Text;
    qryPadrao.ParamByName('ie').AsString := edtIE.Text;
    qryPadrao.ParamByName('en').AsString := edtEndereco.Text;
    qryPadrao.ParamByName('ba').AsString := edtBairro.Text;
    qryPadrao.ParamByName('nu').AsString := edtNumero.Text;
    qryPadrao.ParamByName('co').AsString := edtComplemento.Text;
    qryPadrao.ParamByName('f1').AsString := mskFone1.Text;
    qryPadrao.ParamByName('f2').AsString := mskFone2.Text;
    qryPadrao.ParamByName('ce').AsString := mskCelular.Text;
    qryPadrao.ParamByName('em').AsString := edtEmail.Text;
    qryPadrao.ParamByName('ws').AsString := edtwebSite.Text;

    if edtCodMunicipio.Text <> trim('') then
      qryPadrao.ParamByName('cm').AsInteger := StrToInt(edtCodMunicipio.Text);

    if CbxTipoEmpresa.ItemIndex > 0 then
      qryPadrao.ParamByName('te').AsInteger := CbxTipoEmpresa.ItemIndex;

    if edtAliquotaSimples.Text <> trim('0,00') then
      qryPadrao.ParamByName('as').AsFloat := StrToFloat(edtAliquotaSimples.Text);

    qryPadrao.Prepared := True;
    qryPadrao.ExecSQL();
  except
    MessageDlg('Erro ao alterar a empresa!',mtError,[mbOk],0);
  end;
end;

procedure TfrmIncluirEmpresa.incluir;
begin
  inherited;
  try
    qryPadrao.Close;
    qryPadrao.SQL.Clear;
    qryPadrao.SQL.Add('INSERT INTO empresas');
    qryPadrao.SQL.Add('(razaosocial,fantasia,cnpj,ie,endereco,bairro,numero,');
    qryPadrao.SQL.Add('complemento,fone1,fone2,celular,email,website');

    if edtCodMunicipio.Text <> trim('') then
      qryPadrao.SQL.Add(',codmunicipio');

    if CbxTipoEmpresa.ItemIndex > 0 then
      qryPadrao.SQL.Add(',tipoempresa');

    if edtAliquotaSimples.Text <> trim('0,00') then
      qryPadrao.SQL.Add(',aliquotasimples');

    qryPadrao.SQL.Add(')');

    qryPadrao.SQL.Add('VALUES');
    qryPadrao.SQL.Add('(:rz,:fa,:cn,:ie,:en,:ba,:nu,:co,:f1,:f2,:ce,:em,:ws');

    if edtCodMunicipio.Text <> trim('') then
      qryPadrao.SQL.Add(',:cm');

    if CbxTipoEmpresa.ItemIndex > 0 then
      qryPadrao.SQL.Add(',:te');

    if edtAliquotaSimples.Text <> trim('0,00') then
      qryPadrao.SQL.Add(',:as');

    qryPadrao.SQL.Add(')');

    qryPadrao.ParamByName('rz').AsString := edtRazaoSocial.Text;
    qryPadrao.ParamByName('fa').AsString := edtFantasia.Text;
    qryPadrao.ParamByName('cn').AsString := mskCNPJ.Text;
    qryPadrao.ParamByName('ie').AsString := edtIE.Text;
    qryPadrao.ParamByName('en').AsString := edtEndereco.Text;
    qryPadrao.ParamByName('ba').AsString := edtBairro.Text;
    qryPadrao.ParamByName('nu').AsString := edtNumero.Text;
    qryPadrao.ParamByName('co').AsString := edtComplemento.Text;
    qryPadrao.ParamByName('f1').AsString := mskFone1.Text;
    qryPadrao.ParamByName('f2').AsString := mskFone2.Text;
    qryPadrao.ParamByName('ce').AsString := mskCelular.Text;
    qryPadrao.ParamByName('em').AsString := edtEmail.Text;
    qryPadrao.ParamByName('ws').AsString := edtwebSite.Text;

    if edtCodMunicipio.Text <> trim('') then
      qryPadrao.ParamByName('cm').AsInteger := StrToInt(edtCodMunicipio.Text);

    if CbxTipoEmpresa.ItemIndex > 0 then
      qryPadrao.ParamByName('te').AsInteger := CbxTipoEmpresa.ItemIndex;

    if edtAliquotaSimples.Text <> trim('0,00') then
      qryPadrao.ParamByName('as').AsFloat := StrToFloat(edtAliquotaSimples.Text);

    qryPadrao.Prepared := True;
    qryPadrao.ExecSQL();
  except
    MessageDlg('Erro ao incluir empresa!',mtError,[mbOk],0);
  end;
end;

procedure TfrmIncluirEmpresa.BtnBuscaMunicipioClick(Sender: TObject);
begin
  inherited;
  frmMunicipios := TfrmMunicipios.Create(self);
  frmMunicipios.telaChamando := 4;
  frmMunicipios.ShowModal;
  FreeAndNil(frmMunicipios);

  if lblMunicipio.Caption <> trim('') then
    edtEmail.SetFocus;
end;

procedure TfrmIncluirEmpresa.edtCodMunicipioEnter(Sender: TObject);
begin
  inherited;
  lblMunicipio.Caption := '';  
end;

procedure TfrmIncluirEmpresa.edtCodMunicipioExit(Sender: TObject);
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
        edtEmail.SetFocus;
    end;
end;

end.
