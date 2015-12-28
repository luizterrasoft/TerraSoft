unit unAbastecimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, Grids, DBGrids, FMTBcd,
  SqlExpr, Provider, DB, DBClient, unFuncoes;

type
  TfrmAbastecimentos = class(TForm)
    PnConsulta: TPanel;
    PnAbastecimentos: TPanel;
    PnBotoes: TPanel;
    Label1: TLabel;
    edtCodTipoCombustivel: TEdit;
    BtnBuscaTipoCombustivel: TBitBtn;
    Label2: TLabel;
    lblTipoCombustivel: TLabel;
    edtCodEquipamento: TEdit;
    BtnBuscaEquipamento: TBitBtn;
    lblEquipamento: TLabel;
    Label3: TLabel;
    edtCodFornecedor: TEdit;
    BtnBuscaFornecedor: TBitBtn;
    lblFornecedor: TLabel;
    Label4: TLabel;
    edtCodFuncionario: TEdit;
    BtnBuscaFuncionario: TBitBtn;
    lblFuncionario: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    mskInicial: TMaskEdit;
    mskFinal: TMaskEdit;
    BtnConsultar: TBitBtn;
    BtnRelatorio: TBitBtn;
    BtnIncluir: TBitBtn;
    BtnVisualizar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnMarcar: TBitBtn;
    BtnSair: TBitBtn;
    GrdAbastecimentos: TDBGrid;
    BtnDesmarcar: TBitBtn;
    BtnMarcarTodos: TBitBtn;
    BtnDesmarcarTodos: TBitBtn;
    BtnFechar: TBitBtn;
    dsAbastecimentos: TDataSource;
    cdsAbastecimentos: TClientDataSet;
    dspAbastecimentos: TDataSetProvider;
    qryAbastecimentos: TSQLQuery;
    dsAux: TDataSource;
    cdsAux: TClientDataSet;
    dspAux: TDataSetProvider;
    qryAux: TSQLQuery;
    BtnFaturarMarcadas: TBitBtn;
    RdGrpSituacao: TRadioGroup;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodTipoCombustivelExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure edtCodTipoCombustivelEnter(Sender: TObject);
    procedure edtCodEquipamentoEnter(Sender: TObject);
    procedure edtCodEquipamentoExit(Sender: TObject);
    procedure edtCodFornecedorEnter(Sender: TObject);
    procedure edtCodFornecedorExit(Sender: TObject);
    procedure edtCodFuncionarioEnter(Sender: TObject);
    procedure edtCodFuncionarioExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnBuscaTipoCombustivelClick(Sender: TObject);
    procedure BtnBuscaEquipamentoClick(Sender: TObject);
    procedure BtnBuscaFornecedorClick(Sender: TObject);
    procedure BtnBuscaFuncionarioClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnMarcarClick(Sender: TObject);
    procedure GrdAbastecimentosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BtnDesmarcarClick(Sender: TObject);
    procedure BtnDesmarcarTodosClick(Sender: TObject);
    procedure BtnMarcarTodosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFecharClick(Sender: TObject);
  private

    loFuncoes: TFuncoes;
    procedure mostraAbastecimentos;
    procedure carregaDados;
    procedure FechaAbastecimento;
  public
    { Public declarations }
  end;

var
  frmAbastecimentos: TfrmAbastecimentos;

implementation

uses unDM, unIncluirAbastecimento, unTiposCombustiveis, unEquipamentos,
  unFornecedores, unFuncionarios, unFaturamentoManu;

{$R *.dfm}

procedure TfrmAbastecimentos.BtnBuscaEquipamentoClick(Sender: TObject);
begin
  frmEquipamentos := TfrmEquipamentos.Create(self);
  frmEquipamentos.telaChamando := 12;
  frmEquipamentos.ShowModal;
  FreeAndNil(frmEquipamentos);

  if lblEquipamento.Caption <> trim('') then
    edtCodFornecedor.SetFocus;
end;

procedure TfrmAbastecimentos.BtnBuscaFornecedorClick(Sender: TObject);
begin
  frmFornecedores := TfrmFornecedores.Create(self);
  frmFornecedores.telaChamando := 10;
  frmFornecedores.ShowModal;
  FreeAndNil(frmFornecedores);

  if lblFornecedor.Caption <> trim('') then
    edtCodFuncionario.SetFocus;
end;

procedure TfrmAbastecimentos.BtnBuscaFuncionarioClick(Sender: TObject);
begin
  frmFuncionarios := TfrmFuncionarios.Create(self);
  frmFuncionarios.telaChamando := 8;
  frmFuncionarios.ShowModal;
  FreeAndNil(frmFuncionarios);

  if lblFuncionario.Caption <> trim('') then
    mskInicial.SetFocus;
