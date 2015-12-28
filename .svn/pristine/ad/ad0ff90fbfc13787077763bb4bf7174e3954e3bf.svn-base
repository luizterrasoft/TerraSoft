unit unOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, FMTBcd, SqlExpr,
  Provider, DB, DBClient, unFuncoes, Mask;

type
  TfrmOS = class(TForm)
    PnConsulta: TPanel;
    Label1: TLabel;
    RdBtnCliente: TRadioButton;
    RdBtnVendedor: TRadioButton;
    Bevel1: TBevel;
    PnAcoes: TPanel;
    BtnNova: TBitBtn;
    BtnAlterarOS: TBitBtn;
    BtnImprimir: TBitBtn;
    BtnCancelarOS: TBitBtn;
    BtnExcluirOS: TBitBtn;
    BtnFecharOS: TBitBtn;
    BtnRelatorio: TBitBtn;
    BtnSair: TBitBtn;
    GrdOrdens: TDBGrid;
    lblPessoa: TLabel;
    edtCodPessoa: TEdit;
    lblNomePessoa: TLabel;
    BtnBuscaPessoa: TBitBtn;
    BtnConsultar: TBitBtn;
    dsOS: TDataSource;
    cdsOS: TClientDataSet;
    dspOS: TDataSetProvider;
    qryOS: TSQLQuery;
    RdBtnCodigo: TRadioButton;
    Label2: TLabel;
    ChBxDataAbertura: TCheckBox;
    ChBxDataFechamento: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    mskInicial: TMaskEdit;
    mskFinal: TMaskEdit;
    dsOSRel: TDataSource;
    cdsOSRel: TClientDataSet;
    dspOSRel: TDataSetProvider;
    qryOSRel: TSQLQuery;
    qryAux: TSQLQuery;
    dsAux: TDataSource;
    cdsAux: TClientDataSet;
    dspAux: TDataSetProvider;
    dsParcelas: TDataSource;
    cdsParcelas: TClientDataSet;
    dspParcelas: TDataSetProvider;
    qryParcelas: TSQLQuery;
    RdBtnTodos: TRadioButton;
    dsTotais: TDataSource;
    cdsTotais: TClientDataSet;
    dspTotais: TDataSetProvider;
    qryTotais: TSQLQuery;
    BtnEstornaLancamentos: TBitBtn;
    dsHistorico: TDataSource;
    cdsHistorico: TClientDataSet;
    dspHistorico: TDataSetProvider;
    qryHistorico: TSQLQuery;
    Label5: TLabel;
    CbxStatus: TComboBox;
    BtnVisualizar: TBitBtn;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtCodPessoaEnter(Sender: TObject);
    procedure edtCodPessoaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnBuscaPessoaClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure ChBxDataAberturaClick(Sender: TObject);
    procedure ChBxDataFechamentoClick(Sender: TObject);
    procedure RdBtnClienteClick(Sender: TObject);
    procedure RdBtnCodigoClick(Sender: TObject);
    procedure RdBtnFuncionarioClick(Sender: TObject);
    procedure RdBtnVendedorClick(Sender: TObject);
    procedure BtnNovaClick(Sender: TObject);
    procedure BtnAlterarOSClick(Sender: TObject);
    procedure BtnCancelarOSClick(Sender: TObject);
    procedure BtnExcluirOSClick(Sender: TObject);
    procedure BtnFecharOSClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnImprimirClick(Sender: TObject);
    procedure RdBtnTodosClick(Sender: TObject);
    procedure BtnRelatorioClick(Sender: TObject);
    procedure BtnEstornaLancamentosClick(Sender: TObject);
    procedure GrdOrdensDblClick(Sender: TObject);
    procedure GrdOrdensTitleClick(Column: TColumn);
    procedure BtnVisualizarClick(Sender: TObject);
  private

    Abertas, Fechadas, Canceladas: Real;  
    loFuncoes: TFuncoes;
    procedure mostraOS;
    procedure configuraConsulta;
    function validaConsultar(): boolean;

  public
    { Public declarations }
  end;

