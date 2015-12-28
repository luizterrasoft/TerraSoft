unit unContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, FMTBcd, SqlExpr, Provider,
  DB, DBClient, Grids, DBGrids, unFuncoes, DateUtils;

type
  TfrmContasReceber = class(TForm)
    PnConsulta: TPanel;
    PnRodape: TPanel;
    PnContas: TPanel;
    RdBtnNaoQuitadas: TRadioButton;
    RdBtnVencidas: TRadioButton;
    RdBtnQuitadas: TRadioButton;
    RdBtnTodas: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    edtCodCLiente: TEdit;
    BtnBuscaCliente: TBitBtn;
    lblCliente: TLabel;
    Label3: TLabel;
    mskInicial: TMaskEdit;
    mskFInal: TMaskEdit;
    Label4: TLabel;
    BtnConsultar: TBitBtn;
    BtnIncluir: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnQuitar: TBitBtn;
    BtnHistorico: TBitBtn;
    BtnRecibo: TBitBtn;
    BtnSair: TBitBtn;
    dsContasReceber: TDataSource;
    cdsContasReceber: TClientDataSet;
    dspContasReceber: TDataSetProvider;
    qryContasReceber: TSQLQuery;
    GrdContasReceber: TDBGrid;
    dsAux: TDataSource;
    cdsAux: TClientDataSet;
    dspAux: TDataSetProvider;
    qryAux: TSQLQuery;
    Label5: TLabel;
    lblTotal: TLabel;
    BtnRelatorio: TBitBtn;
    BtnRenegociar: TBitBtn;
    BtnMarcar: TBitBtn;
    BtnDesmarcar: TBitBtn;
    BtnQuitarMarcadas: TBitBtn;
    BtnOrigem: TBitBtn;
    BtnExcluir: TBitBtn;
    Label6: TLabel;
    edtCodOSBloco: TEdit;
    Label7: TLabel;
    edtCodTipoCobranca: TEdit;
    BtnBuscaTipoCobranca: TBitBtn;
    lblTipoCobranca: TLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnQuitarClick(Sender: TObject);
    procedure BtnHistoricoClick(Sender: TObject);
    procedure edtCodCLienteEnter(Sender: TObject);
    procedure edtCodCLienteExit(Sender: TObject);
    procedure BtnBuscaClienteClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnRelatorioClick(Sender: TObject);
    procedure BtnReciboClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnMarcarClick(Sender: TObject);
    procedure BtnDesmarcarClick(Sender: TObject);
    procedure BtnRenegociarClick(Sender: TObject);
    procedure GrdContasReceberDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BtnQuitarMarcadasClick(Sender: TObject);
    procedure GrdContasReceberTitleClick(Column: TColumn);
    procedure BtnOrigemClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnBuscaTipoCobrancaClick(Sender: TObject);
    procedure edtCodTipoCobrancaExit(Sender: TObject);
  private

    loFuncoes: TFuncoes;
    function VerificaClienteMarcado(iCodCliente: integer): Boolean; // verifica se as parcelas marcadas são do mesmo cliente, retorna falso caso não
    procedure carregaDados;
    procedure ExcluiMarcacoes;
    procedure Marcar;
    procedure Desmarcar;
    procedure OcultarReparcelamentos;
    procedure Totalizador;

  public
    iCodNovaParcela: integer; // após gerar o refaturamento, trás o código para alimentar a tabela refatcr
  end;

var
  frmContasReceber: TfrmContasReceber;

implementation

uses unDM, unIncluirCliente, unIncluirContasReceber, unQuitarContaReceber,
  unHistoricoContaReceber, UnClientes, unRelContasReceber, unReciboCR,
  unPrincipal, unRenegociarCR, unOrdensParcelaOrigem, unIncluirOS,
  unTiposCobrancas;

{$R *.dfm}

