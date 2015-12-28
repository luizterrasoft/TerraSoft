unit unContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, Grids, DBGrids, FMTBcd,
  SqlExpr, Provider, DB, DBClient, unfuncoes;

type
  TfrmContasPagar = class(TForm)
    PnTopo: TPanel;
    PnDados: TPanel;
    PnRodape: TPanel;
    BtnIncluir: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnQuitar: TBitBtn;
    BtnHistorico: TBitBtn;
    BtnRecibo: TBitBtn;
    BtnSair: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    lblFornecedor: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RdBtnNaoQuitadas: TRadioButton;
    RdBtnVencidas: TRadioButton;
    RdBtnQuitadas: TRadioButton;
    RdBtnTodas: TRadioButton;
    edtCodFornecedor: TEdit;
    BtnBuscaForn: TBitBtn;
    mskInicial: TMaskEdit;
    mskFInal: TMaskEdit;
    BtnConsultar: TBitBtn;
    GrdContasPagar: TDBGrid;
    dsContasPagar: TDataSource;
    cdsContasPagar: TClientDataSet;
    dspContasPagar: TDataSetProvider;
    qryContasPagar: TSQLQuery;
    dsAux: TDataSource;
    cdsAux: TClientDataSet;
    dspAux: TDataSetProvider;
    qryAux: TSQLQuery;
    BtnRelatorio: TBitBtn;
    BtnMarcar: TBitBtn;
    BtnDesmarcar: TBitBtn;
    BtnRenegociar: TBitBtn;
    BtnQuitarMarcadas: TBitBtn;
    lblFiltro: TLabel;
    ChBxDataOriginal: TCheckBox;
    ChBxDataOperacao: TCheckBox;
    BtnExcluir: TBitBtn;
    BtnOrigem: TBitBtn;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsultarClick(Sender: TObject);
    procedure edtCodFornecedorExit(Sender: TObject);
    procedure edtCodFornecedorEnter(Sender: TObject);
    procedure BtnBuscaFornClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnQuitarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RdBtnNaoQuitadasClick(Sender: TObject);
    procedure RdBtnVencidasClick(Sender: TObject);
    procedure RdBtnQuitadasClick(Sender: TObject);
    procedure RdBtnTodasClick(Sender: TObject);
    procedure BtnHistoricoClick(Sender: TObject);
    procedure BtnRelatorioClick(Sender: TObject);
    procedure BtnReciboClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnMarcarClick(Sender: TObject);
    procedure BtnDesmarcarClick(Sender: TObject);
    procedure GrdContasPagarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BtnRenegociarClick(Sender: TObject);
    procedure BtnQuitarMarcadasClick(Sender: TObject);
    procedure GrdContasPagarTitleClick(Column: TColumn);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnOrigemClick(Sender: TObject);
  private

    loFuncoes: TFuncoes;

    procedure ExcluiMarcacoes;
    procedure carregaDados;
    procedure Marcar;
    procedure Desmarcar;
    procedure OcultaReparceladas;
  public
    { Public declarations }
  end;

var
  frmContasPagar: TfrmContasPagar;

implementation

uses unDM, unFornecedores, unIncluirContasPagar, unIncluirContasReceber,
  unQuitarContaPagar, unHistoricoContaPagar, unRelContasPagar, unReciboCP,
  unPrincipal, unRenegociarCP, unConsultaManutencoes, DateUtils;

{$R *.dfm}

