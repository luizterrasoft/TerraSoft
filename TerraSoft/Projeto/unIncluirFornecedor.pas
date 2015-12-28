unit unIncluirFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls, Mask, unFuncoes;

type
  TfrmIncluirFornecedor = class(TfrmCadastros)
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
    lblMunicipio: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    lblUsuario: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edtCodigo: TEdit;
    CbxTipoPessoa: TComboBox;
    edtRazaoSocial: TEdit;
    mskDataCadastro: TMaskEdit;
    edtFantasia: TEdit;
    edtIE: TEdit;
    mskCNPJ: TMaskEdit;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    edtNumero: TEdit;
    edtCodMunicipio: TEdit;
    edtRepresentante: TEdit;
    mskFone1: TMaskEdit;
    mskFone2: TMaskEdit;
    mskCelular: TMaskEdit;
    mskUltimaCompra: TMaskEdit;
    edtCodUsuario: TEdit;
    BtnBuscaMunicipio: TBitBtn;
    procedure CbxTipoPessoaExit(Sender: TObject);
    procedure edtCodMunicipioEnter(Sender: TObject);
    procedure edtCodMunicipioExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnBuscaMunicipioClick(Sender: TObject);
    procedure mskCelularExit(Sender: TObject);
  private

    loFuncoes: TFuncoes;
    function ExisteFornecedor: boolean;
    procedure TipoPessoa;
    procedure limpa; override;
    procedure incluir; override;
    procedure alterar; override;
  public
    { Public declarations }
  end;

var
  frmIncluirFornecedor: TfrmIncluirFornecedor;

implementation

uses unMunicipios, unDM, unPrincipal;

{$R *.dfm}

{ TfrmIncluirFornecedor }

function TfrmIncluirFornecedor.ExisteFornecedor: boolean;
var
  bRet: boolean;
begin
  bRet := False;

  with qryAux do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT razaosocial FROM fornecedores');
      SQL.Add('WHERE (razaosocial = :rs AND razaosocial <> :vazio)');
      SQL.Add('OR (fantasia = :fanta AND fantasia <> :vazio) ');
      ParamByName('rs').AsString    := edtRazaoSocial.Text;
      ParamByName('fanta').AsString := edtFantasia.Text;
      ParamByName('vazio').AsString := '';
      Open;
    end;

  cdsAux.Close;
  cdsAux.Open;

  if cdsAux.RecordCount > 0 then
    begin
      MessageDlg('Fornecedor j� cadastrado no sistema!',mtWarning,[mbOk],0);
      bRet := True;
    end;

  Result := bRet;
end;

procedure TfrmIncluirFornecedor.alterar;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE fornecedores SET razaosocial=:raz,fantasia=:fanta,ie=:ie,cnpj=:cnpj,tipopessoa=:tp,');
      Add('endereco=:ende,bairro=:bai,numero=:num,codusuario=:usu,');
      Add('fone1=:fone1,fone2=:fone2,celular=:cel,representante=:rep');

      if edtCodMunicipio.Text <> trim('') then
        Add(',codmunicipio=:muni');

      Add('WHERE codigo = :cod');
      ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
      ParamByName('raz').AsString  := edtRazaoSocial.Text;
      ParamByName('fanta').AsString:= edtFantasia.Text;
      ParamByName('ie').AsString   := edtIE.Text;
      ParamByName('cnpj').AsString := mskCNPJ.Text;

      if CbxTipoPessoa.ItemIndex = 0 then
        ParamByName('tp').AsString := 'J'
      else
        ParamByName('tp').AsString := 'F';

      ParamByName('ende').AsString := edtEndereco.Text;
      ParamByName('bai').AsString  := edtBairro.Text;

      if edtCodMunicipio.Text <> trim('') then
        ParamByName('muni').AsInteger:= StrToInt(edtCodMunicipio.Text);
        
      ParamByName('num').AsString  := edtNumero.Text;
      ParamByName('usu').AsInteger := 1;
      ParamByName('fone1').AsString:= mskFone1.Text;
      ParamByName('fone2').AsString:= mskFone2.Text;
      ParamByName('cel').AsString  := mskCelular.Text;
      ParamByName('rep').AsString  := edtRepresentante.Text;
      ExecSQL();
    end;
end;