var
  frmOS: TfrmOS;

implementation

uses unDM, UnClientes, unFuncionarios, unIncluirOS, unFaturamentoOS,
  unRelOS, unRelacaoOS, Math, unPrincipal, unConsultas;

{$R *.dfm}

procedure TfrmOS.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOS.configuraConsulta;
begin
  if RdBtnCodigo.Checked = true then
    begin
      lblPessoa.Caption := 'Código';
      BtnBuscaPessoa.Enabled := False;
      BtnBuscaPessoa.Visible := False;
      Label3.Visible := False;
      Label4.Visible := False;
      mskInicial.Visible := False;
      mskFinal.Visible   := False;
    end
  else
    begin
      BtnBuscaPessoa.Visible := True;
      BtnBuscaPessoa.Enabled := True;
      Label3.Visible := True;
      Label4.Visible := True;
      mskInicial.Visible := True;
      mskFinal.Visible   := True;
      edtCodPessoa.Visible := True;
      lblPessoa.Visible := True;
      edtCodPessoa.SetFocus;
    end;

  if RdBtnCliente.Checked = true then
    begin
      lblPessoa.Caption := 'Cliente';
      edtCodPessoa.SetFocus;
    end;

  if RdBtnVendedor.Checked = true then
    begin
      lblPessoa.Caption := 'Vendedor';
      edtCodPessoa.SetFocus;
    end;

  if RdBtnTodos.Checked = true then
    begin
      BtnBuscaPessoa.Visible := False;
      BtnBuscaPessoa.Enabled := False;
      Label3.Visible := True;
      Label4.Visible := True;
      mskInicial.Visible := True;
      mskFinal.Visible   := True;
      lblPessoa.Visible := False;
      edtCodPessoa.Text    := '';
      edtCodPessoa.Visible := False;
      mskInicial.SetFocus;
    end;
end;

procedure TfrmOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmOS.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  configuraConsulta;

  mostraOS;

  edtCodPessoa.SetFocus;

  TNumericField(cdsOS.FieldByName('valortotal')).DisplayFormat := ',0.00;-,0.00';
end;

procedure TfrmOS.mostraOS;
begin
  with qryOS, SQL do
    begin
      Close;
      Clear;
      Add('SELECT os.*, cli.nome as cliente, func.nome as funcionario, funci.nome');
      Add('FROM os');
      Add('INNER JOIN clientes cli');
      Add('ON cli.codigo = os.codcliente');
      Add('INNER JOIN funcionarios func');
      Add('ON func.codigo = os.codfuncionario');
      Add('INNER JOIN funcionarios funci');
      Add('ON os.codvendedor = funci.codigo');
      Add('WHERE os.status = :sta');
      ParamByName('sta').AsString := 'A';
      Open;
      cdsOS.Close;
      cdsOS.Open;
    end;
end;

procedure TfrmOS.edtCodPessoaEnter(Sender: TObject);
begin
  lblNomePessoa.Caption := '';
end;

procedure TfrmOS.edtCodPessoaExit(Sender: TObject);
begin
  if (edtCodPessoa.Text <> trim('')) and (RdBtnCodigo.Checked = false) then
    begin
      if RdBtnCliente.Checked = true then
        begin
          lblNomePessoa.Caption := loFuncoes.BuscaFk(edtCodPessoa.Text,'clientes','nome');
        end;

      if (RdBtnVendedor.Checked = true) then
        begin
          lblNomePessoa.Caption := loFuncoes.BuscaFk(edtCodPessoa.Text,'funcionarios','nome');
        end;

      if lblNomePessoa.Caption = trim('') then
        begin
          edtCodPessoa.Clear;
          BtnBuscaPessoa.SetFocus;
        end
      else
        mskInicial.SetFocus;
    end;
end;