procedure TfrmContasReceber.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmContasReceber.BtnConsultarClick(Sender: TObject);
begin
  with qryContasReceber, SQL do
    begin
      Close;
      Clear;
      Add('SELECT cr.*, cli.nome AS Cliente FROM contasreceber cr');
      Add('INNER JOIN clientes cli');
      Add('ON cli.codigo = cr.codcliente');
      Add('WHERE cr.vencimento BETWEEN :dtini AND :dtfin');

      if (edtCodCLiente.Text <> trim('0')) and (edtCodCLiente.Text <> trim('')) then
        Add('AND cr.codcliente = :cliente');

      if (edtCodOSBloco.Text <> trim('0')) and (edtCodOSBloco.Text <> trim('')) then
        Add('AND cr.codos = (SELECT codigo FROM os WHERE osbloco = :bloco)');

      if (edtCodTipoCobranca.Text <> trim('')) then
        Add('AND cr.tipocobranca = :tc');

      ParamByName('dtini').AsDate := StrToDate(mskInicial.Text);
      ParamByName('dtfin').AsDate := StrToDate(mskFInal.Text);

      if (edtCodCLiente.Text <> trim('0')) and (edtCodCLiente.Text <> trim('')) then
        ParamByName('cliente').AsInteger := StrToInt(edtCodCLiente.Text);

      if (edtCodOSBloco.Text <> trim('0')) and (edtCodOSBloco.Text <> trim('')) then
        ParamByName('bloco').AsInteger := StrToInt(edtCodOSBloco.Text);

      if (edtCodTipoCobranca.Text <> trim('')) then
        ParamByName('tc').AsString := lblTipoCobranca.Caption;      
    end;

  // NAO QUITADAS
  if RdBtnNaoQuitadas.Checked = true then
    begin
      with qryContasReceber, SQL do
        begin
          Add('AND cr.status = :st OR cr.status = :st2');
          ParamByName('st').AsString := 'A';
          ParamByName('st2').AsString:= 'V';
        end;
    end;

  // VENCIDAS
  if RdBtnVencidas.Checked = true then
    begin
      qryContasReceber.SQL.Add('AND cr.vencimento < :hoje AND cr.status <> :st1 AND cr.status <> :st2');
      qryContasReceber.ParamByName('hoje').AsDate := Today;
      qryContasReceber.ParamByName('st1').AsString:= 'Q';
      qryContasReceber.ParamByName('st2').AsString:= 'R';
    end;

  // QUITADAS
  if RdBtnQuitadas.Checked = true then
    begin
      with qryContasReceber, SQL do
        begin
          Add('AND cr.status = :st');
          ParamByName('st').AsString := 'Q';
        end;
    end;

  qryContasReceber.SQL.Add(' ORDER BY '+  frmPrincipal.sCampo);

  qryContasReceber.Open;
  cdsContasReceber.Close;
  cdsContasReceber.Open;

  TNumericField(cdsContasReceber.FieldByName('valor')).DisplayFormat := ',0.00;-,0.00';
  TNumericField(cdsContasReceber.FieldByName('valorrecebido')).DisplayFormat := ',0.00;-,0.00';

  Totalizador;
end;

procedure TfrmContasReceber.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  BtnConsultarClick(self);

  ExcluiMarcacoes;
  OcultarReparcelamentos;
end;

procedure TfrmContasReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmContasReceber.BtnIncluirClick(Sender: TObject);
begin
  frmIncluirContasReceber := TfrmIncluirContasReceber.Create(self);
  frmIncluirContasReceber.ShowModal;
  FreeAndNil(frmIncluirContasReceber);
  BtnConsultarClick(self);
end;

