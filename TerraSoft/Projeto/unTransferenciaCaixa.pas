unit unTransferenciaCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, unFuncoes, FMTBcd, SqlExpr,
  Provider, DB, DBClient;

type
  TfrmTransferenciaCaixa = class(TForm)
    PnTopo: TPanel;
    PnDados: TPanel;
    PnBotoes: TPanel;
    Label1: TLabel;
    edtContaOrigem: TEdit;
    BtnBuscaContaOrigem: TBitBtn;
    lblContaOrigem: TLabel;
    Label2: TLabel;
    edtContaDestino: TEdit;
    BtnBuscaContaDestino: TBitBtn;
    lblContaDestino: TLabel;
    Label3: TLabel;
    edtValorTransferencia: TEdit;
    Label4: TLabel;
    edtDescricao: TEdit;
    BtnConfirmar: TBitBtn;
    BtnCancelar: TBitBtn;
    dsTransferencia: TDataSource;
    cdsTransferencia: TClientDataSet;
    dspTransferencia: TDataSetProvider;
    qryTransferencia: TSQLQuery;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtValorTransferenciaExit(Sender: TObject);
    procedure BtnBuscaContaOrigemClick(Sender: TObject);
    procedure BtnBuscaContaDestinoClick(Sender: TObject);
    procedure edtContaOrigemExit(Sender: TObject);
    procedure edtContaDestinoExit(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    loFuncoes: TFuncoes;
    function VerificaSaldoOrigem: boolean; // verifica se na conta de origem tem saldo suficiente
    function BaixarSaldoOrigem: boolean; // debita da conta de origem
    function AcrescentarSaldoDestino: boolean; // creditar na conta de destino
  public
    { Public declarations }
  end;

var
  frmTransferenciaCaixa: TfrmTransferenciaCaixa;

implementation

uses unContas, unDM;

{$R *.dfm}

procedure TfrmTransferenciaCaixa.BtnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmTransferenciaCaixa.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    BtnCancelarClick(self);
end;

procedure TfrmTransferenciaCaixa.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmTransferenciaCaixa.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmTransferenciaCaixa.edtValorTransferenciaExit(
  Sender: TObject);
begin
  edtValorTransferencia.Text := loFuncoes.TrataReal(edtValorTransferencia.Text);
  edtDescricao.Text := 'Transf. Origem: '+ lblContaOrigem.Caption + ' para '+ lblContaDestino.Caption;
end;

procedure TfrmTransferenciaCaixa.BtnBuscaContaOrigemClick(Sender: TObject);
begin
  frmContas := TfrmContas.Create(self);
  frmContas.telaChamando := 6;
  frmContas.ShowModal;
  FreeAndNil(frmContas);

  if lblContaOrigem.Caption <> trim('') then
    edtContaDestino.SetFocus;
end;

procedure TfrmTransferenciaCaixa.BtnBuscaContaDestinoClick(
  Sender: TObject);
begin
  frmContas := TfrmContas.Create(self);
  frmContas.telaChamando := 7;
  frmContas.ShowModal;
  FreeAndNil(frmContas);

  if lblContaDestino.Caption <> trim('') then
    edtValorTransferencia.SetFocus;
end;

procedure TfrmTransferenciaCaixa.edtContaOrigemExit(Sender: TObject);
begin
  if edtContaOrigem.Text <> trim('') then
    begin
      lblContaOrigem.Caption := loFuncoes.BuscaFk(edtContaOrigem.Text,'contas','descricao');

      if lblContaOrigem.Caption = trim('') then
        begin
          edtContaOrigem.Clear;
          BtnBuscaContaOrigem.SetFocus;
        end
      else
        edtContaDestino.SetFocus;
    end;
end;

procedure TfrmTransferenciaCaixa.edtContaDestinoExit(Sender: TObject);
begin
  if edtContaDestino.Text <> trim('') then
    begin
      lblContaDestino.Caption := loFuncoes.BuscaFk(edtContaDestino.Text,'contas','descricao');

      if lblContaDestino.Caption = trim('') then
        begin
          edtContaDestino.Clear;
          BtnBuscaContaDestino.SetFocus;
        end
      else
        edtValorTransferencia.SetFocus;
    end;
end;

function TfrmTransferenciaCaixa.VerificaSaldoOrigem: boolean;
var
  rEntradas, rSaidas, rSaldo: Real;
begin
  Result := False;

  try
    qryTransferencia.Close;
    qryTransferencia.SQL.Clear;
    qryTransferencia.SQL.Add('SELECT SUM(valor) AS entradas');
    qryTransferencia.SQL.Add('FROM caixa');
    qryTransferencia.SQL.Add('WHERE codconta = :con');
    qryTransferencia.SQL.Add('AND tipo = :tip');
    qryTransferencia.ParamByName('con').AsInteger := StrToInt(edtContaOrigem.Text);
    qryTransferencia.ParamByName('tip').AsString  := 'C';
    qryTransferencia.Open;
    cdsTransferencia.Close;
    cdsTransferencia.Open;
    rEntradas := cdsTransferencia.FieldByName('entradas').AsFloat;

    qryTransferencia.Close;
    qryTransferencia.SQL.Clear;
    qryTransferencia.SQL.Add('SELECT SUM(valor) AS saidas');
    qryTransferencia.SQL.Add('FROM caixa');
    qryTransferencia.SQL.Add('WHERE codconta = :con');
    qryTransferencia.SQL.Add('AND tipo = :tip');
    qryTransferencia.ParamByName('con').AsInteger := StrToInt(edtContaOrigem.Text);
    qryTransferencia.ParamByName('tip').AsString  := 'D';
    qryTransferencia.Open;
    cdsTransferencia.Close;
    cdsTransferencia.Open;
    rSaidas := cdsTransferencia.FieldByName('saidas').AsFloat;

    rSaldo := rEntradas - rSaidas;

    if rSaldo >= StrToFloat(edtValorTransferencia.Text) then
      Result := True
    else
      MessageDlg('Conta de origem sem saldo suficiente para transfer�ncia!',mtWarning,[mbOk],0);
  except
    MessageDlg('Erro ao verificar saldo da conta de origem!',mtError,[mbOk],0);
    Result := False;
  end;
end;

procedure TfrmTransferenciaCaixa.BtnConfirmarClick(Sender: TObject);
begin
  if VerificaSaldoOrigem then
    begin
      if BaixarSaldoOrigem then
        if AcrescentarSaldoDestino then
          Self.Close;
    end;
end;

function TfrmTransferenciaCaixa.AcrescentarSaldoDestino: boolean;
begin

  Result := True;

  try
    qryTransferencia.Close;
    qryTransferencia.SQL.Clear;
    qryTransferencia.SQL.Add('INSERT INTO caixa');
    qryTransferencia.SQL.Add('(codconta,valor,descricao,data,tipo)');
    qryTransferencia.SQL.Add('VALUES (:con,:vlr,:des,:dat,:tip)');
    qryTransferencia.ParamByName('con').AsInteger := StrToInt(edtContaDestino.Text);
    qryTransferencia.ParamByName('vlr').AsFloat   := StrToFloat(edtValorTransferencia.Text);
    qryTransferencia.ParamByName('des').AsString  := edtDescricao.Text;
    qryTransferencia.ParamByName('dat').AsDate    := Date;
    qryTransferencia.ParamByName('tip').AsString  := 'C';
    qryTransferencia.ExecSQL();
  except
    MessageDlg('N�o foi poss�vel creditar o valor na conta de destino, processo ser� finalizado!',mtError,[mbOk],0);
    Result := False;
  end;
end;

function TfrmTransferenciaCaixa.BaixarSaldoOrigem: boolean;
begin

  Result := True;
  try
    qryTransferencia.Close;
    qryTransferencia.SQL.Clear;
    qryTransferencia.SQL.Add('INSERT INTO caixa');
    qryTransferencia.SQL.Add('(codconta,valor,descricao,data,tipo)');
    qryTransferencia.SQL.Add('VALUES (:con,:vlr,:des,:dat,:tip)');
    qryTransferencia.ParamByName('con').AsInteger := StrToInt(edtContaOrigem.Text);
    qryTransferencia.ParamByName('vlr').AsFloat   := StrToFloat(edtValorTransferencia.Text);
    qryTransferencia.ParamByName('des').AsString  := edtDescricao.Text;
    qryTransferencia.ParamByName('dat').AsDate    := Date;
    qryTransferencia.ParamByName('tip').AsString  := 'D';
    qryTransferencia.ExecSQL();
  except
    MessageDlg('N�o foi poss�vel debitar o valor da conta de origem, processo ser� finalizado!',mtError,[mbOk],0);
    Result := False;
  end;
end;

procedure TfrmTransferenciaCaixa.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

end.
