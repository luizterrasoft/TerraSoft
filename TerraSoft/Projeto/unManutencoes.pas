unit unManutencoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, Provider, DB, DBClient, unFuncoes,
  FMTBcd, SqlExpr, Grids, DBGrids, Mask;

type
  TfrmManutencoes = class(TForm)
    PnTopo: TPanel;
    PnDados: TPanel;
    PnRodape: TPanel;
    lblTitulo: TLabel;
    BtnConfirmar: TBitBtn;
    BtnCancelar: TBitBtn;
    dsManutencoes: TDataSource;
    cdsManutencoes: TClientDataSet;
    dspManutencoes: TDataSetProvider;
    qryManutencoes: TSQLQuery;
    Bevel1: TBevel;
    lblProdutos: TLabel;
    PnDadosProdutos: TPanel;
    Produto: TLabel;
    edtCodProduto: TEdit;
    BtnBuscaProduto: TBitBtn;
    lblProduto: TLabel;
    Label5: TLabel;
    edtQtde: TEdit;
    Label10: TLabel;
    edtCusto: TEdit;
    lblTotal: TLabel;
    ChBxBaixarEstoque: TCheckBox;
    BtnIncluir: TBitBtn;
    BtnExcluir: TBitBtn;
    dsProdutos: TDataSource;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    qryProdutos: TSQLQuery;
    PnProdutos: TPanel;
    GrdProdutos: TDBGrid;
    PnDadosManutencao: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblFornecedor: TLabel;
    Label6: TLabel;
    lblPlanoConta: TLabel;
    Label8: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtCodPlanoConta: TEdit;
    edtCodFornecedor: TEdit;
    RchEdtObs: TRichEdit;
    BtnBuscaFornecedor: TBitBtn;
    BtnBuscaPlanoConta: TBitBtn;
    BtnGravar: TBitBtn;
    Label4: TLabel;
    edtValorServico: TEdit;
    lblTotalManutencao: TLabel;
    Label7: TLabel;
    dsAux: TDataSource;
    cdsAux: TClientDataSet;
    dspAux: TDataSetProvider;
    qryAux: TSQLQuery;
    BtnFaturar: TBitBtn;
    Label9: TLabel;
    edtCodSubPlano: TEdit;
    BtnBuscaSubPlano: TBitBtn;
    lblSubPlano: TLabel;
    Label11: TLabel;
    CbxTipo: TComboBox;
    lblEquipamento: TLabel;
    lblNF: TLabel;
    edtNotaFiscal: TEdit;
    edtProduto: TEdit;
    Label12: TLabel;
    mskDataCompra: TMaskEdit;
    procedure BtnCancelarClick(Sender: TObject);
    procedure edtCodFornecedorExit(Sender: TObject);
    procedure edtCodFornecedorEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnBuscaFornecedorClick(Sender: TObject);
    procedure BtnBuscaPlanoContaClick(Sender: TObject);
    procedure edtCodPlanoContaExit(Sender: TObject);
    procedure edtCodPlanoContaEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnFaturarClick(Sender: TObject);
    procedure edtCustoExit(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure edtCodProdutoExit(Sender: TObject);
    procedure BtnBuscaProdutoClick(Sender: TObject);
    procedure GrdProdutosCellClick(Column: TColumn);
    procedure GrdProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure GrdProdutosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnBuscaSubPlanoClick(Sender: TObject);
    procedure edtCodSubPlanoExit(Sender: TObject);
    procedure edtValorServicoExit(Sender: TObject);
  private
  
    loFuncoes: TFuncoes;
    procedure carregaProduto;
    procedure limpaProdutos;
    procedure baixaEstoque;
    procedure alimentaEstoque;
    procedure mostraProdutos;
    procedure somatoria;
  public

    opcSal: integer;
    codEquipamento: integer;
  end;

var
  frmManutencoes: TfrmManutencoes;

implementation

uses unDM, unFornecedores, unCondicoesPgto, unPlanoContas,
  unFaturamentoManu, unEquipamentos, unPrincipal, unProdutos,
  unSubPlanosdeContas;

{$R *.dfm}

procedure TfrmManutencoes.BtnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmManutencoes.edtCodFornecedorExit(Sender: TObject);
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
        edtCodPlanoConta.SetFocus;
    end;
end;

procedure TfrmManutencoes.edtCodFornecedorEnter(Sender: TObject);
begin
  lblFornecedor.Caption := '';
end;

procedure TfrmManutencoes.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmManutencoes.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmManutencoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);                                                    
    end;
