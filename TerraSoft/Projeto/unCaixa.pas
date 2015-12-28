unit unCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, Grids, DBGrids, FMTBcd,
  SqlExpr, DB, Provider, DBClient, unFuncoes;

type
  TfrmCaixa = class(TForm)
    PnTopo: TPanel;
    PnCaixa: TPanel;
    PnRodape: TPanel;
    Label1: TLabel;
    mskData: TMaskEdit;
    Label2: TLabel;
    edtCodConta: TEdit;
    BtnBuscaConta: TBitBtn;
    lblConta: TLabel;
    BtnIncluir: TBitBtn;
    BtnImprimir: TBitBtn;
    BtnSair: TBitBtn;
    GrdCaixa: TDBGrid;
    cdsCaixa: TClientDataSet;
    dspCaixa: TDataSetProvider;
    dsCaixa: TDataSource;
    qryCaixa: TSQLQuery;
    dsAux: TDataSource;
    cdsAux: TClientDataSet;
    dspAux: TDataSetProvider;
    qryAux: TSQLQuery;
    Label4: TLabel;
    Label5: TLabel;
    lblEntradas: TLabel;
    lblSaidas: TLabel;
    lblSaldoDiario: TLabel;
    Label9: TLabel;
    BtnAbertura: TBitBtn;
    BtnFechamento: TBitBtn;
    dsCaixaPrincipal: TDataSource;
    cdsCaixaPrincipal: TClientDataSet;
    dspCaixaPrincipal: TDataSetProvider;
    qryCaixaPrincipal: TSQLQuery;
    BtnTransferencia: TBitBtn;
    lblStatus: TLabel;
    Label8: TLabel;
    mskFinal: TMaskEdit;
    Label3: TLabel;
    lblSaldoGeral: TLabel;
    Label6: TLabel;
    lblSaldoTotal: TLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure edtCodContaExit(Sender: TObject);
    procedure BtnBuscaContaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnImprimirClick(Sender: TObject);
    procedure BtnAberturaClick(Sender: TObject);
    procedure BtnFechamentoClick(Sender: TObject);
    procedure mskFinalExit(Sender: TObject);
    procedure GrdCaixaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdCaixaTitleClick(Column: TColumn);
    procedure BtnTransferenciaClick(Sender: TObject);
  private
    loFuncoes: TFuncoes;


    procedure pFechaCaixa(iCodCaixa: integer);
    procedure pAbreCaixa;
    procedure CalculaTotais;
    procedure mostraCaixa;

  public
    { Public declarations }
  end;

var
  frmCaixa: TfrmCaixa;

implementation

uses unDM, unIncluirCaixa, unContas, unRelCaixa, unPrincipal,
  unTransferenciaCaixa;

{$R *.dfm}

procedure TfrmCaixa.BtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;

end;

procedure TfrmCaixa.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmCaixa.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmCaixa.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  mskData.Text := DateToStr(Date);
  mskFinal.Text:= DateToStr(Date);

  edtCodConta.Text := '1';
  lblConta.Caption := loFuncoes.BuscaFk(edtCodConta.Text,'contas','descricao');

  mostraCaixa;

  GrdCaixa.SetFocus;
end;

procedure TfrmCaixa.mostraCaixa;
begin
  try
    with qryCaixa, SQL do
      begin
        Close;
        Clear;
        Add('SELECT cx.*, con.descricao AS CONTA');
        Add('FROM caixa cx');
        Add('INNER JOIN contas con');
        Add('ON con.codigo = cx.codconta');
        Add('WHERE cx.data BETWEEN :dtini AND :dtfin');
        Add('AND cx.codconta = :con');
        Add('ORDER BY '+ frmPrincipal.sCampo);
        ParamByName('dtini').AsDate := StrToDate(mskData.Text);
        ParamByName('dtfin').AsDate := StrToDate(mskFinal.Text);
        ParamByName('con').AsInteger:= StrToInt(edtCodConta.Text);
        Open;
        cdsCaixa.Close;
        cdsCaixa.Open;
      end;
  except
    MessageDlg('Erro ao buscar os lançamentos do caixa!',mtWarning,[mbOk],0);
  end;

  TNumericField(cdsCaixa.FieldByName('valor')).DisplayFormat := ',0.00;-,0.00';

  CalculaTotais;
end;

