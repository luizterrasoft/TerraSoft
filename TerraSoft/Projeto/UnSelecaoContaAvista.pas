unit UnSelecaoContaAvista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FMTBcd, SqlExpr, Provider, DB,
  DBClient, unFuncoes;

type
  TfrmSelecaoContaAvista = class(TForm)
    PnDados: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtCodConta: TEdit;
    BtnBuscaConta: TBitBtn;
    lblConta: TLabel;
    BtnConfirmar: TBitBtn;
    dsAux: TDataSource;
    cdsAux: TClientDataSet;
    dspAux: TDataSetProvider;
    qryAux: TSQLQuery;
    procedure edtCodContaExit(Sender: TObject);
    procedure edtCodContaEnter(Sender: TObject);
    procedure BtnBuscaContaClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

    loFuncoes: TFuncoes;
  public
     tela: integer; // 1 - faturamento os, 2 - faturamento manu
  end;

var
  frmSelecaoContaAvista: TfrmSelecaoContaAvista;

implementation

uses unDM, unContas, unFaturamentoOS, unFaturamentoManu, unRenegociarCP,
  unRenegociarCR, unPrincipal;

{$R *.dfm}

procedure TfrmSelecaoContaAvista.edtCodContaExit(Sender: TObject);
begin
  if edtCodConta.Text <> trim('') then
    begin
      lblConta.Caption := loFuncoes.BuscaFk(edtCodConta.Text,'contas','descricao');

      if lblConta.Caption = trim('') then
        begin
          edtCodConta.Clear;
          BtnBuscaConta.SetFocus;
        end
      else
        BtnConfirmar.SetFocus;
    end;
end;

procedure TfrmSelecaoContaAvista.edtCodContaEnter(Sender: TObject);
begin
  lblConta.Caption := '';
end;

procedure TfrmSelecaoContaAvista.BtnBuscaContaClick(Sender: TObject);
begin
  frmContas := TfrmContas.Create(self);
  frmContas.telaChamando := 4;
  frmContas.ShowModal;
  FreeAndNil(frmContas);

  if lblConta.Caption <> trim('') then
    BtnConfirmar.SetFocus;
end;

procedure TfrmSelecaoContaAvista.BtnConfirmarClick(Sender: TObject);
begin
  if tela = 1 then
    frmFaturamentoOS.codConta := StrToInt(edtCodConta.Text)
  else
  if tela = 2 then
    frmFaturamentoManu.codConta := StrToInt(edtCodConta.Text)
  else
  if tela = 3 then
    frmRenegociarCP.codConta := StrToInt(edtCodConta.Text)
  else
  if tela = 4 then
    frmRenegociarCR.codConta := StrToInt(edtCodConta.Text);

  Self.Close;
end;

procedure TfrmSelecaoContaAvista.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmSelecaoContaAvista.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

end.