procedure TfrmOS.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmOS.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmOS.BtnBuscaPessoaClick(Sender: TObject);
begin
  if RdBtnCliente.Checked = true then
    begin
      frmClientes := TfrmClientes.Create(self);
      frmClientes.telaChamando := 1;
      frmClientes.ShowModal;
      FreeAndNil(frmClientes);
    end;

  if (RdBtnVendedor.Checked = true) then
    begin
      frmFuncionarios := TfrmFuncionarios.Create(self);
      frmFuncionarios.telaChamando := 2;
      frmFuncionarios.ShowModal;
      FreeAndNil(frmFuncionarios);
    end;

  if lblNomePessoa.Caption <> trim('') then
    edtCodPessoa.SetFocus;
end;

procedure TfrmOS.BtnConsultarClick(Sender: TObject);
var
  i: integer;
begin
  if not(validaConsultar) then
    Exit;

  with qryOS, SQL do
    begin
      Close;
      Clear;
      Add('SELECT os.*, cli.nome as cliente, funci.nome AS vendedor');
      Add('FROM os');
      Add('INNER JOIN clientes cli');
      Add('ON cli.codigo = os.codcliente');
      Add('INNER JOIN funcionarios funci');
      Add('ON os.codvendedor = funci.codigo');

      if edtCodPessoa.Text <> trim('') then
        begin
          // CONSULTA POR
          if RdBtnCliente.Checked = true then
            Add('WHERE os.codcliente = :con');


          if RdBtnVendedor.Checked = true then
            Add('WHERE os.codvendedor = :con');

          if RdBtnCodigo.Checked = true then
            Add('WHERE os.codigo = :cod');
        end;

      if (RdBtnCodigo.Checked = false) and (RdBtnTodos.Checked = false) then
        begin
          // FILTRO
          if ChBxDataAbertura.Checked then
            Add('AND dataabertura BETWEEN :dtini AND :dtfin');

          if ChBxDataFechamento.Checked then
            Add('AND datafechada BETWEEN :dtini AND :dtfin');
        end;

      if (RdBtnTodos.Checked = true) then
        begin
          if ChBxDataAbertura.Checked then
            Add('WHERE dataabertura BETWEEN :dtini AND :dtfin');

          if ChBxDataFechamento.Checked then
            Add('WHERE datafechada BETWEEN :dtini AND :dtfin');
        end;

      if (CbxStatus.ItemIndex <> 2) then // se for diferente de todos
        Add('AND status = :sta');

      if RdBtnCodigo.Checked = false then
        begin
          if (RdBtnTodos.Checked = false) and (edtCodPessoa.Text <> trim('')) then
            ParamByName('con').AsInteger := StrToInt(edtCodPessoa.Text);

          ParamByName('dtini').AsDate := StrToDate(mskInicial.Text);
          ParamByName('dtfin').AsDate := StrToDate(mskFinal.Text);
        end;

      // abertas
      if (CbxStatus.ItemIndex = 0) then
        ParamByName('sta').AsString := 'A';

      // fechadas
      if (CbxStatus.ItemIndex = 1 ) then
        ParamByName('sta').AsString := 'F';

      if RdBtnCodigo.Checked = true then
        ParamByName('cod').AsInteger := StrToInt(edtCodPessoa.Text);

      qryOS.Open;
      cdsOS.Close;
      cdsOS.Open;
    end;

 // -------------------------------- TOTAIS ---------------------------------- //

  i := 0;
  while i <=2 do
    begin
      qryTotais.Close;
      qryTotais.SQL.Clear;
      qryTotais.SQL.Add('SELECT SUM(valortotal) AS Total');
      qryTotais.SQL.Add('FROM os');

      // CONSULTA POR
      if (RdBtnCliente.Checked = true) and (edtCodPessoa.Text <> trim('')) then
        qryTotais.SQL.Add('WHERE os.codcliente = :con');

      if (RdBtnVendedor.Checked = true) and (edtCodPessoa.Text <> trim('')) then
        qryTotais.SQL.Add('WHERE os.codvendedor = :con');

      if (RdBtnCodigo.Checked = false) and (RdBtnTodos.Checked = false) then
        begin
          // FILTRO
          if ChBxDataAbertura.Checked then
            qryTotais.SQL.Add('AND dataabertura BETWEEN :dtini AND :dtfin');

          if ChBxDataFechamento.Checked then
            qryTotais.SQL.Add('AND datafechada BETWEEN :dtini AND :dtfin');
        end;

      if (RdBtnTodos.Checked = true) then
        begin
          if ChBxDataAbertura.Checked then
            qryTotais.SQL.Add('WHERE dataabertura BETWEEN :dtini AND :dtfin');

          if ChBxDataFechamento.Checked then
            qryTotais.SQL.Add('WHERE datafechada BETWEEN :dtini AND :dtfin');
        end;

      qryTotais.SQL.Add('AND status = :sta');

      if RdBtnCodigo.Checked = false then
        begin
          if (RdBtnTodos.Checked = false) and (edtCodPessoa.Text <> trim('')) then
            qryTotais.ParamByName('con').AsInteger := StrToInt(edtCodPessoa.Text);

          qryTotais.ParamByName('dtini').AsDate := StrToDate(mskInicial.Text);
          qryTotais.ParamByName('dtfin').AsDate := StrToDate(mskFinal.Text);

          // PASSA POR CADA SITUACAO DA OS, SOMANDO OS TOTAIS
          if i = 0 then
            qryTotais.ParamByName('sta').AsString := 'A';

          if i = 1 then
            qryTotais.ParamByName('sta').AsString := 'F';

          if i = 2 then
            qryTotais.ParamByName('sta').AsString := 'C';
        end;

      qryTotais.Open;
      cdsTotais.Open;
      cdsTotais.Refresh;

      if i = 0 then
        Abertas := cdsTotais.FieldByName('total').AsFloat;

      if i = 1 then
        Fechadas:= cdsTotais.FieldByName('total').AsFloat;

      if i = 2 then
        Canceladas := cdsTotais.FieldByName('total').AsFloat;

      i := i + 1;
    end;

  TNumericField(cdsOS.FieldByName('valortotal')).DisplayFormat := ',0.00;-,0.00';