procedure TfrmCaixa.BtnIncluirClick(Sender: TObject);
begin
  frmIncluirCaixa := TfrmIncluirCaixa.Create(self);
  frmIncluirCaixa.edtCodConta.Text := edtCodConta.Text;
  frmIncluirCaixa.lblConta.Caption := lblConta.Caption;
  frmIncluirCaixa.mskData.Text     := mskData.Text;
  frmIncluirCaixa.ShowModal;
  FreeAndNil(frmIncluirCaixa);

  mostraCaixa;
end;

procedure TfrmCaixa.edtCodContaExit(Sender: TObject);
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
        mskData.SetFocus;
    end;
end;

procedure TfrmCaixa.BtnBuscaContaClick(Sender: TObject);
begin
  frmContas := TfrmContas.Create(self);
  frmContas.telaChamando := 2;
  frmContas.ShowModal;
  FreeAndNil(frmContas);

  if lblConta.Caption <> trim('') then
    mskData.SetFocus;
end;

procedure TfrmCaixa.CalculaTotais;
var
  entradas, saidas, saldo, SaldoGeral, SaidasGeral, EntradasGeral: Real;
begin
  with qryAux, SQL do
    begin
      Close;
      Clear;
      Add('SELECT SUM(valor) AS entradas');
      Add('FROM caixa');
      Add('WHERE codconta = :con');
      Add('AND data BETWEEN :dt AND :dtfin');
      Add('AND tipo = :tip');
      ParamByName('con').AsInteger := StrToInt(edtCodConta.Text);
      ParamByName('dt').AsDate     := StrToDate(mskData.Text);
      ParamByName('dtfin').AsDate  := StrToDate(mskFinal.Text);
      ParamByName('tip').AsString  := 'C';
      Open;
    end;

  entradas := qryAux.FieldByname('entradas').AsFloat;
  lblEntradas.Caption := loFuncoes.TrataReal(FloatToStr(entradas));

  with qryAux, SQL do
    begin
      Close;
      Clear;
      Add('SELECT SUM(valor) AS saidas');
      Add('FROM caixa');
      Add('WHERE codconta = :con');
      Add('AND data BETWEEN :dt AND :dtfin');
      Add('AND tipo = :tip');
      ParamByName('con').AsInteger := StrToInt(edtCodConta.Text);
      ParamByName('dt').AsDate     := StrToDate(mskData.Text);
      ParamByName('dtfin').AsDate  := StrToDate(mskFinal.Text);
      ParamByName('tip').AsString  := 'D';
      Open;
    end;

  saidas := qryAux.FieldByName('saidas').AsFloat;
  lblSaidas.Caption := loFuncoes.TrataReal(FloatToStr(saidas));  

  saldo := entradas - saidas;

  lblSaldoGeral.Caption := loFuncoes.TrataReal(FloatToStr(saldo));

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT SUM(valor) AS SaidasGeral');
  qryAux.SQL.Add('FROM caixa');
  qryAux.SQL.Add('WHERE tipo = :tip');
  qryAux.ParamByName('tip').AsString := 'D';
  qryAux.Open;

  SaidasGeral := qryAux.FieldByname('SaidasGeral').AsFloat;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT SUM(valor) AS EntradasGeral');
  qryAux.SQL.Add('FROM caixa');
  qryAux.SQL.Add('WHERE tipo = :tip');
  qryAux.ParamByName('tip').AsString := 'C';
  qryAux.Open;

  EntradasGeral := qryAux.FieldByName('EntradasGeral').AsFloat;

  SaldoGeral := EntradasGeral - SaidasGeral;

  lblSaldoTotal.Caption := loFuncoes.TrataReal(FloatToStr(SaldoGeral));

end;

procedure TfrmCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TfrmCaixa.BtnImprimirClick(Sender: TObject);
begin
  frmRelCaixa := TfrmRelCaixa.Create(self);

  frmRelCaixa.CODIGO.DataField := 'CODIGO';
  frmRelCaixa.CONTA.DataField  := 'CONTA';
  frmRelCaixa.VALOR.DataField  := 'VALOR';
  frmRelCaixa.DESCRICAO.DataField := 'DESCRICAO';
  frmRelCaixa.TIPO.DataField      := 'TIPO';

  if mskData.Text = mskFinal.Text then
    begin
      frmRelCaixa.DIA.Caption   := mskData.Text;
      frmRelCaixa.ATE.Caption   := '';
      frmRelCaixa.FINAL.Caption := '';
    end
  else
    begin
      frmRelCaixa.DIA.Caption := mskData.Text;
      frmRelCaixa.ATE.Caption := ' Até ';
      frmRelCaixa.FINAL.Caption := mskFinal.Text;
    end;

  frmRelCaixa.ENTRADASDIARIAS.Caption := lblEntradas.Caption;
  frmRelCaixa.SAIDASDIARIAS.Caption   := lblSaidas.Caption;
  frmRelCaixa.SALDOGERAL.Caption      := lblSaldoGeral.Caption;
  frmRelCaixa.SALDOTOTAL.Caption      := lblSaldoTotal.Caption;

  try
    frmRelCaixa.RlRptCaixa.Preview();
  finally
    FreeAndNil(frmRelCaixa);
  end;
