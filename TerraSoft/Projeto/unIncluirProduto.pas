unit unIncluirProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls, Mask, unFuncoes;

type
  TfrmIncluirProduto = class(TfrmCadastros)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtUnidade: TEdit;
    edtEstoque: TEdit;
    edtEstoqueInicial: TEdit;
    edtPrecoCusto: TEdit;
    edtReferencia: TEdit;
    mskDataCadastro: TMaskEdit;
    mskUltimaCompra: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure edtEstoqueInicialExit(Sender: TObject);
    procedure edtPrecoCustoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

    loFuncoes: TFuncoes;
    function ExisteProduto: boolean;

  public
    procedure incluir; override;
    procedure alterar; override;
  end;

var
  frmIncluirProduto: TfrmIncluirProduto;

implementation

uses unPrincipal, unDM;

{$R *.dfm}

{ TfrmIncluirProduto }

procedure TfrmIncluirProduto.alterar;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE produtos SET descricao=:desc,unidade=:un,referencia=:ref,precocusto=:pc');
      Add('WHERE codigo = :cod');
      ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
      ParamByName('desc').AsString := edtDescricao.Text;
      ParamByName('un').AsString   := edtUnidade.Text;
      ParamByName('ref').AsString  := edtReferencia.Text;

      if edtPrecoCusto.Text = trim('') then
        ParamByName('pc').AsFloat    := 0
      else
        ParamByName('pc').AsFloat    := StrToFloat(edtPrecoCusto.Text);

      ExecSQL();
    end;
end;

procedure TfrmIncluirProduto.incluir;
begin
  inherited;

  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('INSERT INTO produtos (descricao,unidade,datacadastro,referencia,precocusto,estoqueinicial,');
      Add('estoque)');
      Add('VALUES (:desc,:un,:dtcad,:ref,:pc,:ei,:e)');
      ParamByName('desc').AsString := edtDescricao.Text;
      ParamByName('un').AsString   := edtUnidade.Text;
      ParamByName('dtcad').AsDate  := Date;
      ParamByName('ref').AsString  := edtReferencia.Text;

      if (edtPrecoCusto.Text = trim('')) or (edtPrecoCusto.Text = trim('0')) then
        ParamByName('pc').AsFloat := 0
      else
        ParamByName('pc').AsFloat := StrToFloat(edtPrecoCusto.Text);

      if (edtEstoqueInicial.Text = trim('')) or (edtEstoqueInicial.Text = trim('0')) then
        ParamByName('ei').AsFloat := 0
      else
        ParamByName('ei').AsFloat := StrToFloat(edtEstoqueInicial.Text);

      if (edtEstoque.Text = trim('')) or (edtEstoque.Text = trim('0')) then
        ParamByName('e').AsFloat := 0
      else
        ParamByName('e').AsFloat := StrToFloat(edtEstoque.Text);

      ExecSQL();
    end;
end;

procedure TfrmIncluirProduto.FormShow(Sender: TObject);
begin
  inherited;

  if frmPrincipal.iOperacao = 2 then
    begin
      edtEstoqueInicial.Enabled := False;
    end;
end;

procedure TfrmIncluirProduto.edtEstoqueInicialExit(Sender: TObject);
begin
  inherited;
  edtEstoque.Text := edtEstoqueInicial.Text;
end;

procedure TfrmIncluirProduto.edtPrecoCustoExit(Sender: TObject);
begin
  inherited;
  if (edtPrecoCusto.Text <> trim('')) and (edtPrecoCusto.Text <> trim('0')) then
    edtPrecoCusto.Text := loFuncoes.TrataReal(edtPrecoCusto.Text);
end;

procedure TfrmIncluirProduto.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmIncluirProduto.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

function TfrmIncluirProduto.ExisteProduto: boolean;
var
  bRet: boolean;
begin
  bRet := False;

  with qryAux do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT descricao FROM produtos');
      SQL.Add('WHERE descricao = :desc');
      ParamByName('desc').AsString := edtDescricao.Text;
      Open;
    end;

  cdsAux.Close;
  cdsAux.Open;

  if cdsAux.RecordCount > 0 then
    begin
      MessageDlg('Produto já cadastrado no sistema!',mtWarning,[mbOk],0);
      bRet := True;
    end;

  Result := bRet;
end;

end.
