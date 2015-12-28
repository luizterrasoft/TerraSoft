unit unIncluirCreditosCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, unFuncoes, FMTBcd, SqlExpr,
  Provider, DB, DBClient;

type
  TfrmIncluirCreditosCliente = class(TForm)
    PnTopo: TPanel;
    Label1: TLabel;
    edtDescricao: TEdit;
    Label2: TLabel;
    edtValor: TEdit;
    Label3: TLabel;
    CbxTipo: TComboBox;
    PnBotoes: TPanel;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    dsMovimentar: TDataSource;
    cdsMovimentar: TClientDataSet;
    dspMovimentar: TDataSetProvider;
    qryMovimentar: TSQLQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
  private
    loFuncoes: TFuncoes;
  public
    cSaldoAtual: Currency;
    iCodCliente: integer;
  end;

var
  frmIncluirCreditosCliente: TfrmIncluirCreditosCliente;

implementation

uses unDM;

{$R *.dfm}

procedure TfrmIncluirCreditosCliente.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmIncluirCreditosCliente.BtnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmIncluirCreditosCliente.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmIncluirCreditosCliente.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmIncluirCreditosCliente.edtValorExit(Sender: TObject);
begin
  edtValor.Text := loFuncoes.TrataReal(edtValor.Text);
end;

procedure TfrmIncluirCreditosCliente.BtnGravarClick(Sender: TObject);
var
  cNovoSaldo: Currency;
begin
  if (edtValor.Text = trim('')) and (edtValor.Text = trim('0,00')) then
    begin
      MessageDlg('Por favor digite um valor válido!',mtWarning,[mbOk],0);
      edtValor.SetFocus;
      Exit;
    end;

  if (edtDescricao.Text = trim('')) then
    begin
      MessageDlg('Por favor digite uma descrição!',mtWarning,[mbOk],0);
      edtDescricao.SetFocus;
      Exit;
    end;

  try
    qryMovimentar.Close;
    qryMovimentar.SQL.Clear;
    qryMovimentar.SQL.Add('INSERT INTO creditoscliente');
    qryMovimentar.SQL.Add('(descricao,codcliente,saldo');

    if CbxTipo.ItemIndex = 0 then
      begin
        qryMovimentar.SQL.Add(',entrada');
        cNovoSaldo := cSaldoAtual + StrToFloat(edtValor.Text);
      end;

    if CbxTipo.ItemIndex = 1 then
      begin
        qryMovimentar.SQL.Add(',saida');
        cNovoSaldo := cSaldoAtual - StrToFloat(edtValor.Text);
      end;

    qryMovimentar.SQL.Add(')');

    qryMovimentar.SQL.Add('VALUES (:desc,:codc,:sald');

    if CbxTipo.ItemIndex = 0 then
      qryMovimentar.SQL.Add(',:ent');

    if CbxTipo.ItemIndex = 1 then
      qryMovimentar.SQL.Add(',:sai');

    qryMovimentar.SQL.Add(')');

    qryMovimentar.ParamByName('desc').AsString := edtDescricao.Text;
    qryMovimentar.ParamByName('codc').AsInteger:= iCodCliente;
    qryMovimentar.ParamByName('sald').AsFloat  := cNovoSaldo;

    if CbxTipo.ItemIndex = 0 then
      qryMovimentar.ParamByName('ent').AsFloat := StrToFloat(edtValor.Text);

    if CbxTipo.ItemIndex = 1 then
      qryMovimentar.ParamByName('sai').AsFloat := StrToFloat(edtValor.Text);

    qryMovimentar.Prepared := True;
    qryMovimentar.ExecSQL();
    Self.Close;
  except
    on e: Exception do
    raise Exception.Create('Não foi possível movimentar os créditos do cliente!' + #13 + e.Message);
  end;
end;

end.
