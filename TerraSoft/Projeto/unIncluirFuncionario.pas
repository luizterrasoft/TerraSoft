unit unIncluirFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls, Mask, unFuncoes;

type
  TfrmIncluirFuncionario = class(TfrmCadastros)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblUsuario: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    lblMunicipio: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    mskDataCadastro: TMaskEdit;
    mskCPF: TMaskEdit;
    edtRG: TEdit;
    edtComissao: TEdit;
    edtEndereco: TEdit;
    edtNumero: TEdit;
    edtBairro: TEdit;
    edtCodMunicipio: TEdit;
    BtnBuscaMunicipio: TBitBtn;
    mskCEP: TMaskEdit;
    mskFone1: TMaskEdit;
    mskFone2: TMaskEdit;
    mskCelular: TMaskEdit;
    edtCodUsuario: TEdit;
    Label10: TLabel;
    procedure edtCodMunicipioEnter(Sender: TObject);
    procedure edtCodMunicipioExit(Sender: TObject);
    procedure BtnBuscaMunicipioClick(Sender: TObject);
  private
    loFuncoes: TFuncoes;  

  public
    procedure limpa; override;
    procedure incluir; override;
    procedure alterar; override;
  end;

var
  frmIncluirFuncionario: TfrmIncluirFuncionario;

implementation

uses unPrincipal, unProdutos, unMunicipios;

{$R *.dfm}

{ TfrmIncluirFuncionario }

procedure TfrmIncluirFuncionario.alterar;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE funcionarios SET nome=:nom,datacadastro=:dtcad,cpf=:cpf,rg=:rg,comissaovenda=:com, ');
      Add('endereco=:end,bairro=:bai,numero=:num,fone1=:f1,fone2=:f2,celular=:cel,');
      Add('cep=:cep');

      if edtCodMunicipio.Text <> trim('') then
        Add(',codmunicipio=:muni');

      Add('WHERE codigo = :cod');
      
      ParamByName('cod').AsInteger:= StrToInt(edtCodigo.Text);
      ParamByName('nom').AsString := edtNome.Text;
      ParamByName('dtcad').AsDate := Date;
      ParamByName('cpf').AsString := mskCPF.Text;
      ParamByName('rg').AsString  := edtRG.Text;

      if (edtComissao.Text = trim('')) or (edtComissao.Text = trim('0.00')) then
        ParamByName('com').AsFloat := 0
      else
        ParamByName('com').AsFloat  := StrToFloat(edtComissao.Text);
        
      ParamByName('end').AsString := edtEndereco.Text;
      ParamByName('bai').AsString := edtBairro.Text;

      if edtCodMunicipio.Text <> trim('') then
        ParamByName('muni').AsInteger := StrToInt(edtCodMunicipio.Text);
        
      ParamByName('num').AsString := edtNumero.Text;
      ParamByName('f1').AsString := mskFone1.Text;
      ParamByName('f2').AsString := mskFone2.Text;
      ParamByName('cel').AsString:= mskCelular.Text;
      ParamByName('cep').AsString := mskCEP.Text;
      ExecSQL();
    end;
end;

procedure TfrmIncluirFuncionario.incluir;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('INSERT INTO funcionarios (nome,datacadastro,cpf,rg,comissaovenda,endereco,');
      Add('bairro,numero,fone1,fone2,celular,cep');

      if edtCodMunicipio.Text <> trim('') then
        Add(',codmunicipio');

      if frmPrincipal.iCodUsuario > 0 then
        Add(',codusuario');

      Add(')');

      Add('VALUES (:nom,:dtcad,:cpf,:rg,:com,:end,:bai,:num,:f1,:f2,:cel,:cep');

      if frmPrincipal.iCodUsuario > 0 then
        Add(',:usu');

      if edtCodMunicipio.Text <> trim('') then
        Add(',:muni');

      Add(')');

      ParamByName('nom').AsString := edtNome.Text;
      ParamByName('dtcad').AsDate := Date;
      ParamByName('cpf').AsString := mskCPF.Text;
      ParamByName('rg').AsString  := edtRG.Text;

      if edtComissao.Text = trim('') then
        ParamByName('com').AsFloat := 0
      else
        ParamByName('com').AsFloat  := StrToFloat(edtComissao.Text);
        
      ParamByName('end').AsString := edtEndereco.Text;
      ParamByName('bai').AsString := edtBairro.Text;

      if edtCodMunicipio.Text <> trim('') then
        ParamByName('muni').AsInteger := StrToInt(edtCodMunicipio.Text);
        
      ParamByName('num').AsString := edtNumero.Text;
      ParamByName('f1').AsString := mskFone1.Text;
      ParamByName('f2').AsString := mskFone2.Text;
      ParamByName('cel').AsString:= mskCelular.Text;

      if frmPrincipal.iCodUsuario > 0 then
        ParamByName('usu').AsInteger := frmPrincipal.iCodUsuario;

      ParamByName('cep').AsString := mskCEP.Text;

      ExecSQL();
    end;
end;

procedure TfrmIncluirFuncionario.limpa;
begin
  inherited;
  lblUsuario.Caption    := '';
  lblMunicipio.Caption  := '';
end;

procedure TfrmIncluirFuncionario.edtCodMunicipioEnter(Sender: TObject);
begin
  inherited;
  lblMunicipio.Caption := '';
end;

procedure TfrmIncluirFuncionario.edtCodMunicipioExit(Sender: TObject);
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
        mskCEP.SetFocus;
    end
end;

procedure TfrmIncluirFuncionario.BtnBuscaMunicipioClick(Sender: TObject);
begin
  inherited;
  frmMunicipios := TfrmMunicipios.Create(self);
  frmMunicipios.telaChamando := 3;
  frmMunicipios.ShowModal;
  FreeAndNil(frmMunicipios);

  if lblMunicipio.Caption <> trim('') then
    mskCEP.SetFocus;
end;

end.