procedure TfrmContasReceber.BtnAlterarClick(Sender: TObject);
begin
  if cdsContasReceber.RecordCount < 1 then
    Exit;

  // VERIFICA SE JÁ ESTÁ QUITADA, CASO CONTRÁRIO, NÃO DEIXA ALTERAR
  with qryAux, SQL do
    begin
      Close;
      Clear;
      Add('SELECT * FROM contasreceber');
      Add('WHERE codigo = :cod');
      ParamByName('cod').AsInteger := cdsContasReceber.FieldByName('codigo').AsInteger;
      Open;
      cdsAux.Close;
      cdsAux.Open;
    end;

  if trim(cdsAux.FieldByName('status').AsString)  = 'Q' then
    begin
      MessageDlg('Conta a receber não pode ser alterada, pois já está quitada!',mtInformation,[mbOk],0);
      Exit;
    end;

  frmIncluirContasReceber := TfrmIncluirContasReceber.Create(self);
  frmIncluirContasReceber.sTipoCobranca := cdsContasReceber.FieldByName('tipocobranca').AsString;  
  carregaDados;
  frmIncluirContasReceber.opcSal := 1;
  frmIncluirContasReceber.ShowModal;
  FreeAndNil(frmIncluirContasReceber);
  BtnConsultarClick(self);
end;

procedure TfrmContasReceber.carregaDados;
begin
  frmIncluirContasReceber.codConta              := cdsContasReceber.FieldByName('codigo').AsInteger;
  frmIncluirContasReceber.mskEmissao.Text       := cdsContasReceber.FieldByName('emissao').AsString;
  frmIncluirContasReceber.mskVencimento.Text    := cdsContasReceber.FieldByName('vencimento').AsString;
  frmIncluirContasReceber.edtDescricao.Text     := cdsContasReceber.FieldByName('descricao').AsString;
  frmIncluirContasReceber.edtValor.Text         := cdsContasReceber.FieldByName('valor').AsString;
  frmIncluirContasReceber.edtNumeroParcela.Text := cdsContasReceber.FieldByName('numeroparcela').AsString;

  frmIncluirContasReceber.edtCodCliente.Text := cdsContasReceber.FieldByName('codcliente').AsString;

  if (frmIncluirContasReceber.edtCodCliente.Text <> trim('')) or (frmIncluirContasReceber.edtCodCliente.Text <> trim('0')) then
    begin
      frmIncluirContasReceber.lblCliente.Caption := loFuncoes.BuscaFk(frmIncluirContasReceber.edtCodCliente.Text,'clientes','nome');
    end
  else
    begin
      frmIncluirContasReceber.edtCodCliente.Clear;
      frmIncluirContasReceber.lblCliente.Caption := '';
    end;

end;

procedure TfrmContasReceber.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmContasReceber.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmContasReceber.BtnQuitarClick(Sender: TObject);
begin

  if cdsContasReceber.FieldByName('status').AsString = 'Q' then
    begin
      MessageDlg('Conta a receber já está quitada!',mtWarning,[mbOk],0);
      Exit;
    end;

  if cdsContasReceber.FieldByName('codigo').AsInteger > 0 then
    begin
      frmQuitarContaReceber := TfrmQuitarContaReceber.Create(self);
      frmQuitarContaReceber.iTipoQuitacao := 1;
      frmQuitarContaReceber.vlrRestante := cdsContasReceber.FieldByName('valor').AsFloat - cdsContasReceber.FieldByName('valorrecebido').AsFloat;
      frmQuitarContaReceber.lblRestante.Caption := FloatToStr(frmQuitarContaReceber.vlrRestante);
      frmQuitarContaReceber.edtValor.Text       := FloatToStr(frmQuitarContaReceber.vlrRestante);
      frmQuitarContaReceber.codConta    := cdsContasReceber.FieldByName('codigo').AsInteger;
      frmQuitarContaReceber.JaQuitado   := cdsContasReceber.FieldByName('valorRecebido').AsFloat;
      frmQuitarContaReceber.codOs       := cdsContasReceber.FieldByName('codos').AsInteger;
      frmQuitarContaReceber.ShowModal;
      FreeAndNil(frmQuitarContaReceber);
    end
  else
    begin
      MessageDlg('Nenhuma conta foi selecionada!',mtWarning,[mbOk],0);
    end;

  BtnConsultarClick(self);
end;