end;

procedure TfrmOS.ChBxDataAberturaClick(Sender: TObject);
begin
  if ChBxDataAbertura.Checked = true then
    ChBxDataFechamento.Checked := False;
end;

procedure TfrmOS.ChBxDataFechamentoClick(Sender: TObject);
begin
  if ChBxDataFechamento.Checked = true then
    ChBxDataAbertura.Checked := False;
end;

procedure TfrmOS.RdBtnClienteClick(Sender: TObject);
begin
  configuraConsulta;
end;

procedure TfrmOS.RdBtnCodigoClick(Sender: TObject);
begin
  configuraConsulta;
end;

procedure TfrmOS.RdBtnFuncionarioClick(Sender: TObject);
begin
  configuraConsulta;
end;

procedure TfrmOS.RdBtnVendedorClick(Sender: TObject);
begin
  configuraConsulta;
end;

procedure TfrmOS.BtnNovaClick(Sender: TObject);
begin
  frmIncluirOS := TfrmIncluirOS.Create(self);
  frmIncluirOS.operacao := 1;
  frmIncluirOS.ShowModal;
  FreeAndNil(frmIncluirOS);
  mostraOS;
end;

procedure TfrmOS.BtnAlterarOSClick(Sender: TObject);
begin
  if cdsOS.FieldByName('status').AsString = 'F' then
    begin
      MessageDlg('A O.S. já está faturada, para realizar a alteração, cancele o faturamento!',mtWarning,[mbOk],0);
      Exit;
    end;   

  frmIncluirOS := TfrmIncluirOS.Create(self);
  frmIncluirOS.codOS := cdsOS.FieldByName('codigo').AsInteger;
  frmIncluirOS.operacao := 2;
  frmIncluirOS.operacaoItens := 2;
  frmIncluirOS.ShowModal;
  FreeAndNil(frmIncluirOS);
  mostraOS;