procedure TfrmContasPagar.BtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmContasPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmContasPagar.BtnConsultarClick(Sender: TObject);
begin
  with qryContasPagar, SQL do
    begin
      Close;
      Clear;
      Add('SELECT cp.*, forn.razaosocial AS Fornecedor FROM contaspagar cp');
      Add('INNER JOIN fornecedores forn');
      Add('ON forn.codigo = cp.codfornecedor');

      if ChBxDataOriginal.Checked = true then
        begin
          if (RdBtnQuitadas.Checked = false) then
            Add('WHERE cp.vencimento BETWEEN :dtini AND :dtfin')
          else
            Add('WHERE cp.datapagamento BETWEEN :dtini AND :dtfin');
        end;

      if ChBxDataOperacao.Checked = true then
        begin
          if (RdBtnQuitadas.Checked = true) then
            Add('WHERE cp.dataoperacaoquitacao BETWEEN :dtini AND :dtfin')
          else
            Add('WHERE cp.vencimento BETWEEN :dtini AND :dtfin');
        end;

      if (edtCodFornecedor.Text <> trim('0')) and (edtCodFornecedor.Text <> trim('')) then
        Add('AND cp.codfornecedor = :fornecedor');

      ParamByName('dtini').AsDate := StrToDate(mskInicial.Text);
      ParamByName('dtfin').AsDate := StrToDate(mskFInal.Text);

      if (edtCodFornecedor.Text <> trim('0')) and (edtCodFornecedor.Text <> trim('')) then
        ParamByName('fornecedor').AsInteger := StrToInt(edtCodFornecedor.Text);
    end;

  { VENCIDAS }
  if RdBtnVencidas.Checked = true then
    begin
      qryContasPagar.SQL.Add('AND cp.vencimento < :hoje AND cp.status <> :st1 AND cp.status <> :st2');
      qryContasPagar.ParamByName('hoje').AsDate := Today;
      qryContasPagar.ParamByName('st1').AsString:= 'Q';
      qryContasPagar.ParamByName('st2').AsString:= 'R';
    end;

  // NAO QUITADAS
  if RdBtnNaoQuitadas.Checked = true then
    begin
      with qryContasPagar, SQL do
        begin
          Add('AND cp.status = :st OR cp.status = :st2');
          ParamByName('st').AsString := 'A';
          ParamByName('st2').AsString:= 'V';
        end;
    end;

  // QUITADAS
  if RdBtnQuitadas.Checked = true then
    begin
      with qryContasPagar, SQL do
        begin
          Add('AND cp.status = :st');
          ParamByName('st').AsString := 'Q';
        end;
    end
  else
    begin
      // NAO RENEGOCIADAS
      qryContasPagar.SQL.Add('AND cp.renegociada IS NULL');
    end;

  qryContasPagar.SQL.Add('ORDER BY '+ frmPrincipal.sCampo);

  qryContasPagar.SQL.SaveToFile('C:\cpvencidas.txt');
  qryContasPagar.Open;
  cdsContasPagar.Close;
  cdsContasPagar.Open;

  TNumericField(cdsContasPagar.FieldByName('valor')).DisplayFormat := ',0.00;-,0.00';
  TNumericField(cdsContasPagar.FieldByName('valorpago')).DisplayFormat := ',0.00;-,0.00';
end;

procedure TfrmContasPagar.edtCodFornecedorExit(Sender: TObject);
begin
  if edtCodFornecedor.Text <> trim('') then
    begin
      lblFornecedor.Caption := loFuncoes.BuscaFk(edtCodFornecedor.Text,'fornecedores','razaosocial');

      if lblFornecedor.Caption = trim('') then
        begin
          edtCodFornecedor.Clear;
          BtnBuscaForn.SetFocus;
        end
      else
        mskInicial.SetFocus;
    end;
end;

procedure TfrmContasPagar.edtCodFornecedorEnter(Sender: TObject);
begin
  lblFornecedor.Caption := '';
end;

procedure TfrmContasPagar.BtnBuscaFornClick(Sender: TObject);
begin
  frmFornecedores := TfrmFornecedores.Create(self);
  frmFornecedores.telaChamando := 2;
  frmFornecedores.ShowModal;
  FreeAndNil(frmFornecedores);

  if lblFornecedor.Caption <> trim('') then
    mskInicial.SetFocus;
end;

procedure TfrmContasPagar.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmContasPagar.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmContasPagar.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  ExcluiMarcacoes;
  OcultaReparceladas;

  BtnConsultarClick(self);
end;

procedure TfrmContasPagar.BtnIncluirClick(Sender: TObject);
begin
  frmIncluirContasPagar := TfrmIncluirContasPagar.Create(self);
  frmIncluirContasPagar.ShowModal;
  FreeAndNil(frmIncluirContasPagar);
  BtnConsultarClick(self);
end;

procedure TfrmContasPagar.BtnAlterarClick(Sender: TObject);
begin
  if cdsContasPagar.RecordCount < 1 then
    Exit;

  // VERIFICA SE JÁ ESTÁ QUITADA, CASO CONTRÁRIO, NÃO DEIXA ALTERAR
  with qryAux, SQL do
    begin
      Close;
      Clear;
      Add('SELECT * FROM contaspagar');
      Add('WHERE codigo = :cod');
      ParamByName('cod').AsInteger := cdsContasPagar.FieldByName('codigo').AsInteger;
      Open;
      cdsAux.Close;
      cdsAux.Open;
    end;

  if trim(cdsAux.FieldByName('status').AsString)  = 'Q' then
    begin
      MessageDlg('Conta a pagar não pode ser alterada, pois já está quitada!',mtInformation,[mbOk],0);
      Exit;
    end;

  frmIncluirContasPagar := TfrmIncluirContasPagar.Create(self);
  carregaDados;
  frmIncluirContasPagar.opcSal := 1;
  frmIncluirContasPagar.ShowModal;
  FreeAndNil(frmIncluirContasPagar);
  BtnConsultarClick(self);