procedure TfrmContasReceber.BtnHistoricoClick(Sender: TObject);
begin
  frmHistoricoContaReceber := TfrmHistoricoContaReceber.Create(self);

  frmHistoricoContaReceber.lblCliente.Caption := loFuncoes.BuscaFk(cdsContasReceber.FieldByName('codigo').AsString,'clientes','nome');
  frmHistoricoContaReceber.lblOS.Caption      := cdsContasReceber.FieldByName('codos').AsString;
  frmHistoricoContaReceber.lblValorTotal.Caption := loFuncoes.TrataReal(cdsContasReceber.FieldByName('valor').AsString);


  frmHistoricoContaReceber.ShowModal;
  FreeAndNil(frmHistoricoContaReceber);

  BtnConsultarClick(self);
end;

procedure TfrmContasReceber.edtCodCLienteEnter(Sender: TObject);
begin
  lblCliente.Caption := '';
end;

procedure TfrmContasReceber.edtCodCLienteExit(Sender: TObject);
begin
  if edtCodCliente.Text <> trim('') then
    begin
      lblCliente.Caption := loFuncoes.BuscaFk(edtCodCliente.Text,'clientes','nome');

      if lblCliente.Caption = trim('') then
        begin
          edtCodCliente.Clear;
          BtnBuscaCliente.SetFocus;
        end
      else
        mskInicial.SetFocus;
    end;
end;

procedure TfrmContasReceber.BtnBuscaClienteClick(Sender: TObject);
begin
  frmClientes := TfrmClientes.Create(self);
  frmClientes.telaChamando := 4;
  frmClientes.ShowModal;
  FreeAndNil(frmClientes);

  if lblCliente.Caption <> trim('') then
    BtnConsultar.SetFocus;
end;

procedure TfrmContasReceber.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TfrmContasReceber.BtnRelatorioClick(Sender: TObject);
begin
  frmRelContasReceber := TfrmRelContasReceber.Create(self);

  if RdBtnNaoQuitadas.Checked = true then
    frmRelContasReceber.lblSituacao.Caption := 'Não Quitadas';

  if RdBtnNaoQuitadas.Checked = true then
    frmRelContasReceber.lblSituacao.Caption := 'Vencidas';

  if RdBtnNaoQuitadas.Checked = true then
    frmRelContasReceber.lblSituacao.Caption := 'Quitadas';

  if RdBtnNaoQuitadas.Checked = true then
    frmRelContasReceber.lblSituacao.Caption := 'Todas';

  frmRelContasReceber.lblPeriodoInicial.Caption := mskInicial.Text;
  frmRelContasReceber.lblPeriodoFinal.Caption   := mskFInal.Text;

  try
    frmRelContasReceber.RlRptContasPagar.Preview();
  finally
    FreeAndNil(frmRelContasReceber);
  end;
end;

procedure TfrmContasReceber.BtnReciboClick(Sender: TObject);
begin
  try
    frmReciboCR := TfrmReciboCR.Create(self);
    frmReciboCR.PESSOA.Caption    := cdsContasReceber.FieldByName('cliente').AsString;
    frmReciboCR.VALOREAL.Caption  := loFuncoes.TrataReal(cdsContasReceber.FieldByName('valorrecebido').AsString);
    frmReciboCR.VALOREXTENSO.Caption := loFuncoes.Extenso(cdsContasReceber.FieldByName('valorrecebido').AsFloat);
    frmReciboCR.PARCELA.Caption      := cdsContasReceber.FieldByName('codigo').AsString;
    frmReciboCR.DATAEXTENSO.Caption  := FormatDateTime('dddddd',cdsContasReceber.FieldByName('datarecebimento').AsDateTime);
    frmReciboCR.EMITENTE.Caption     := frmPrincipal.StBarPrincipal.Panels[1].Text;
    frmReciboCR.RlRptReciboCR.Preview();
  finally
    FreeAndNil(frmReciboCR);
  end;
end;