end;

procedure TfrmOS.BtnCancelarOSClick(Sender: TObject);
begin
  if cdsOS.FieldByName('codigo').AsInteger > 0 then
    begin
      with qryOS, SQL do
        begin
          Close;
          Clear;
          Add('UPDATE OS SET STATUS = :status WHERE codigo = :cod');
          ParamByName('status').AsString := 'C'; // CANCELADA
          ParamByName('cod').AsInteger   := cdsOS.FieldByName('codigo').AsInteger;
          ExecSQL();
        end;
    end;

  mostraOS;
end;

procedure TfrmOS.BtnExcluirOSClick(Sender: TObject);
begin
  if cdsOS.FieldByName('codigo').AsInteger > 0 then
    begin
      with qryOS, SQL do
        begin
          Close;
          Clear;
          Add('DELETE FROM os WHERE codigo = :cod');
          ParamByName('cod').AsInteger := cdsOS.FieldByName('codigo').AsInteger;
          ExecSQL();
        end;

    end;

  mostraOS;
end;

procedure TfrmOS.BtnFecharOSClick(Sender: TObject);
begin
  frmFaturamentoOS := TfrmFaturamentoOS.Create(self);
  frmFaturamentoOS.codOS      := cdsOS.FieldByName('codigo').AsInteger;
  frmFaturamentoOS.codCliente := cdsOS.FieldByname('codcliente').AsInteger;
  frmFaturamentoOS.lblVlrSubTotal.Caption := cdsOS.FieldByName('subtotal').AsString;
  frmFaturamentoOS.lblVlrTotal.Caption    := cdsOS.FieldByName('subtotal').AsString;

  try
    frmFaturamentoOS.lblVlrSubTotal.Caption := FormatFloat('##,###,##0.00',StrToFloat(frmFaturamentoOS.lblVlrSubTotal.Caption));
    frmFaturamentoOS.lblVlrTotal.Caption    := FormatFloat('##,###,##0.00',StrToFloat(frmFaturamentoOS.lblVlrTotal.Caption));
  except

  end;

  frmFaturamentoOS.ShowModal;
  FreeAndNil(frmFaturamentoOS);

  mostraOS;
end;

procedure TfrmOS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TfrmOS.BtnImprimirClick(Sender: TObject);
var
  { ESSAS VÁRIÁVEIS RECEBEM VERDADEIRO OU FALSO REREFERENTE SE EXISTE OU NÃO CONDIÇÃO DE PAGAMENTO
    VINCULADA COM A OS E TAMBÉM SE EXISTE ALGUMA PARCELA VINCULADA A OS, SE NÃO EXISTIR VÍNCULO
    NÃO INCLUI OS CAMPOS NO SELECT ABAIXO }
  bCondPgto: Boolean;