end;

procedure TfrmContasPagar.carregaDados;
begin
  frmIncluirContasPagar.codConta              := cdsContasPagar.FieldByName('codigo').AsInteger;
  frmIncluirContasPagar.mskEmissao.Text       := cdsContasPagar.FieldByName('lancamento').AsString;
  frmIncluirContasPagar.mskVencimento.Text    := cdsContasPagar.FieldByName('vencimento').AsString;
  frmIncluirContasPagar.edtDescricao.Text     := cdsContasPagar.FieldByName('descricao').AsString;
  frmIncluirContasPagar.edtValor.Text         := cdsContasPagar.FieldByName('valor').AsString;
  frmIncluirContasPagar.edtNumeroParcela.Text := cdsContasPagar.FieldByName('numeroparcela').AsString;
  frmIncluirContasPagar.edtCodFornecedor.Text := cdsContasPagar.FieldByName('codfornecedor').AsString;
  frmIncluirContasPagar.lblFornecedor.Caption := loFuncoes.BuscaFk(frmIncluirContasPagar.edtCodFornecedor.Text,'fornecedores','razaosocial');
  frmIncluirContasPagar.edtCodPlanoConta.Text := cdsContasPagar.FieldByName('codplanoconta').AsString;
  frmIncluirContasPagar.lblPlanoConta.Caption := loFuncoes.BuscaFk(frmIncluirContasPagar.edtCodPlanoConta.Text,'planocontas','descricao');
  frmIncluirContasPagar.edtCodSubPlano.Text   := cdsContasPagar.FieldByName('codsubplanoconta').AsString;
  frmIncluirContasPagar.lblSubPlano.Caption   := loFuncoes.BuscaFk(frmIncluirContasPagar.edtCodSubPlano.Text,'subplanocontas','descricao');
  frmIncluirContasPagar.edtCodEquipamento.Text:= cdsContasPagar.FieldByName('codequipamento').AsString;
  frmIncluirContasPagar.lblEquipamento.Caption:= loFuncoes.BuscaFk(frmIncluirContasPagar.edtCodEquipamento.Text,'equipamentos','descricao');
  frmIncluirContasPagar.RchEdtObs.Lines.Text  := cdsContasPagar.FieldByName('obs').AsString;
  frmIncluirContasPagar.edtNotaFiscal.Text    := cdsContasPagar.FieldByName('numeronf').AsString;
end;

procedure TfrmContasPagar.BtnQuitarClick(Sender: TObject);
begin
  if cdsContasPagar.FieldByName('status').AsString = 'Q' then
    begin
      MessageDlg('Conta a pagar já está quitada!',mtWarning,[mbOk],0);
      Exit;
    end;

  if cdsContasPagar.FieldByName('codigo').AsInteger > 0 then
    begin
      frmQuitarContaPagar := TfrmQuitarContaPagar.Create(self);
      frmQuitarContaPagar.iTipoQuitacao := 1;
      frmQuitarContaPagar.sDescricao := cdsContasPagar.FieldByName('descricao').AsString;
      frmQuitarContaPagar.vlrRestante := cdsContasPagar.FieldByName('valor').AsFloat - cdsContasPagar.FieldByName('valorpago').AsFloat;
      frmQuitarContaPagar.lblRestante.Caption := FloatToStr(frmQuitarContaPagar.vlrRestante);
      frmQuitarContaPagar.edtValor.Text       := FloatToStr(frmQuitarContaPagar.vlrRestante);
      frmQuitarContaPagar.codConta    := cdsContasPagar.FieldByName('codigo').AsInteger;
      frmQuitarContaPagar.JaQuitado   := cdsContasPagar.FieldByName('valorpago').AsFloat;
      frmQuitarContaPagar.codManutencao       := cdsContasPagar.FieldByName('codmanutencao').AsInteger;
      frmQuitarContaPagar.ShowModal;
      FreeAndNil(frmQuitarContaPagar);
    end
  else
    begin
      MessageDlg('Nenhuma conta foi selecionada!',mtWarning,[mbOk],0);
    end;

  BtnConsultarClick(self);