procedure TfrmIncluirFornecedor.incluir;
begin
  inherited;

  if ExisteFornecedor = true then
    Exit;

  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('INSERT INTO fornecedores (razaosocial,fantasia,ie,cnpj,tipopessoa,endereco,');
      Add('bairro,numero,fone1,fone2,celular,representante');

      if edtCodMunicipio.Text <> trim('') then
        Add(',codmunicipio');

      if frmPrincipal.iCodUsuario > 0 then
        Add(',codusuario');

      Add(')');

      Add('VALUES (:raz,:fanta,:ie,:cnpj,:tp,:ende,:bai,:num,:fone1,:fone2,:cel,');
      Add(':rep');

      if edtCodMunicipio.Text <> trim('') then
        Add(',:muni');

      if frmPrincipal.iCodUsuario > 0 then
        Add(',:usu');

      Add(')'); 

      ParamByName('raz').AsString  := edtRazaoSocial.Text;
      ParamByName('fanta').AsString:= edtFantasia.Text;
      ParamByName('ie').AsString   := edtIE.Text;
      ParamByName('cnpj').AsString := mskCNPJ.Text;

      if CbxTipoPessoa.ItemIndex = 0 then
        ParamByName('tp').AsString := 'J'
      else
        ParamByName('tp').AsString := 'F';

      ParamByName('ende').AsString := edtEndereco.Text;
      ParamByName('bai').AsString  := edtBairro.Text;

      if edtCodMunicipio.Text <> trim('') then
        ParamByName('muni').AsInteger:= StrToInt(edtCodMunicipio.Text);

      ParamByName('num').AsString  := edtNumero.Text;

      if frmPrincipal.iCodUsuario > 0 then
        ParamByName('usu').AsInteger := frmPrincipal.iCodUsuario;
        
      ParamByName('fone1').AsString:= mskFone1.Text;
      ParamByName('fone2').AsString:= mskFone2.Text;
      ParamByName('cel').AsString  := mskCelular.Text;
      ParamByName('rep').AsString  := edtRepresentante.Text;
      ExecSQL();
    end;
end;

procedure TfrmIncluirFornecedor.limpa;
begin
  inherited;
  lblMunicipio.Caption := '';
  lblUsuario.Caption   := '';
end;

procedure TfrmIncluirFornecedor.TipoPessoa;
begin
  if CbxTipoPessoa.ItemIndex = 0 then
    begin
      Label2.Caption := 'Raz�o Social';
      Label5.Caption := 'Fantasia';
      Label7.Caption := 'I.E.';
      Label6.Caption := 'CNPJ';
      mskCNPJ.EditMask := '99.999.999/9999-99;1;_';
    end
  else
  if CbxTipoPessoa.ItemIndex = 1 then
    begin
      Label2.Caption := 'Nome';
      Label5.Caption := 'Apelido';
      Label7.Caption := 'R.G.';
      Label6.Caption := 'CPF';
      mskCNPJ.EditMask := '999.999.999-99;1;_';
    end;
end;

procedure TfrmIncluirFornecedor.CbxTipoPessoaExit(Sender: TObject);
begin
  inherited;
  TipoPessoa;
end;

procedure TfrmIncluirFornecedor.edtCodMunicipioEnter(Sender: TObject);
begin
  inherited;
  lblMunicipio.Caption := '';
end;

procedure TfrmIncluirFornecedor.edtCodMunicipioExit(Sender: TObject);
begin
  inherited;
  if edtCodMunicipio.Text <> trim('') then
    begin
      lblMunicipio.Caption := loFuncoes.BuscaFk(edtCodMunicipio.Text,'municipios','nome');

      if lblMunicipio.Caption = trim('') then
        begin
          edtCodMunicipio.Clear;
          BtnBuscaMunicipio.SetFocus;
        end;
    end;
end;

procedure TfrmIncluirFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmIncluirFornecedor.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmIncluirFornecedor.BtnBuscaMunicipioClick(Sender: TObject);
begin
  inherited;
  frmMunicipios := TfrmMunicipios.Create(self);
  frmMunicipios.telaChamando := 2;
  frmMunicipios.ShowModal;
  FreeAndNil(frmMunicipios);

  if lblMunicipio.Caption <> trim('') then
    edtRepresentante.SetFocus;
end;

procedure TfrmIncluirFornecedor.mskCelularExit(Sender: TObject);
begin
  inherited;
  BtnGravar.SetFocus;
end;

end.