begin
  bCondPgto := False;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT codcondicaopgto FROM os');
  qryAux.SQL.Add('WHERE codigo = :cod');
  qryAux.ParamByName('cod').AsInteger := cdsOS.FieldByName('codigo').AsInteger;
  qryAux.Open;
  cdsAux.Close;
  cdsAux.Open;

  if cdsAux.FieldByName('codcondicaopgto').AsInteger > 0 then
    bCondPgto := True;

  qryOSRel.Close;
  qryOSRel.SQL.Clear;
  qryOSRel.SQL.Add('SELECT os.codigo AS Codigo, os.codcliente AS CodCliente,                        ');
  qryOSRel.SQL.Add('cli.nome AS NomeCli, cli.fone1 AS FoneCli, os.dataabertura AS Abertura,         ');
  qryOSRel.SQL.Add('os.previsaofechamento AS PrevFech, os.datafechada AS DataFech,                  ');
  qryOSRel.SQL.Add('os.subtotal AS SubTotal, os.desconto AS Desconto, os.valortotal AS VlrTotal,    ');
  qryOSRel.SQL.Add('os.status AS Status, os.osbloco, fun.nome AS Vendedor,                          ');
  qryOSRel.SQL.Add('it.codigo AS CodItem, equip.descricao AS Equipamento,                           ');
  qryOSRel.SQL.Add('it.codfuncionario AS CodFun, it.horainicial AS Inicial, it.horafinal AS Final,  ');
  qryOSRel.SQL.Add('it.qtdhoras AS Horas, it.valorhora AS Valor, it.total AS Total,it.datacad       ');

  if bCondPgto = true then
    qryOSRel.SQL.Add(',cond.descricao AS CondPgto                                                   ');

  qryOSRel.SQL.Add('FROM os                                                                         ');
  qryOSRel.SQL.Add('INNER JOIN clientes cli                                                         ');
  qryOSRel.SQL.Add('ON cli.codigo = os.codcliente                                                   ');
  qryOSRel.SQL.Add('INNER JOIN funcionarios fun                                                     ');
  qryOSRel.SQL.Add('ON fun.codigo = os.codvendedor                                                  ');

  if bCondPgto = true then
    begin
      qryOSRel.SQL.Add('INNER JOIN condicoespgto cond                                                   ');
      qryOSRel.SQL.Add('ON cond.codigo = os.codcondicaopgto                                             ');
    end;

  qryOSRel.SQL.Add('INNER JOIN itensos it                                                           ');
  qryOSRel.SQL.Add('ON it.codos = os.codigo                                                         ');
  qryOSRel.SQL.Add('INNER JOIN equipamentos equip                                                   ');
  qryOSRel.SQL.Add('ON equip.codigo = it.codequipamento                                             ');
  qryOSRel.SQL.Add('WHERE os.codigo = :cod AND it.codos = :cod                                      ');
  qryOSRel.SQL.Add('ORDER BY os.codigo                                                              ');
  qryOSRel.ParamByName('cod').AsInteger := cdsOS.FieldByName('codigo').AsInteger;
  qryOSRel.Open;
  cdsOSRel.Close;
  cdsOSRel.Open;

  qryParcelas.Close;
  qryParcelas.SQL.Clear;
  qryParcelas.SQL.Add('SELECT vencimento, valor FROM contasreceber');
  qryParcelas.SQL.Add('WHERE codos = :os');
  qryParcelas.SQL.Add('AND renegociada IS NULL');
  qryParcelas.SQL.Add('ORDER BY vencimento');
  qryParcelas.ParamByName('os').AsInteger := cdsOS.FieldByName('codigo').AsInteger;
  qryParcelas.Open;
  cdsParcelas.Close;
  cdsParcelas.Open;

  frmRelOS := TfrmRelOS.Create(self);

  frmRelOS.CODIGO.DataField     := 'CODIGO';
  frmRelOS.CODCLIENTE.DataField := 'CODCLIENTE';
  frmRelOS.NOMECLI.DataField    := 'NOMECLI';
  frmRelOS.FONECLI.DataField    := 'FONECLI';
  frmRelOS.ABERTURA.DataField   := 'ABERTURA';
  frmRelOS.PREVFECH.DataField   := 'PREVFECH';
  frmRelOS.DATAFECH.DataField   := 'DATAFECH';
  frmRelOS.SUBTOTAL.DataFormula := 'SUBTOTAL';
  frmRelOS.DESCONTO.DataFormula := 'DESCONTO';
  frmRelOS.VLRTOTAL.DataFormula := 'VLRTOTAL';
  frmRelOS.VENDEDOR.DataField   := 'VENDEDOR';
  frmRelOS.STATUS.DataField     := 'STATUS';
  frmRelOS.OSBLOCO.DataField    := 'OSBLOCO';

  if bCondPgto = true then
    frmRelOS.CONDPGTO.DataField := 'CONDPGTO';

  frmRelOS.CODITEM.DataField      := 'CODITEM';
  frmRelOS.CODFUN.DataField       := 'CODFUN';
  frmRelOS.EQUIPAMENTO.DataField  := 'EQUIPAMENTO';
  frmRelOS.INICIAL.DataField      := 'INICIAL';
  frmRelOS.FINAL.DataField        := 'FINAL';
  frmRelOS.HORAS.DataField        := 'HORAS';
  frmRelOS.VALOR.DataFormula      := 'VALOR';
  frmRelOS.TOTAL.DataFormula      := 'TOTAL';
  frmRelOS.DATACAD.DataField      := 'DATACAD';

  frmRelOS.VCTO.DataField         := 'VENCIMENTO';
  frmRelOS.PARCELA.DataFormula    := 'VALOR';

  try
    frmRelOS.RlRptOS.Preview();
  finally
    FreeAndNil(frmRelOS);
  end;