end;

procedure TfrmContasPagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TfrmContasPagar.RdBtnNaoQuitadasClick(Sender: TObject);
begin
  edtCodFornecedor.Text := '';
  lblFornecedor.Caption := '';
  
end;

procedure TfrmContasPagar.RdBtnVencidasClick(Sender: TObject);
begin
  edtCodFornecedor.Text := '';
  lblFornecedor.Caption := '';
end;

procedure TfrmContasPagar.RdBtnQuitadasClick(Sender: TObject);
begin
  edtCodFornecedor.Text := '';
  lblFornecedor.Caption := '';
  ChBxDataOperacao.Checked := True;
  ChBxDataOriginal.Checked := False;
end;

procedure TfrmContasPagar.RdBtnTodasClick(Sender: TObject);
begin
  edtCodFornecedor.Text := '';
  lblFornecedor.Caption := '';
end;

procedure TfrmContasPagar.BtnHistoricoClick(Sender: TObject);
begin
  frmHistoricoContaPagar := TfrmHistoricoContaPagar.Create(self);

  frmHistoricoContaPagar.lblFor.Caption := loFuncoes.BuscaFk(cdsContasPagar.FieldByName('codigo').AsString,'fornecedores','razaosocial');
  frmHistoricoContaPagar.lblValorTotal.Caption := loFuncoes.TrataReal(cdsContasPagar.FieldByName('valor').AsString);


  frmHistoricoContaPagar.ShowModal;
  FreeAndNil(frmHistoricoContaPagar);

  BtnConsultarClick(self);
end;

procedure TfrmContasPagar.BtnRelatorioClick(Sender: TObject);
begin
  frmRelContasPagar := TfrmRelContasPagar.Create(self);

  if RdBtnNaoQuitadas.Checked = true then
    frmRelContasPagar.lblSituacao.Caption := 'Não quitadas';

  if RdBtnVencidas.Checked = true then
    frmRelContasPagar.lblSituacao.Caption := 'Vencidas';

  if RdBtnQuitadas.Checked = true then
    frmRelContasPagar.lblSituacao.Caption := 'Quitadas';

  if RdBtnTodas.Checked = true then
    frmRelContasPagar.lblSituacao.Caption := 'Todas';

  if ChBxDataOriginal.Checked = true then
    frmRelContasPagar.lblFiltro.Caption := ChBxDataOriginal.Caption;

  if ChBxDataOperacao.Checked = true then
    frmRelContasPagar.lblFiltro.Caption := ChBxDataOperacao.Caption;

  frmRelContasPagar.lblPeriodoInicial.Caption := mskInicial.Text;
  frmRelContasPagar.lblPeriodoFinal.Caption   := mskFInal.Text;


  try
    frmRelContasPagar.RlRptContasPagar.Preview();
  finally
    FreeAndNil(frmRelContasPagar);
  end;

end;

procedure TfrmContasPagar.BtnReciboClick(Sender: TObject);
begin
  try
    frmReciboCP := TfrmReciboCP.Create(self);
    frmReciboCP.PESSOA.Caption    := cdsContasPagar.FieldByName('fornecedor').AsString;
    frmReciboCP.VALOREAL.Caption  := loFuncoes.TrataReal(cdsContasPagar.FieldByName('valorpago').AsString);
    frmReciboCP.VALOREXTENSO.Caption := loFuncoes.Extenso(cdsContasPagar.FieldByName('valorpago').AsFloat);
    frmReciboCP.PARCELA.Caption      := cdsContasPagar.FieldByName('codigo').AsString;
    frmReciboCP.DATAEXTENSO.Caption  := FormatDateTime('dddddd',cdsContasPagar.FieldByName('datapagamento').AsDateTime);
    frmReciboCP.EMITENTE.Caption     := frmPrincipal.StBarPrincipal.Panels[1].Text;
    frmReciboCP.RlRptReciboCP.Preview();
  finally
    FreeAndNil(frmReciboCP);
  end;
end;

procedure TfrmContasPagar.ExcluiMarcacoes;
begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('UPDATE contaspagar SET marcada = NULL WHERE marcada > 0');
  qryAux.ExecSQL();
end;

procedure TfrmContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ExcluiMarcacoes;
end;