end;

procedure TfrmManutencoes.BtnBuscaFornecedorClick(Sender: TObject);
begin
  frmFornecedores := TfrmFornecedores.Create(self);
  frmFornecedores.telaChamando := 1;
  frmFornecedores.ShowModal;
  FreeAndNil(frmFornecedores);

  if lblFornecedor.Caption <> trim('') then
    edtCodPlanoConta.SetFocus;
end;

procedure TfrmManutencoes.BtnBuscaPlanoContaClick(Sender: TObject);
begin
  frmPlanoContas := TfrmPlanoContas.Create(self);
  frmPlanoContas.telaChamando := 4;
  frmPlanoContas.ShowModal;
  FreeAndNil(frmPlanoContas);

  if lblPlanoConta.Caption <> trim('') then
    edtCodSubPlano.SetFocus;
end;

procedure TfrmManutencoes.edtCodPlanoContaExit(Sender: TObject);
begin
  if edtCodPlanoConta.Text <> trim('') then
    begin
      lblPlanoConta.Caption := loFuncoes.BuscaFk(edtCodPlanoConta.Text,'planocontas','descricao');

      if lblPlanoConta.Caption = trim('') then
        begin
          edtCodPlanoConta.Clear;
          BtnBuscaPlanoConta.SetFocus;
        end
      else
        edtCodSubPlano.SetFocus;
    end;
end;

procedure TfrmManutencoes.edtCodPlanoContaEnter(Sender: TObject);
begin
  lblPlanoConta.Caption := '';
end;

procedure TfrmManutencoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;

  if key = VK_F5 then
    BtnConfirmarClick(self);
end;

procedure TfrmManutencoes.BtnConfirmarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmManutencoes.FormShow(Sender: TObject);
begin
  if frmPrincipal.bChamarEquipamento then
    begin
      frmPrincipal.bChamarEquipamento := False;
      { ESCOLHER EQUIPAMENTO PARA LANCAR MANUTENÇÃO }
      frmEquipamentos := TfrmEquipamentos.Create(self);
      frmEquipamentos.telaChamando := 4;
      frmEquipamentos.ShowModal;
      FreeAndNil(frmEquipamentos);
    end;

  if ((edtCodigo.Text <> trim('')) or (edtCodigo.Text <> trim('0'))) and ((opcSal = 2) or (opcSal = 3)) then
    begin
      mostraProdutos;
      PnDadosProdutos.Enabled := True;
    end;

  lblEquipamento.Caption := loFuncoes.BuscaFk(IntToStr(codEquipamento),'equipamentos','descricao');
end;

procedure TfrmManutencoes.BtnGravarClick(Sender: TObject);
var
  Servicos, Produtos: Double;
begin
  if edtValorServico.Text <> trim('0,00') then
    Servicos := StrToFloat(edtValorServico.Text);

  if lblTotal.Caption <> trim('0,00') then
    Produtos := StrToFloat(lblTotal.Caption);

  if opcSal = 1 then
    begin
      with qryManutencoes, SQL do
        begin
          Close;
          Clear;
          Add('INSERT INTO manutencoes (descricao,codfornecedor,total,');
          Add('codplanoconta,codequipamento,obs,status,dataabertura,codsubplano,tipo,numeronf)');
          Add('VALUES (:des,:for,:tot,:pla,:equi,:obs,:sta,:dt,:csp,:tip,:nnf)');
          ParamByName('des').AsString := edtDescricao.Text;
          ParamByName('for').AsInteger:= StrToInt(edtCodFornecedor.Text);
          ParamByName('tot').AsFloat  := Servicos + Produtos;
          ParamByName('pla').AsInteger:= StrToInt(edtCodPlanoConta.Text);
          ParamByName('equi').AsInteger := codEquipamento;
          ParamByName('obs').AsString := RchEdtObs.Text;
          ParamByName('sta').AsString := 'A';
          ParamByName('dt').AsDate := Date;