end;

procedure TfrmOS.RdBtnTodosClick(Sender: TObject);
begin
  configuraConsulta;
end;

procedure TfrmOS.BtnRelatorioClick(Sender: TObject);
begin
  frmRelacaoOS := TfrmRelacaoOS.Create(self);
  frmRelacaoOS.Inicial.Caption := mskInicial.Text;
  frmRelacaoOS.Final.Caption   := mskFinal.Text;

  if RdBtnCliente.Checked = true then
    frmRelacaoOS.Tipo.Caption := 'Por Cliente';

  if RdBtnVendedor.Checked = true then
    frmRelacaoOS.Tipo.Caption := 'Por Vendedor';

  if RdBtnTodos.Checked = true then
    frmRelacaoOS.Tipo.Caption := 'Todos';

  frmRelacaoOS.CODIGO.DataField     := 'CODIGO';
  frmRelacaoOS.ABERTURA.DataField   := 'DATAABERTURA';
  frmRelacaoOS.FECHAMENTO.DataField := 'DATAFECHADA';
  frmRelacaoOS.CLIENTE.DataField    := 'CLIENTE';
  frmRelacaoOS.VENDEDOR.DataField   := 'VENDEDOR';
  frmRelacaoOS.VALOR.DataFormula    := 'VALORTOTAL';
  frmRelacaoOS.STATUS.DataField     := 'STATUS';
  frmRelacaoOS.OSBLOCO.DataField    := 'OSBLOCO';

  frmRelacaoOS.ABERTAS.Text     := FormatFloat('#0.00',Abertas);
  frmRelacaoOS.CANCELADAS.Text  := FormatFloat('#0.00',Canceladas);
  frmRelacaoOS.FECHADAS.Text    := FormatFloat('#0.00',Fechadas);

  frmRelacaoOS.RlRpt.Preview();
  FreeAndNil(frmRelacaoOS);
end;

procedure TfrmOS.BtnEstornaLancamentosClick(Sender: TObject);
var
  codLancCaixa: integer;
