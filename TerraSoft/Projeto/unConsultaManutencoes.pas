unit unConsultaManutencoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, Grids, DBGrids, FMTBcd,
  SqlExpr, Provider, DB, DBClient, unFuncoes;

type
  TfrmConsultaManutencoes = class(TForm)
    PnTopo: TPanel;
    PnDados: TPanel;
    PnRodape: TPanel;
    Inicial: TLabel;
    Final: TLabel;
    mskInicial: TMaskEdit;
    mskFinal: TMaskEdit;
    BtnConsultar: TBitBtn;
    BtnIncluir: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnSair: TBitBtn;
    BtnFaturar: TBitBtn;
    GrdManutencoes: TDBGrid;
    dsManu: TDataSource;
    cdsManu: TClientDataSet;
    dspManu: TDataSetProvider;
    qryManu: TSQLQuery;
    Label2: TLabel;
    RdBtnAberta: TRadioButton;
    RdBtnFaturada: TRadioButton;
    Bevel1: TBevel;
    Label1: TLabel;
    edtCodEquipamento: TEdit;
    BtnBuscaEquipamento: TBitBtn;
    lblEquipamento: TLabel;
    BtnCancelarFaturamento: TBitBtn;
    dsParcelas: TDataSource;
    cdsParcelas: TClientDataSet;
    dspParcelas: TDataSetProvider;
    qryParcelas: TSQLQuery;
    dsAux: TDataSource;
    cdsAux: TClientDataSet;
    dspAux: TDataSetProvider;
    qryAux: TSQLQuery;
    dsHistorico: TDataSource;
    cdsHistorico: TClientDataSet;
    dspHistorico: TDataSetProvider;
    qryHistorico: TSQLQuery;
    Bevel2: TBevel;
    Label3: TLabel;
    CbxTipo: TComboBox;
    RdBtnTodos: TRadioButton;
    Label4: TLabel;
    BtnVisualizar: TBitBtn;
    lblNotaFiscal: TLabel;
    edtNotaFiscal: TEdit;
    BtnFaturamento: TBitBtn;
    BtnRelatorios: TBitBtn;
    Label5: TLabel;
    CbxConsultapor: TComboBox;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnFaturarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdManutencoesDblClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnBuscaEquipamentoClick(Sender: TObject);
    procedure edtCodEquipamentoEnter(Sender: TObject);
    procedure edtCodEquipamentoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCancelarFaturamentoClick(Sender: TObject);
    procedure BtnVisualizarClick(Sender: TObject);
    procedure BtnFaturamentoClick(Sender: TObject);
    procedure BtnRelatoriosClick(Sender: TObject);
    procedure GrdManutencoesTitleClick(Column: TColumn);
    procedure CbxConsultaporExit(Sender: TObject);
  private

    loFuncoes: TFuncoes;
    procedure mostraManutencoes;
    procedure carregaDados;
  public
    { Public declarations }
  end;

var
  frmConsultaManutencoes: TfrmConsultaManutencoes;

implementation

uses unDM, unManutencoes, unPrincipal, unEquipamentos, unFaturamentoManu,
  unVisualizarFatManu, unRelatoriosManutencoes, unFornecedores;

{$R *.dfm}

procedure TfrmConsultaManutencoes.BtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmConsultaManutencoes.BtnIncluirClick(Sender: TObject);
begin
  frmManutencoes := TfrmManutencoes.Create(self);
  frmManutencoes.opcSal := 1;
  frmPrincipal.bChamarEquipamento := True;
  frmManutencoes.ShowModal;
  mostraManutencoes;
end;

procedure TfrmConsultaManutencoes.BtnAlterarClick(Sender: TObject);
begin
  if cdsManu.FieldByName('status').AsString = 'F' then
    begin
      MessageDlg('Manuten��o n�o pode ser alterada, pois j� foi faturada!',mtWarning,[mbOk],0);
    end
  else
    begin
      frmManutencoes := TfrmManutencoes.Create(self);
      carregaDados;
      frmManutencoes.opcSal := 2;
      frmManutencoes.codEquipamento := cdsManu.FieldByName('codequipamento').AsInteger;
      frmManutencoes.ShowModal;
      FreeAndNil(frmManutencoes);
      mostraManutencoes;
    end;
end;