//        ParamByName('vlrser').AsFloat := StrToFloat(edtValorServico.Text);
          ParamByName('csp').AsInteger  := StrToInt(edtCodSubPlano.Text);
          ParamByName('tip').AsInteger := CbxTipo.ItemIndex;
          ParamByName('nnf').AsString := edtNotaFiscal.Text;
          ExecSQL();
        end;

      with qryAux, SQL do
        begin
          Close;
          Clear;
          Add('SELECT MAX(codigo) AS CodManu FROM manutencoes');
          Open;
          cdsAux.Close;
          cdsAux.Open;
        end;

      edtCodigo.Text := cdsAux.FieldByName('CodManu').AsString;
    end;

  if opcSal = 2 then
    begin
      with qryManutencoes, SQL do
        begin
          Close;
          Clear;
          Add('UPDATE manutencoes SET descricao = :des, codfornecedor = :for, ');
          Add('total = :tot, codplanoconta = :pla, codequipamento = :equi,');
          Add('obs = :obs, status = :sta, tipo=:tipo, numeronf = :nnf');
          Add('WHERE codigo = :cod');
          ParamByName('cod').AsInteger:= StrToInt(edtCodigo.Text);
          ParamByName('des').AsString := edtDescricao.Text;
          ParamByName('for').AsInteger:= StrToInt(edtCodFornecedor.Text);
          ParamByName('tot').AsFloat  := StrToFloat(lblTotalManutencao.Caption);
          ParamByName('pla').AsInteger:= StrToInt(edtCodPlanoConta.Text);
          ParamByName('equi').AsInteger := codEquipamento;
          ParamByName('obs').AsString := RchEdtObs.Text;
          ParamByName('sta').AsString := 'A';
          ParamByName('tipo').AsInteger := CbxTipo.ItemIndex;
          ParamByName('nnf').AsString := edtNotaFiscal.Text;
          ExecSQL();
        end;
    end;

  PnDadosProdutos.Enabled := True;
  PnDadosManutencao.Enabled := False;

  edtCodProduto.SetFocus;

  somatoria;

end;

procedure TfrmManutencoes.BtnFaturarClick(Sender: TObject);
begin
  with qryManutencoes, SQL do
    begin
      Close;
      Clear;
      Add('SELECT MAX(codigo) AS Codigo FROM manutencoes');
      Open;
    end;

  frmFaturamentoManu := TfrmFaturamentoManu.Create(self);
  frmFaturamentoManu.sNotaFiscal := edtNotaFiscal.Text;
  frmFaturamentoManu.codFornecedor := StrToInt(edtCodFornecedor.Text);
  frmFaturamentoManu.codManutencao := qryManutencoes.FieldByName('codigo').AsInteger;
  frmFaturamentoManu.lblVlrTotal.Caption := lblTotalManutencao.Caption;
  frmFaturamentoManu.sDescricao := edtDescricao.Text;
  frmFaturamentoManu.iTipo := 1; // manutenção
  frmFaturamentoManu.ShowModal;
  FreeAndNil(frmFaturamentoManu);
end;

procedure TfrmManutencoes.edtCustoExit(Sender: TObject);
begin
  lblTotal.Caption := FloatToStr( StrToFloat(edtQtde.Text) * StrToFloat(edtCusto.Text));
  loFuncoes.TrataReal(lblTotal.Caption);
end;

procedure TfrmManutencoes.mostraProdutos;
begin
  with qryProdutos, SQL do
    begin
      Close;
      Clear;
      Add('SELECT mp.*');
      Add('FROM produtosmanu mp');
      Add('INNER JOIN produtos prod');
      Add('ON prod.codigo = mp.codproduto');
      Add('WHERE mp.codmanutencao = :manu');
      ParamByName('manu').AsInteger := StrToInt(edtCodigo.Text);
      Open;

      cdsProdutos.Close;
      cdsProdutos.Open;
    end;

  TNumericField(cdsProdutos.FieldByName('valorcusto')).DisplayFormat := ',0.00;-,0.00';
  TNumericField(cdsProdutos.FieldByName('total')).DisplayFormat := ',0.00;-,0.00';

  somatoria;