begin
  try
    qryParcelas.Close;
    qryParcelas.SQL.Clear;
    qryParcelas.SQL.Add('SELECT * FROM contasreceber');
    qryParcelas.SQL.Add('WHERE codos = :os');
    qryParcelas.ParamByName('os').AsInteger := cdsOS.FieldByName('codigo').AsInteger;
    qryParcelas.Open;
    cdsParcelas.Close;
    cdsParcelas.Open;
    cdsParcelas.First;

    while not(cdsParcelas.Eof) do
      begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT codigo,codlancamentocaixa FROM historicocontareceber');
        qryAux.SQL.Add('WHERE codcontareceber = :cr');
        qryAux.ParamByName('cr').AsInteger := cdsParcelas.FieldByName('codigo').AsInteger;
        qryAux.Open;
        cdsAux.Close;
        cdsAux.Open;
        qryAux.First;

        while not(qryAux.Eof) do
          begin
            if (MessageDlg('Existem valores já pagos desta O.S., deseja estornar isso também?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
              begin
                codLancCaixa := qryAux.FieldByName('codlancamentocaixa').AsInteger;
                if codLancCaixa > 0 then
                  begin
                    qryHistorico.Close;
                    qryHistorico.SQL.Clear;
                    qryHistorico.SQL.Add('DELETE FROM caixa');
                    qryHistorico.SQL.Add('WHERE codigo = :cx');
                    qryHistorico.ParamByName('cx').AsInteger := qryAux.FieldByName('CODLANCAMENTOCAIXA').AsInteger;
                    qryHistorico.ExecSQL();
                  end;

                qryHistorico.Close;
                qryHistorico.SQL.Clear;
                qryHistorico.SQL.Add('DELETE FROM historicocontareceber');
                qryHistorico.SQL.Add('WHERE codigo = :cod');
                qryHistorico.ParamByName('cod').AsInteger := qryAux.FIeldByName('codigo').AsInteger;
                qryHistorico.ExecSQL();
              end;

            qryAux.Next;
          end;

        cdsParcelas.Next;
      end;

    if (MessageDlg('Deseja também excluir todas as parcelas se ainda existentes?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
      begin
        qryParcelas.Close;
        qryParcelas.SQL.Clear;
        qryParcelas.SQL.Add('DELETE FROM contasreceber');
        qryParcelas.SQL.Add('WHERE codos = :os');
        qryParcelas.ParamByName('os').AsInteger := cdsOS.FieldByName('codigo').AsInteger;
        qryParcelas.ExecSQL();

        qryOS.Close;
        qryOS.SQL.Clear;
        qryOS.SQL.Add('UPDATE os SET status = :sta');
        qryOS.SQL.Add('WHERE codigo = :cod');
        qryOS.ParamByName('sta').AsString := 'A';
        qryOS.ParamByName('cod').AsInteger := cdsOS.FieldByname('codigo').AsInteger;
        qryOS.Prepared := True;
        qryOS.ExecSQL();
      end;

    mostraOS;
  except
    MessageDlg('Erro ao cancelar financeiro da O.S.!',mtError,[mbOk],0);
  end;
end;

function TfrmOS.validaConsultar: boolean;
var
  bRetorno: boolean;
begin
  bRetorno := False;

  if (RdBtnCodigo.Checked = true) then
    begin
      if (edtCodPessoa.Text <> trim('')) then
        bRetorno := True;
    end;

  if (RdBtnVendedor.Checked = true) then
    begin
      if (edtCodPessoa.Text <> trim('')) then
        bRetorno := True;
    end;

  if (RdBtnCliente.Checked = true) then
    begin
      if (edtCodPessoa.Text <> trim('')) then
        bRetorno := True;
    end;

  if (RdBtnTodos.Checked = true) then
    begin
      edtCodPessoa.Clear;
      bRetorno := True;
    end;

  if (bRetorno = false) then
    MessageDlg('Dados inconsistentes para consulta!',mtWarning,[mbOk],0);

  Result := bRetorno;
end;

procedure TfrmOS.GrdOrdensDblClick(Sender: TObject);
begin
  BtnAlterarOSClick(self);
end;

procedure TfrmOS.GrdOrdensTitleClick(Column: TColumn);
begin
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  BtnConsultarClick(self);
end;

procedure TfrmOS.BtnVisualizarClick(Sender: TObject);
begin
  try
    frmIncluirOS := TfrmIncluirOS.Create(self);
    frmIncluirOS.codOS := cdsOS.FieldByName('codigo').AsInteger;
    frmIncluirOS.operacao := 3; // visualizar
    frmIncluirOS.ShowModal;
  finally
    FreeAndNil(frmIncluirOS);
  end;
end;

end.