procedure TfrmConsultaManutencoes.carregaDados;
begin
  with frmManutencoes do
    begin
      with cdsManu do
        begin
          edtCodigo.Text    := FieldByName('codigo').AsString;
          edtDescricao.Text := FieldByName('descricao').AsString;

          edtCodFornecedor.Text := FieldByName('codfornecedor').AsString;

          lblFornecedor.Caption := loFuncoes.BuscaFk(FieldByName('codfornecedor').AsString,'fornecedores','razaosocial');

          edtCodPlanoConta.Text := FieldByName('codplanoconta').AsString;

          lblPlanoConta.Caption := loFuncoes.BuscaFk(FieldByName('codplanoconta').AsString,'planocontas','descricao');

          lblTotalManutencao.Caption := loFuncoes.TrataReal(FieldByName('total').AsString);

          edtCodSubPlano.Text := FieldByName('codsubplano').AsString;

          lblSubPlano.Caption := loFuncoes.BuscaFk(FieldByName('codsubplano').AsString,'subplanocontas','descricao');

          if FieldByName('valorservicos').AsFloat > 0 then
            edtValorServico.Text := loFuncoes.TrataReal(FieldByName('valorservicos').AsString)
          else
            edtValorServico.Text := '0,00';

          RchEdtObs.Text := FieldByName('obs').AsString;
          edtNotaFiscal.Text := FieldByName('numeronf').AsString;
        end;
    end;
end;

procedure TfrmConsultaManutencoes.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmConsultaManutencoes.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmConsultaManutencoes.mostraManutencoes;
begin
  with qryManu, SQL do
    begin
      Close;
      Clear;
      Add('SELECT man.codigo, man.descricao, man.codfornecedor, man.codplanoconta, man.numeronf,');
      Add('man.total, man.codequipamento, man.codsubplano,');
      Add('equi.descricao As Equipamento, man.status, man.obs, man.dataabertura,man.valorservicos');
      Add('FROM manutencoes man');
      Add('INNER JOIN equipamentos equi');
      Add('ON equi.codigo = man.codequipamento');
      Add('WHERE man.dataabertura BETWEEN :dtini AND :dtfin');

      // EQUIPAMENTO
      if CbxConsultapor.ItemIndex = 0 then
        begin
          if edtCodEquipamento.Text <> trim('') then
            Add('AND man.codequipamento = :equip');
        end
      // FORNECEDOR
      else
        begin
          if edtCodEquipamento.Text <> trim('') then
            Add('AND man.codfornecedor = :equip');
        end;        

      if RdBtnTodos.Checked = false then
        Add('AND man.status = :sta');

      if CbxTipo.ItemIndex > 0 then
        Add('AND man.tipo = :tipo');

      if edtNotaFiscal.Text <> trim('') then
        Add('AND man.numeronf LIKE :nnf');

      Add('ORDER BY '+ frmPrincipal.sCampo);

      ParamByName('dtini').AsDate := StrToDate(mskInicial.Text);
      ParamByName('dtfin').AsDate := StrToDate(mskFinal.Text);

      if RdBtnAberta.Checked = true then
        ParamByName('sta').AsString := 'A'
      else
      if RdBtnFaturada.Checked = true then
        ParamByName('sta').AsString := 'F';

      if edtCodEquipamento.Text <> trim('') then
        ParamByName('equip').AsInteger := StrToInt(edtCodEquipamento.Text);

      if CbxTipo.ItemIndex > 0 then
        ParamByName('tipo').AsInteger := CbxTipo.ItemIndex;

      if edtNotaFiscal.Text <> trim('') then
        ParamByName('nnf').AsString := '%' + edtNotaFiscal.Text + '%';

      Open;
      cdsManu.Close;
      cdsManu.Open;
    end;

  TNumericField(cdsManu.FieldByName('total')).DisplayFormat := ',0.00;-,0.00';
end;

procedure TfrmConsultaManutencoes.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  mostraManutencoes;
end;