end;

procedure TfrmManutencoes.BtnIncluirClick(Sender: TObject);
begin
  with qryProdutos, SQL do
    begin
      Close;
      Clear;
      Add('INSERT INTO produtosmanu');
      Add('(codproduto, codmanutencao, qtde, valorcusto, total, baixaestoque, descricao');

      if (mskDataCompra.Text <> '  /  /    ') then
        Add(',datacompra');

      Add(')');

      Add('VALUES (:pro,:man,:qtd,:vlr,:tot,:bxe,:des');

      if (mskDataCompra.Text <> '  /  /    ') then
        Add(',:dtcom');

      Add(')');

      ParamByName('pro').AsInteger := StrToInt(edtCodProduto.Text);
      ParamByName('man').AsInteger := StrToInt(edtCodigo.Text);
      ParamByName('qtd').AsFloat   := StrToFloat(edtQtde.Text);
      ParamByName('vlr').AsFloat   := StrToFloat(edtCusto.Text);
      ParamByName('tot').AsFloat   := StrToFloat(lblTotal.Caption);
      ParamByName('des').AsString  := edtProduto.Text;

      if ChBxBaixarEstoque.Checked = true then
        ParamByName('bxe').AsString := 'S'
      else
        ParamByName('bxe').AsString := 'N';

      if (mskDataCompra.Text <> '  /  /    ') then
        ParamByName('dtcom').AsDate := StrToDate(mskDataCompra.Text);        

      ExecSQL();
    end;

  if ChBxBaixarEstoque.Checked = true then
    baixaEstoque
  else
    alimentaEstoque;

  mostraProdutos;

  limpaProdutos;

end;

procedure TfrmManutencoes.BtnExcluirClick(Sender: TObject);
begin
  with qryProdutos, SQL do
    begin
      Close;
      Clear;
      Add('DELETE FROM produtosmanu');
      Add('WHERE codigo = :cod');
      ParamByName('cod').AsInteger := cdsProdutos.FieldByName('codigo').AsInteger;
      ExecSQL();
    end;

  with qryProdutos, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE produtos SET estoque = estoque + :est');
      Add('WHERE codigo = :pro');
      ParamByName('pro').AsInteger  := StrToInt(edtCodProduto.Text);
      ParamByName('est').AsFloat    := StrToFloat(edtQtde.Text);
      ExecSQL();
    end;

  mostraProdutos;
  limpaProdutos;
end;

procedure TfrmManutencoes.baixaEstoque;
begin
  with qryProdutos, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE produtos SET estoque = estoque - :est');
      Add('WHERE codigo = :pro');
      ParamByName('pro').AsInteger  := StrToInt(edtCodProduto.Text);
      ParamByName('est').AsFloat    := StrToFloat(edtQtde.Text);
      ExecSQL();
    end;
end;

procedure TfrmManutencoes.edtCodProdutoExit(Sender: TObject);
begin
  if edtCodProduto.Text <> trim('') then
    begin
      edtProduto.Text := loFuncoes.BuscaFk(edtCodProduto.Text,'produtos','descricao');

      if edtProduto.Text = trim('') then
        begin
          edtCodProduto.Clear;
          BtnBuscaProduto.SetFocus;
        end
      else
        edtQtde.SetFocus;
    end;
end;

procedure TfrmManutencoes.BtnBuscaProdutoClick(Sender: TObject);
begin
  frmProdutos := TfrmProdutos.Create(self);
  frmProdutos.telaChamando := 1;
  frmProdutos.ShowModal;
  FreeAndNil(frmProdutos);

  if edtProduto.Text <> trim('') then
    edtQtde.SetFocus;
end;

procedure TfrmManutencoes.limpaProdutos;
begin
  edtCodProduto.Clear;
  lblProduto.Caption := '';
  edtProduto.Clear;
  edtQtde.Text := '0,00';
  edtCusto.Text:= '0,00';
  ChBxBaixarEstoque.Checked := False;
  lblTotal.Caption := '0,00';