procedure TfrmContasPagar.Desmarcar;
begin
  try
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('UPDATE contaspagar SET marcada = null WHERE codigo = :cp');
    qryAux.ParamByName('cp').AsInteger := cdsContasPagar.FieldByname('codigo').AsInteger;
    qryAux.ExecSQL();
  except
    MessageDlg('Não foi possível desmarcar a conta!',mtError,[mbOk],0);
  end;
end;

procedure TfrmContasPagar.Marcar;
begin
  try
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('UPDATE contaspagar SET marcada = 1 WHERE codigo = :cp');
    qryAux.ParamByName('cp').AsInteger := cdsContasPagar.FieldByname('codigo').AsInteger;
    qryAux.ExecSQL();
  except
    MessageDlg('Não foi possível marcar a conta!',mtError,[mbOk],0);
  end;
end;

procedure TfrmContasPagar.BtnMarcarClick(Sender: TObject);
begin
  if (cdsContasPagar.FieldByName('status').AsString = 'Q') then
    begin
      MessageDlg('Não é possível marcar essa conta, pois já está quitada!',mtWarning,[mbOk],0);
      Exit;
    end;

  Marcar;

  BtnConsultarClick(self);
end;

procedure TfrmContasPagar.BtnDesmarcarClick(Sender: TObject);
begin
  Desmarcar;
  BtnConsultarClick(self);
end;

procedure TfrmContasPagar.GrdContasPagarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if State = [] then
  begin
    if cdsContasPagar.FieldByName('marcada').AsInteger = 1 then
      GrdContasPagar.Canvas.Brush.Color := $007D7DFF
    else
      GrdContasPagar.Canvas.Brush.Color := clWindow;
  end;
  GrdContasPagar.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmContasPagar.BtnRenegociarClick(Sender: TObject);
begin
  try
    frmRenegociarCP := TfrmRenegociarCP.Create(self);
    frmRenegociarCP.codFornecedor := cdsContasPagar.FieldByName('codfornecedor').AsInteger;
    frmRenegociarCP.codManutencao := cdsContasPagar.FieldByName('codmanutencao').AsInteger;
    frmRenegociarCP.ShowModal;
  finally
    FreeAndNil(frmRenegociarCP);
  end;

  Desmarcar;
  OcultaReparceladas;
  BtnConsultarClick(self);
end;

procedure TfrmContasPagar.BtnQuitarMarcadasClick(Sender: TObject);
begin
  frmQuitarContaPagar := TfrmQuitarContaPagar.Create(self);
  frmQuitarContaPagar.iTipoQuitacao := 2;
  frmQuitarContaPagar.ShowModal;
  FreeAndNil(frmQuitarContaPagar);
  BtnConsultarClick(self);
end;

procedure TfrmContasPagar.GrdContasPagarTitleClick(Column: TColumn);
begin
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  BtnConsultarClick(self);
end;

procedure TfrmContasPagar.BtnExcluirClick(Sender: TObject);
var
  iCodContaPagar: integer;
begin
  iCodContaPagar := cdsContasPagar.FieldByName('codigo').AsInteger;

  if (MessageDlg('Deseja realmente excluir a conta ' + cdsContasPagar.FieldByName('descricao').AsString + ' ?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
    begin
      try
        qryContasPagar.Close;
        qryContasPagar.SQL.Clear;
        qryContasPagar.SQL.Add('DELETE FROM historicocontapagar');
        qryContasPagar.SQL.Add('WHERE codcontapagar = :cod');
        qryContasPagar.ParamByName('cod').AsInteger := iCodContaPagar;
        qryContasPagar.ExecSQL();

        qryContasPagar.Close;
        qryContasPagar.SQL.Clear;
        qryContasPagar.SQL.Add('DELETE FROM contaspagar');
        qryContasPagar.SQL.Add('WHERE codigo = :cod');
        qryContasPagar.ParamByName('cod').AsInteger := iCodContaPagar;
        qryContasPagar.ExecSQL();
      except
        on e: Exception do
        raise Exception.Create('Não foi possível excluir a conta desejada!' + #13 + e.Message);
      end;
    end;

  BtnConsultarClick(self);
end;

procedure TfrmContasPagar.OcultaReparceladas;
begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('UPDATE contaspagar SET mostrarreparcelamento = NULL');
  qryAux.ExecSQL();
end;

procedure TfrmContasPagar.BtnOrigemClick(Sender: TObject);
begin
  MessageDlg('Recurso em desenvolvimento!',mtWarning,[mbOk],0);
end;

end.