end;

procedure TfrmAbastecimentos.BtnBuscaTipoCombustivelClick(Sender: TObject);
begin
  frmTiposCombustiveis := TfrmTiposCombustiveis.Create(self);
  frmTiposCombustiveis.telaChamando := 2;
  frmTiposCombustiveis.ShowModal;
  FreeAndNil(frmTiposCombustiveis);

  if lblTipoCombustivel.Caption <> trim('') then
    edtCodEquipamento.SetFocus;
end;

procedure TfrmAbastecimentos.BtnConsultarClick(Sender: TObject);
begin
  mostraAbastecimentos;
end;

procedure TfrmAbastecimentos.BtnDesmarcarClick(Sender: TObject);
var
  iCodAbastecimento: integer;
begin
  try
    if cdsAbastecimentos.FieldByName('codigo').AsInteger > 0 then
      begin
        iCodAbastecimento := cdsAbastecimentos.FieldByName('codigo').AsInteger;

        qryAbastecimentos.Close;
        qryAbastecimentos.SQL.Clear;
        qryAbastecimentos.SQL.Add('UPDATE abastecimentos SET marcada=0');
        qryAbastecimentos.SQL.Add('WHERE codigo = :cod');
        qryAbastecimentos.ParamByName('cod').AsInteger := iCodAbastecimento;
        qryAbastecimentos.Prepared := True;
        qryAbastecimentos.ExecSQL();

        mostraAbastecimentos;
      end;
  except
    on e: Exception do
    raise Exception.Create('N�o foi poss�vel marcar o abastecimento selecionado!' + #13 + e.Message);
  end;
end;

procedure TfrmAbastecimentos.BtnDesmarcarTodosClick(Sender: TObject);
begin
  try
    qryAbastecimentos.Close;
    qryAbastecimentos.SQL.Clear;
    qryAbastecimentos.SQL.Add('UPDATE abastecimentos SET marcada = null');
    qryAbastecimentos.SQL.Add('WHERE marcada > 0');
    qryAbastecimentos.Prepared := True;
    qryAbastecimentos.ExecSQL();
    mostraAbastecimentos;
  except
    on e: Exception do
    raise Exception.Create('N�o foi poss�vel desmarcar todos os abastecimentos!' + #13 + e.Message);
  end;
end;

procedure TfrmAbastecimentos.BtnExcluirClick(Sender: TObject);
var
  iCodAbastecimento: integer;
begin
  iCodAbastecimento := cdsAbastecimentos.FieldByName('codigo').AsInteger;

  if iCodAbastecimento < 1 then
    begin
      MessageDlg('Nenhum abastecimento selecionado para ser exclu�do!',mtWarning,[mbOk],0);
      Exit;
    end;

  if (MessageDlg('Deseja realmente excluir o abastecimento?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
    begin
      qryAbastecimentos.Close;
      qryAbastecimentos.SQL.Clear;
      qryAbastecimentos.SQL.Add('DELETE FROM abastecimentos');
      qryAbastecimentos.SQL.Add('WHERE codigo = :cod');
      qryAbastecimentos.ParamByName('cod').AsInteger := iCodAbastecimento;
      qryAbastecimentos.Prepared := True;
      qryAbastecimentos.ExecSQL();
    end;

  mostraAbastecimentos;
end;

procedure TfrmAbastecimentos.BtnFecharClick(Sender: TObject);
begin
  if cdsAbastecimentos.FieldByName('codigo').AsInteger < 1 then
    begin
      MessageDlg('Nenhum abastecimento selecionado para faturar!',mtWarning,[mbOk],0);
      Exit;
    end;

  frmFaturamentoManu                      := TfrmFaturamentoManu.Create(self);
  frmFaturamentoManu.CodSubPlano          := cdsAbastecimentos.FieldByName('codsubplanoconta').AsInteger;
  frmFaturamentoManu.CodPlano             := cdsAbastecimentos.FieldByName('codplanoconta').AsInteger;
  frmFaturamentoManu.sNotaFiscal          := cdsAbastecimentos.FieldByName('documento').AsString;
  frmFaturamentoManu.codFornecedor        := cdsAbastecimentos.FieldByName('codfornecedor').AsInteger;
  frmFaturamentoManu.codManutencao        := cdsAbastecimentos.FieldByName('codigo').AsInteger;
  frmFaturamentoManu.lblVlrTotal.Caption  := loFuncoes.TrataReal(cdsAbastecimentos.FieldByName('total').AsString);
  frmFaturamentoManu.sDescricao           := 'ABASTECIMENTO ' + cdsAbastecimentos.FieldByName('codigo').AsString;
  frmFaturamentoManu.iTipo                := 2; // Abastecimento
  frmFaturamentoManu.ShowModal;
  FreeAndNil(frmFaturamentoManu);

  FechaAbastecimento;

  mostraAbastecimentos;
end;

procedure TfrmAbastecimentos.BtnIncluirClick(Sender: TObject);
begin
  try
    frmIncluirAbastecimento := TfrmIncluirAbastecimento.Create(self);
    frmIncluirAbastecimento.iOpc := 1;
    frmIncluirAbastecimento.ShowModal;
  finally
    FreeAndNil(frmIncluirAbastecimento);
    mostraAbastecimentos;
  end;
end;

procedure TfrmAbastecimentos.BtnMarcarClick(Sender: TObject);
var
  iCodAbastecimento: integer;
begin
  try
    if cdsAbastecimentos.FieldByName('codigo').AsInteger > 0 then
      begin
        iCodAbastecimento := cdsAbastecimentos.FieldByName('codigo').AsInteger;

        qryAbastecimentos.Close;
        qryAbastecimentos.SQL.Clear;
        qryAbastecimentos.SQL.Add('UPDATE abastecimentos SET marcada=1');
        qryAbastecimentos.SQL.Add('WHERE codigo = :cod');
        qryAbastecimentos.ParamByName('cod').AsInteger := iCodAbastecimento;
        qryAbastecimentos.Prepared := True;
        qryAbastecimentos.ExecSQL();

        mostraAbastecimentos;
      end;
  except
    on e: Exception do
    raise Exception.Create('N�o foi poss�vel marcar o abastecimento selecionado!' + #13 + e.Message);
  end;

end;

procedure TfrmAbastecimentos.BtnMarcarTodosClick(Sender: TObject);
begin
  try
    cdsAbastecimentos.First;

    while not(cdsAbastecimentos.Eof) do
      begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('UPDATE abastecimentos SET marcada = 1');
        qryAux.SQL.Add('WHERE codigo = :cod');
        qryAux.ParamByName('cod').AsInteger := cdsAbastecimentos.FieldByName('codigo').AsInteger;
        qryAux.Prepared := True;
        qryAux.ExecSQL();

        cdsAbastecimentos.Next;
      end;

    mostraAbastecimentos;
  except
    on e: Exception do
    raise Exception.Create('N�o foi poss�vel marcar todos os abastecimentos!' + #13 + e.Message);
  end;
end;

procedure TfrmAbastecimentos.BtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmAbastecimentos.BtnVisualizarClick(Sender: TObject);
begin
  try
    frmIncluirAbastecimento := TfrmIncluirAbastecimento.Create(self);
    frmIncluirAbastecimento.iOpc := 0;
    carregaDados;
    frmIncluirAbastecimento.ShowModal;
  finally
    FreeAndNil(frmIncluirAbastecimento);
  end;
end;

procedure TfrmAbastecimentos.carregaDados;
begin
  frmIncluirAbastecimento.edtCodTipoCombustivel.Text  := cdsAbastecimentos.FieldByName('codtipocombustivel').AsString;
  frmIncluirAbastecimento.lblTipoCombustivel.Caption  := cdsAbastecimentos.FieldByName('TIPO').AsString;
  frmIncluirAbastecimento.edtCodEquipamento.Text      := cdsAbastecimentos.FieldByName('codequipamento').AsString;
  frmIncluirAbastecimento.lblEquipamento.Caption      := cdsAbastecimentos.FieldByName('equipamento').AsString;
  frmIncluirAbastecimento.edtCodFornecedor.Text       := cdsAbastecimentos.FieldByName('codfornecedor').AsString;
  frmIncluirAbastecimento.lblFornecedor.Caption       := cdsAbastecimentos.FieldByName('razaosocial').AsString;
  frmIncluirAbastecimento.edtCodFuncionario.Text      := cdsAbastecimentos.FieldByName('codfuncionario').AsString;
  frmIncluirAbastecimento.lblFuncionario.Caption      := cdsAbastecimentos.FieldByName('nome').AsString;
  frmIncluirAbastecimento.edtQtd.Text                 := cdsAbastecimentos.FieldByName('qtd').AsString;
  frmIncluirAbastecimento.edtVlrUnit.Text             := loFuncoes.TrataReal(cdsAbastecimentos.FieldByName('vlrunit').AsString);
  frmIncluirAbastecimento.edtVlrTotal.Text            := loFuncoes.TrataReal(cdsAbastecimentos.FieldByName('total').AsString);
  frmIncluirAbastecimento.mskDataAbast.Text           := cdsAbastecimentos.FieldByName('dataabastecimento').AsString;
  frmIncluirAbastecimento.edtKMHora.Text              := cdsAbastecimentos.FieldByName('kmhr').AsString;
  frmIncluirAbastecimento.RchEdtObs.Text              := cdsAbastecimentos.FieldByName('obs').AsString;

end;

procedure TfrmAbastecimentos.edtCodEquipamentoEnter(Sender: TObject);
begin
  lblEquipamento.Caption := '';
end;

procedure TfrmAbastecimentos.edtCodEquipamentoExit(Sender: TObject);
begin
  if edtCodEquipamento.Text <> trim('') then
    begin
      lblEquipamento.Caption := loFuncoes.BuscaFk(edtCodEquipamento.Text,'equipamentos','descricao');

      if lblEquipamento.Caption = trim('') then
        begin
          edtCodEquipamento.Clear;
          BtnBuscaEquipamento.SetFocus;
        end
      else
        edtCodFornecedor.SetFocus;
    end;
end;

procedure TfrmAbastecimentos.edtCodFornecedorEnter(Sender: TObject);
begin
  lblFornecedor.Caption := '';
end;

procedure TfrmAbastecimentos.edtCodFornecedorExit(Sender: TObject);
begin
  if edtCodFornecedor.Text <> trim('') then
    begin
      lblFornecedor.Caption := loFuncoes.BuscaFk(edtCodFornecedor.Text,'fornecedores','razaosocial');

      if lblFornecedor.Caption = trim('') then
        begin
          edtCodFornecedor.Clear;
          BtnBuscaFornecedor.SetFocus;
        end
      else
        edtCodFuncionario.SetFocus;
    end;
end;

procedure TfrmAbastecimentos.edtCodFuncionarioEnter(Sender: TObject);
begin
  lblFuncionario.Caption := '';

end;

procedure TfrmAbastecimentos.edtCodFuncionarioExit(Sender: TObject);
begin
  if edtCodFuncionario.Text <> trim('') then
    begin
      lblFuncionario.Caption := loFuncoes.BuscaFk(edtCodFuncionario.Text,'funcionarios','nome');

      if lblFuncionario.Caption = trim('') then
        begin
          edtCodFuncionario.Clear;
          BtnBuscaFuncionario.SetFocus;
        end
      else
        mskInicial.SetFocus;
    end;
end;

procedure TfrmAbastecimentos.edtCodTipoCombustivelEnter(Sender: TObject);
begin
  lblTipoCombustivel.Caption := '';
end;

procedure TfrmAbastecimentos.edtCodTipoCombustivelExit(Sender: TObject);
begin
  if edtCodTipoCombustivel.Text <> trim('') then
    begin
      lblTipoCombustivel.Caption := loFuncoes.BuscaFk(edtCodTipoCombustivel.Text,'tiposcombustiveis','descricao');

      if lblTipoCombustivel.Caption = trim('') then
        begin
          edtCodTipoCombustivel.Clear;
          BtnBuscaTipoCombustivel.SetFocus;
        end
      else
        edtCodEquipamento.SetFocus;
    end;
end;

procedure TfrmAbastecimentos.FechaAbastecimento;
begin
  try
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('UPDATE abastecimentos SET status = :sta');
    qryAux.sql.Add('WHERE codigo = :cod');
    qryAux.ParamByName('sta').AsString := 'F';
    qryAux.ParamByName('cod').AsInteger:= cdsAbastecimentos.FieldByName('codigo').AsInteger;
    qryAux.ExecSQL();
  except
    on e: Exception do
    raise Exception.Create('N�o foi poss�vel fechar o abastecimento!' + #13 + e.Message);
  end;
end;

procedure TfrmAbastecimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  BtnDesmarcarTodosClick(self);
end;

procedure TfrmAbastecimentos.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;

  BtnDesmarcarTodosClick(self);
end;

procedure TfrmAbastecimentos.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmAbastecimentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BtnSairClick(self);
end;

procedure TfrmAbastecimentos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TfrmAbastecimentos.FormShow(Sender: TObject);
begin
  mostraAbastecimentos;
end;

procedure TfrmAbastecimentos.GrdAbastecimentosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if State = [] then
  begin
    if cdsAbastecimentos.FieldByName('marcada').AsInteger = 1 then
      GrdAbastecimentos.Canvas.Brush.Color := $007D7DFF
    else
      GrdAbastecimentos.Canvas.Brush.Color := clWindow;
  end;
  GrdAbastecimentos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmAbastecimentos.mostraAbastecimentos;
begin
  try
    qryAbastecimentos.Close;
    qryAbastecimentos.SQL.Clear;
    qryAbastecimentos.SQL.Add('SELECT aba.codigo, tp.descricao AS TIPO,');
    qryAbastecimentos.SQL.Add('equi.descricao AS EQUIPAMENTO, forn.razaosocial, aba.qtd,');
    qryAbastecimentos.SQL.Add('aba.dataabastecimento,fun.nome, aba.kmhr, aba.obs, aba.vlrunit,');
    qryAbastecimentos.SQL.Add('aba.total, aba.codtipocombustivel, aba.codfornecedor, aba.codfuncionario,');
    qryAbastecimentos.SQL.Add('aba.codequipamento, aba.marcada, aba.codsubplanoconta, aba.codplanoconta, aba.documento');
    qryAbastecimentos.SQL.Add('FROM abastecimentos aba');
    qryAbastecimentos.SQL.Add('INNER JOIN tiposcombustiveis tp');
    qryAbastecimentos.SQL.Add('ON tp.codigo = aba.codtipocombustivel');
    qryAbastecimentos.SQL.Add('INNER JOIN equipamentos equi');
    qryAbastecimentos.SQL.Add('ON equi.codigo = aba.codequipamento');
    qryAbastecimentos.SQL.Add('INNER JOIN fornecedores forn');
    qryAbastecimentos.SQL.Add('ON forn.codigo = aba.codfornecedor');
    qryAbastecimentos.SQL.Add('INNER JOIN funcionarios fun');
    qryAbastecimentos.SQL.Add('ON fun.codigo = aba.codfuncionario');
    qryAbastecimentos.SQL.Add('WHERE aba.dataabastecimento BETWEEN :dtini AND :dtfin');

    if RdGrpSituacao.ItemIndex < 2 then //  se n�o for TODOS
      qryAbastecimentos.SQL.Add('AND aba.status = :sta');

    if (edtCodTipoCombustivel.Text <> trim('')) and (edtCodTipoCombustivel.Text <> trim('0')) then
      qryAbastecimentos.SQL.Add('AND tp.codigo = :tp');

    if (edtCodEquipamento.Text <> trim('')) and (edtCodEquipamento.Text <> trim('0')) then
      qryAbastecimentos.SQL.Add('AND equi.codigo = :eq');

    if (edtCodFornecedor.Text <> trim('')) and (edtCodFornecedor.Text <> trim('0')) then
      qryAbastecimentos.SQL.Add('AND forn.codigo = :fo');

    if (edtCodFuncionario.Text <> trim('')) and (edtCodFuncionario.Text <> trim('0')) then
      qryAbastecimentos.SQL.Add('AND fun.codigo = :fu');

    qryAbastecimentos.ParamByName('dtini').AsDate := StrToDate(mskInicial.Text);
    qryAbastecimentos.ParamByName('dtfin').AsDate := StrToDate(mskFinal.Text);

    if (edtCodTipoCombustivel.Text <> trim('')) and (edtCodTipoCombustivel.Text <> trim('0')) then
      qryAbastecimentos.ParamByName('tp').AsInteger := StrToInt(edtCodTipoCombustivel.Text);

    if (edtCodEquipamento.Text <> trim('')) and (edtCodEquipamento.Text <> trim('0')) then
      qryAbastecimentos.ParamByName('eq').AsInteger := StrToInt(edtCodEquipamento.Text);

    if (edtCodFornecedor.Text <> trim('')) and (edtCodFornecedor.Text <> trim('0')) then
      qryAbastecimentos.ParamByName('fo').AsInteger := StrToInt(edtCodFornecedor.Text);

    if (edtCodFuncionario.Text <> trim('')) and (edtCodFuncionario.Text <> trim('0')) then
      qryAbastecimentos.ParamByName('fu').AsInteger := StrToInt(edtCodFuncionario.Text);

    case RdGrpSituacao.ItemIndex of
      0: qryAbastecimentos.ParamByName('sta').AsString := 'A';

      1: qryAbastecimentos.ParamByName('sta').AsString := 'F';
    end;

    qryAbastecimentos.Open;
    cdsAbastecimentos.Close;
    cdsAbastecimentos.Open;

  TNumericField(cdsAbastecimentos.FieldByName('total')).DisplayFormat := ',0.00';
  except
    on e: Exception do
    raise Exception.Create('N�o foi poss�vel consultar os abastecimentos!' + #13 + e.Message);
  end;
end;



end.