procedure TfrmContasReceber.ExcluiMarcacoes;
begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('UPDATE contasreceber SET marcada = NULL WHERE marcada > 0');
  qryAux.ExecSQL();
end;

procedure TfrmContasReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ExcluiMarcacoes;
end;

procedure TfrmContasReceber.BtnMarcarClick(Sender: TObject);
begin
{  if not(VerificaClienteMarcado(cdsContasReceber.FieldByName('codcliente').AsInteger))then
    Exit;}

  if (cdsContasReceber.FieldByName('status').AsString = 'Q') then
    begin
      MessageDlg('Não é possível marcar essa conta, pois já está quitada!',mtWarning,[mbOk],0);
      Exit;
    end;

  Marcar;
  BtnConsultarClick(self);
end;

procedure TfrmContasReceber.Marcar;
begin
  try
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('UPDATE contasreceber SET marcada = 1 WHERE codigo = :cr');
    qryAux.ParamByName('cr').AsInteger := cdsContasReceber.FieldByname('codigo').AsInteger;
    qryAux.ExecSQL();
  except
    MessageDlg('Não foi possível marcar a conta!',mtError,[mbOk],0);
  end;
end;

procedure TfrmContasReceber.Desmarcar;
begin
  try
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('UPDATE contasreceber SET marcada = null WHERE codigo = :cr');
    qryAux.ParamByName('cr').AsInteger := cdsContasReceber.FieldByname('codigo').AsInteger;
    qryAux.ExecSQL();
  except
    MessageDlg('Não foi possível desmarcar a conta!',mtError,[mbOk],0);
  end;
end;

procedure TfrmContasReceber.BtnDesmarcarClick(Sender: TObject);
begin
  Desmarcar;
  BtnConsultarClick(self);
end;

procedure TfrmContasReceber.BtnRenegociarClick(Sender: TObject);
begin
  try
    frmRenegociarCR := TfrmRenegociarCR.Create(self);
    frmRenegociarCR.codCliente := cdsContasReceber.FieldByName('codcliente').AsInteger;
    frmRenegociarCR.codOS      := cdsContasReceber.FieldByName('codos').AsInteger;
    frmRenegociarCR.ShowModal;
  finally
    FreeAndNil(frmRenegociarCR);
  end;

  Desmarcar;
  OcultarReparcelamentos;
  BtnConsultarClick(self);
end;

procedure TfrmContasReceber.GrdContasReceberDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if State = [] then
  begin
    if cdsContasReceber.FieldByName('marcada').AsInteger = 1 then
      GrdContasReceber.Canvas.Brush.Color := $007D7DFF
    else
      GrdContasReceber.Canvas.Brush.Color := clWindow;
  end;
  GrdContasReceber.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmContasReceber.BtnQuitarMarcadasClick(Sender: TObject);
begin
  frmQuitarContaReceber := TfrmQuitarContaReceber.Create(self);
  frmQuitarContaReceber.iTipoQuitacao := 2;
  frmQuitarContaReceber.ShowModal;
  FreeAndNil(frmQuitarContaReceber);
  BtnConsultarClick(self);
end;

procedure TfrmContasReceber.GrdContasReceberTitleClick(Column: TColumn);
begin
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  BtnConsultarClick(self);
end;

function TfrmContasReceber.VerificaClienteMarcado(iCodCliente: integer): Boolean;
begin
  Result := True;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT * FROM contasreceber');
  qryAux.SQL.Add('WHERE marcada = 1');
  qryAux.Open;
  cdsAux.Close;
  cdsAux.Open;

  if (iCodCliente <> cdsAux.FieldByName('codcliente').AsInteger) and (cdsAux.RecordCount > 0) then
    begin
      MessageDlg('Essa conta não pode ser marcada, pois é de cliente diferente!',mtWarning,[mbOk],0);
      Result := False;
    end;
end;