end;

procedure TfrmManutencoes.somatoria;
begin
  with qryAux, SQL do
    begin
      Close;
      Clear;
      Add('SELECT SUM(prod.total) AS TotalProd FROM produtosmanu prod');
      Add('WHERE codmanutencao = :cod');
      ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
      Open;
      cdsAux.Close;
      cdsAux.Open;
    end;

  lblTotalManutencao.Caption := FloatToStr( StrToFloat(edtValorServico.Text) + cdsAux.FieldByName('totalprod').AsFloat );
  lblTotalManutencao.Caption := loFuncoes.TrataReal(lblTotalManutencao.Caption);

  try
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('UPDATE manutencoes SET total = :to');
    qryAux.SQL.Add('WHERE codigo = :cod');
    qryAux.ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
    qryAux.ParamByName('to').AsFloat    := StrToFloat(lblTotalManutencao.Caption);
    qryAux.ExecSQL();
  except
    MessageDlg('Erro ao atualizar o valor total da manutenção!',mtError,[mbOk],0);
  end;
end;

procedure TfrmManutencoes.carregaProduto;
begin
  edtCodProduto.Text := cdsProdutos.FieldByName('codigo').AsString;
  edtProduto.Text    := cdsProdutos.FieldByName('descricao').AsString;
  edtQtde.Text       := cdsProdutos.FieldByName('qtde').AsString;
  edtCusto.Text      := cdsProdutos.FieldByName('valorcusto').AsString;
  edtCusto.Text      := loFuncoes.TrataReal(cdsProdutos.FieldByName('valorcusto').AsString);
  lblTotal.Caption   := cdsProdutos.FieldByName('total').AsString;
  lblTotal.Caption   := loFuncoes.TrataReal(cdsProdutos.FieldByName('total').AsString);

  if cdsProdutos.FieldByName('baixaestoque').AsString = 'S' then
    ChBxBaixarEstoque.Checked := True
  else
    ChBxBaixarEstoque.Checked := False;
end;

procedure TfrmManutencoes.GrdProdutosCellClick(Column: TColumn);
begin
  carregaProduto;
end;

procedure TfrmManutencoes.GrdProdutosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  carregaProduto;
end;

procedure TfrmManutencoes.GrdProdutosKeyPress(Sender: TObject;
  var Key: Char);
begin
  carregaProduto;
end;

procedure TfrmManutencoes.GrdProdutosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  carregaProduto;
end;

procedure TfrmManutencoes.BtnBuscaSubPlanoClick(Sender: TObject);
begin
  frmSubPlanosdeContas := TfrmSubPlanosdeContas.Create(self);
  frmSubPlanosdeContas.telaChamando := 1;
  frmSubPlanosdeContas.ShowModal;
  FreeAndNil(frmSubPlanosdeContas);

  if lblSubPlano.Caption <> trim('') then
    edtNotaFiscal.SetFocus;
end;

procedure TfrmManutencoes.edtCodSubPlanoExit(Sender: TObject);
begin
  if edtCodSubPlano.Text <> trim('') then
    begin
      lblSubPlano.Caption := loFuncoes.BuscaFk(edtCodSubPlano.Text,'SUBPLANOCONTAS','descricao');

      if lblSubPlano.Caption = trim('') then
        begin
          edtCodSubPlano.Clear;
          BtnBuscaSubPlano.SetFocus;
        end
      else
        edtNotaFiscal.SetFocus;
    end;
end;

procedure TfrmManutencoes.edtValorServicoExit(Sender: TObject);
begin
  edtValorServico.Text := loFuncoes.TrataReal(edtValorServico.Text);
end;

procedure TfrmManutencoes.alimentaEstoque;
begin
  with qryProdutos, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE produtos SET estoque = estoque + :est');
      Add('WHERE codigo = :pro');
      ParamByName('pro').AsInteger  := StrToInt(edtCodProduto.Text);
      ParamByName('est').AsFloat    := StrToFloat(edtQtde.Text);
      ExecSQL();
    end;
end;

end.






