end;

procedure TfrmCaixa.BtnAberturaClick(Sender: TObject);
var
  iCaixaAberto: integer;
begin
  if (MessageDlg('Deseja realmente abrir um novo caixa com a data de hoje('+DateToStr(Date)+')?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
    begin
      qryCaixaPrincipal.Close;
      qryCaixaPrincipal.SQL.Clear;
      qryCaixaPrincipal.SQL.Add('SELECT codigo, status FROM caixaprincipal');
      qryCaixaPrincipal.SQL.Add('WHERE status = :sta');
      qryCaixaPrincipal.ParamByName('sta').AsString := 'A';
      qryCaixaPrincipal.Open;
      cdsCaixaPrincipal.Close;
      cdsCaixaPrincipal.Open;

      if cdsCaixaPrincipal.RecordCount > 0 then
        begin
          iCaixaAberto := cdsCaixaPrincipal.FieldByName('codigo').AsInteger;
          if (MessageDlg('Existe um caixa já aberto, a continuação do processo fechará automaticamente o atual!'
                          + #13 + 'Deseja realmente continuar?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
            begin
              pFechaCaixa(iCaixaAberto);
              pAbreCaixa;               
            end
          else
            Exit
        end
      else
        pAbreCaixa;
    end;      
end;

procedure TfrmCaixa.pAbreCaixa;
begin
  qryCaixaPrincipal.Close;
  qryCaixaPrincipal.SQL.Clear;
  qryCaixaPrincipal.SQL.Add('INSERT INTO caixaprincipal');
  qryCaixaPrincipal.SQL.Add('(data,status)');
  qryCaixaPrincipal.SQL.Add('VALUES (:dat,:sta)');
  qryCaixaPrincipal.ParamByName('dat').AsDate   := Date;
  qryCaixaPrincipal.ParamByName('sta').AsString := 'A';
  qryCaixaPrincipal.ExecSQL();

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT MAX(codigo) AS CodCaixa');
  qryAux.SQL.Add('FROM caixaprincipal');
  qryAux.Open;
  cdsAux.Close;
  cdsAux.Open;

  frmPrincipal.iCaixaUsado := cdsAux.FieldByName('CodCaixa').AsInteger;
end;

procedure TfrmCaixa.pFechaCaixa;
begin
  qryCaixaPrincipal.Close;
  qryCaixaPrincipal.SQL.Clear;
  qryCaixaPrincipal.SQL.Add('UPDATE caixaprincipal SET status = :sta');
  qryCaixaPrincipal.SQL.Add('WHERE codigo = :cod');
  qryCaixaPrincipal.ParamByName('cod').AsInteger := iCodCaixa;
  qryCaixaPrincipal.ParamByName('sta').AsString  := 'F';
  qryCaixaPrincipal.Prepared := True;
  qryCaixaPrincipal.ExecSQL();
end;

procedure TfrmCaixa.BtnFechamentoClick(Sender: TObject);
begin
  pFechaCaixa(frmPrincipal.iCaixaUsado);
end;

procedure TfrmCaixa.mskFinalExit(Sender: TObject);
begin
  mostraCaixa;
end;

procedure TfrmCaixa.GrdCaixaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if State = [] then
  begin
    if cdsCaixa.FieldByName('tipo').AsString = 'D' then
      GrdCaixa.Canvas.Brush.Color := $007D7DFF
    else
      GrdCaixa.Canvas.Brush.Color := clWindow;
  end;
  GrdCaixa.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmCaixa.GrdCaixaTitleClick(Column: TColumn);
begin
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraCaixa;
end;

procedure TfrmCaixa.BtnTransferenciaClick(Sender: TObject);
begin
  try
    frmTransferenciaCaixa := TfrmTransferenciaCaixa.Create(self);
    frmTransferenciaCaixa.ShowModal;
  finally
    FreeAndNil(frmTransferenciaCaixa);
  end;

  mostraCaixa;
end;

end.