procedure TfrmContasReceber.BtnOrigemClick(Sender: TObject);
begin
  if cdsContasReceber.FieldByName('renegociada').AsInteger = 2 then
    begin
      try
        frmOrdensParcelaOrigem := TfrmOrdensParcelaOrigem.Create(self);
        frmOrdensParcelaOrigem.iCodPrestacao := cdsContasReceber.FieldByName('codigo').AsInteger;
        frmOrdensParcelaOrigem.ShowModal;
      finally
        FreeAndNil(frmOrdensParcelaOrigem);
      end;
    end
  else
    begin
      try
        frmIncluirOS := TfrmIncluirOS.Create(self);

        try
          frmIncluirOS.codOS := cdsContasReceber.FieldByName('codos').AsInteger;
        except
          MessageDlg('Parcela não é originada de uma O.S.!',mtWarning,[mbOk],0);
          Exit;
        end;

        frmIncluirOS.operacao := 3; // visualizar
        frmIncluirOS.ShowModal;
      finally
        FreeAndNil(frmIncluirOS);
      end;
    end;
end;

procedure TfrmContasReceber.OcultarReparcelamentos;
begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('UPDATE contasreceber SET mostrarreparcelamento = null');
  qryAux.ExecSQL();
end;

procedure TfrmContasReceber.BtnExcluirClick(Sender: TObject);
var
  iCodContaReceber: integer;
begin
  iCodContaReceber := cdsContasReceber.FieldByName('codigo').AsInteger;

  if (MessageDlg('Deseja realmente excluir a conta ' + cdsContasReceber.FieldByName('descricao').AsString + ' ?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
    begin
      try
        qryContasReceber.Close;
        qryContasReceber.SQL.Clear;
        qryContasReceber.SQL.Add('DELETE FROM historicocontareceber');
        qryContasReceber.SQL.Add('WHERE codcontareceber = :cod');
        qryContasReceber.ParamByName('cod').AsInteger := iCodContaReceber;
        qryContasReceber.ExecSQL();

        qryContasReceber.Close;
        qryContasReceber.SQL.Clear;
        qryContasReceber.SQL.Add('DELETE FROM contasreceber');
        qryContasReceber.SQL.Add('WHERE codigo = :cod');
        qryContasReceber.ParamByName('cod').AsInteger := iCodContaReceber;
        qryContasReceber.ExecSQL();
      except
        on e: Exception do
        raise Exception.Create('Não foi possível excluir a conta desejada!' + #13 + e.Message);
      end;
    end;

  BtnConsultarClick(self);
end;

procedure TfrmContasReceber.Totalizador;
var
  vrTotal: Currency;
begin

  with cdsContasReceber do
  begin
     cdsContasReceber.First; // Desnecessário, só por legibilidade

     vrTotal := 0;
     while not Eof do
     begin
       vrTotal := vrTotal + FieldByName('VALOR').AsCurrency;
       Next;
     end;

  end;
  lblTotal.Caption := FloatToStr(vrTotal);
  lblTotal.Caption := loFuncoes.TrataReal(lblTotal.Caption);
end;

procedure TfrmContasReceber.BtnBuscaTipoCobrancaClick(Sender: TObject);
begin
  frmTiposCobrancas := TfrmTiposCobrancas.Create(self);
  frmTiposCobrancas.telaChamando := 3;
  frmTiposCobrancas.ShowModal;
  FreeAndNil(frmTiposCobrancas);

  if lblTipoCobranca.Caption <> trim('') then
    BtnConsultar.SetFocus;
end;

procedure TfrmContasReceber.edtCodTipoCobrancaExit(Sender: TObject);
begin
  if edtCodTipoCobranca.Text <> trim('') then
    begin
      lblTipoCobranca.Caption := loFuncoes.BuscaFk(edtCodTipoCobranca.Text,'tipocobranca','descricao');

      if lblTipoCobranca.Caption = trim('') then
        begin
          edtCodTipoCobranca.Clear;
          BtnBuscaTipoCobranca.SetFocus;
        end
      else
        BtnConsultar.SetFocus;
    end;
end;

end.