procedure TfrmConsultaManutencoes.BtnExcluirClick(Sender: TObject);
begin
  if cdsManu.FieldByName('status').AsString = 'F' then
    begin
      MessageDlg('N�o � poss�vel excluir a manuten��o, pois j� foi faturada, para isso cancele o faturamento!',mtWarning,[mbOk],0);
      Exit;
    end;

  if (MessageDlg('Deseja realmente excluir essa manuten��o?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
    begin
      qryHistorico.Close;
      qryHistorico.SQL.Clear;
      qryHistorico.SQL.Add('DELETE FROM produtosmanu');
      qryHistorico.SQL.Add('WHERE codmanutencao = :manu');
      qryHistorico.ParamByName('manu').AsInteger := cdsManu.FieldByName('codigo').AsInteger;
      qryHistorico.ExecSQL;

      with qryManu, SQL do
        begin
          Close;
          Clear;
          Add('DELETE FROM manutencoes');
          Add('WHERE codigo = :cod');
          ParamByName('cod').AsInteger := cdsManu.FieldByName('codigo').AsInteger;
          ExecSQL;
        end;

      mostraManutencoes;
    end;
end;

procedure TfrmConsultaManutencoes.BtnFaturarClick(Sender: TObject);
begin
  if cdsManu.FieldByName('codigo').AsInteger < 1 then
    begin
      MessageDlg('Nenhuma manuten��o selecionada para faturar!',mtWarning,[mbOk],0);
      Exit;
    end;

  frmFaturamentoManu := TfrmFaturamentoManu.Create(self);
  frmFaturamentoManu.CodSubPlano   := cdsManu.FieldByName('codsubplano').AsInteger;
  frmFaturamentoManu.CodPlano      := cdsManu.FieldByName('codplanoconta').AsInteger;
  frmFaturamentoManu.sNotaFiscal   := cdsManu.FieldByName('numeronf').AsString;
  frmFaturamentoManu.codFornecedor := cdsManu.FieldByName('codfornecedor').AsInteger;
  frmFaturamentoManu.codManutencao := cdsManu.FieldByName('codigo').AsInteger;
  frmFaturamentoManu.lblVlrTotal.Caption := loFuncoes.TrataReal(cdsManu.FieldByName('total').AsString);
  frmFaturamentoManu.sDescricao := cdsManu.FieldByName('descricao').AsString;
  frmFaturamentoManu.iTipo      := 1; // Manuten��o
  frmFaturamentoManu.ShowModal;
  FreeAndNil(frmFaturamentoManu);

  mostraManutencoes;
end;

procedure TfrmConsultaManutencoes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmConsultaManutencoes.GrdManutencoesDblClick(Sender: TObject);
begin
  BtnAlterarClick(self);
end;

procedure TfrmConsultaManutencoes.BtnConsultarClick(Sender: TObject);
begin
  mostraManutencoes;
end;

procedure TfrmConsultaManutencoes.BtnBuscaEquipamentoClick(
  Sender: TObject);
begin
  // EQUIPAMENTO
  if CbxConsultapor.ItemIndex = 0 then
    begin
      frmEquipamentos := TfrmEquipamentos.Create(self);
      frmEquipamentos.telaChamando := 5;
      frmEquipamentos.ShowModal;
      FreeAndNil(frmEquipamentos);
    end
  else
    // FORNECEDOR
    begin
      frmFornecedores := TfrmFornecedores.Create(self);
      frmFornecedores.telaChamando := 7;
      frmFornecedores.ShowModal;
      FreeAndNil(frmFornecedores);
    end;

  if lblEquipamento.Caption <> trim('') then
    BtnConsultar.SetFocus;
end;

procedure TfrmConsultaManutencoes.edtCodEquipamentoEnter(Sender: TObject);
begin
  lblEquipamento.Caption := '';
end;

procedure TfrmConsultaManutencoes.edtCodEquipamentoExit(Sender: TObject);
begin
  if edtCodEquipamento.Text <> trim('') then
    begin
      // EQUIPAMENTO
      if CbxConsultapor.ItemIndex = 0 then
        begin
          lblEquipamento.Caption := loFuncoes.BuscaFk(edtCodEquipamento.Text,'equipamentos','descricao');

          if lblEquipamento.Caption = trim('') then
            begin
              edtCodEquipamento.Clear;
              BtnBuscaEquipamento.SetFocus;
            end
          else
            BtnConsultar.SetFocus;
        end
      // FORNECEDOR
      else
        begin
          lblEquipamento.Caption := loFuncoes.BuscaFk(edtCodEquipamento.Text,'fornecedores','razaosocial');

          if lblEquipamento.Caption = trim('') then
            begin
              edtCodEquipamento.Clear;
              BtnBuscaEquipamento.SetFocus;
            end
          else
            BtnConsultar.SetFocus;
        end;
    end;
end;

procedure TfrmConsultaManutencoes.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TfrmConsultaManutencoes.BtnCancelarFaturamentoClick(
  Sender: TObject);
var
  codLancCaixa: integer;
begin
  try
    qryParcelas.Close;
    qryParcelas.SQL.Clear;
    qryParcelas.SQL.Add('SELECT * FROM contaspagar');
    qryParcelas.SQL.Add('WHERE codmanutencao = :manu');
    qryParcelas.ParamByName('manu').AsInteger := cdsManu.FieldByName('codigo').AsInteger;
    qryParcelas.Open;
    cdsParcelas.Close;
    cdsParcelas.Open;
    cdsParcelas.First;

    while not(cdsParcelas.Eof) do
      begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT codigo,codlancamentocaixa FROM historicocontapagar');
        qryAux.SQL.Add('WHERE codcontapagar = :cp');
        qryAux.ParamByName('cp').AsInteger := cdsParcelas.FieldByName('codigo').AsInteger;
        qryAux.Open;
        cdsAux.Close;
        cdsAux.Open;
        qryAux.Open;
        qryAux.First;

        while not(qryAux.Eof) do
          begin
            if (MessageDlg('Existem valores j� pagos desta compra/manuten��o, deseja estornar isso tamb�m?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
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
                qryHistorico.SQL.Add('DELETE FROM historicocontapagar');
                qryHistorico.SQL.Add('WHERE codigo = :cod');
                qryHistorico.ParamByName('cod').AsInteger := qryAux.FIeldByName('codigo').AsInteger;
                qryHistorico.ExecSQL();
              end;

            qryAux.Next;
          end;

        cdsParcelas.Next;
      end;

    if (MessageDlg('Deseja tamb�m excluir todas as parcelas se ainda existentes?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
      begin
        qryParcelas.Close;
        qryParcelas.SQL.Clear;
        qryParcelas.SQL.Add('DELETE FROM contaspagar');
        qryParcelas.SQL.Add('WHERE codmanutencao = :manu');
        qryParcelas.ParamByName('manu').AsInteger := cdsManu.FieldByName('codigo').AsInteger;
        qryParcelas.ExecSQL();

        qryManu.Close;
        qryManu.SQL.Clear;
        qryManu.SQL.Add('UPDATE manutencoes SET status = :sta');
        qryManu.SQL.Add('WHERE codigo = :cod');
        qryManu.ParamByName('sta').AsString := 'A';
        qryManu.ParamByName('cod').AsInteger := cdsManu.FieldByname('codigo').AsInteger;
        qryManu.Prepared := True;
        qryManu.ExecSQL();
      end;

    mostraManutencoes;
  except
    MessageDlg('Erro ao cancelar financeiro da O.S.!',mtError,[mbOk],0);
  end;
end;

procedure TfrmConsultaManutencoes.BtnVisualizarClick(Sender: TObject);
begin
  frmManutencoes := TfrmManutencoes.Create(self);
  carregaDados;
  frmManutencoes.opcSal := 3;
  frmManutencoes.codEquipamento := cdsManu.FieldByName('codequipamento').AsInteger;
  frmManutencoes.PnDadosManutencao.Enabled := False;
  frmManutencoes.PnDados.Enabled := False;
  frmManutencoes.PnDadosProdutos.Enabled := False;
  frmManutencoes.PnProdutos.Enabled := False;
  frmManutencoes.PnRodape.Enabled := False;
  frmManutencoes.ShowModal;
  FreeAndNil(frmManutencoes);
end;

procedure TfrmConsultaManutencoes.BtnFaturamentoClick(Sender: TObject);
begin
  try
    frmVisualizarFatManu := TfrmVisualizarFatManu.Create(self);
    frmVisualizarFatManu.iCodManutencao := cdsManu.FieldByname('codigo').AsInteger;
    frmVisualizarFatManu.ShowModal;
  finally
    FreeAndNil(frmVisualizarFatManu);
  end;
end;

procedure TfrmConsultaManutencoes.BtnRelatoriosClick(Sender: TObject);
begin
  frmRelatoriosManutencoes := TfrmRelatoriosManutencoes.Create(self);
  frmRelatoriosManutencoes.ShowModal;
  FreeAndNil(frmRelatoriosManutencoes);
end;

procedure TfrmConsultaManutencoes.GrdManutencoesTitleClick(
  Column: TColumn);
begin
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  BtnConsultarClick(self);
end;

procedure TfrmConsultaManutencoes.CbxConsultaporExit(Sender: TObject);
begin
  if CbxTipo.ItemIndex = 0 then
    begin
      Label1.Caption := 'Equipamento';
    end
  else
    begin
      Label1.Caption := 'Fornecedor';
    end;
end;

end.


