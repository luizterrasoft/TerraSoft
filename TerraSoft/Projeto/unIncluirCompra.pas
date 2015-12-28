unit unIncluirCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Mask, Buttons, Grids, DBGrids,
  FMTBcd, SqlExpr, Provider, DB, DBClient, unFuncoes;

type
  TfrmIncluirCompra = class(TForm)
    PnDadosCompra: TPanel;
    PnItens: TPanel;
    PnOpcoes: TPanel;
    Label1: TLabel;
    edtNFDoc: TEdit;
    Label2: TLabel;
    edtCodFornecedor: TEdit;
    BtnBuscaFornecedor: TBitBtn;
    lblFornecedor: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    mskEmissao: TMaskEdit;
    mskEntrada: TMaskEdit;
    Label5: TLabel;
    edtValorTotalNF: TEdit;
    Label6: TLabel;
    RchEdtObs: TRichEdit;
    BtnConfirmar: TBitBtn;
    BtnConcluir: TBitBtn;
    BtnSair: TBitBtn;
    Label7: TLabel;
    dsCompra: TDataSource;
    cdsCompra: TClientDataSet;
    dspCompra: TDataSetProvider;
    qryCompra: TSQLQuery;
    dsItens: TDataSource;
    cdsItens: TClientDataSet;
    dspItens: TDataSetProvider;
    qryItens: TSQLQuery;
    Label17: TLabel;
    edtValorProdutos: TEdit;
    PageControl1: TPageControl;
    TbShtItens: TTabSheet;
    TbShtFaturamento: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtCodProduto: TEdit;
    BtnBuscaProduto: TBitBtn;
    edtQuantidade: TEdit;
    edtValorUnitario: TEdit;
    edtValorTotal: TEdit;
    edtUnCompra: TEdit;
    edtCodEquipamento: TEdit;
    BtnBuscaEquipamento: TBitBtn;
    lblEquipamento: TLabel;
    Label15: TLabel;
    PnItensLancados: TPanel;
    grdItens: TDBGrid;
    Bevel1: TBevel;
    Label16: TLabel;
    edtDescricaoProduto: TEdit;
    BtnIncluirItem: TBitBtn;
    BtnExcluir: TBitBtn;
    Label8: TLabel;
    CbxTipo: TComboBox;
    dsAux: TDataSource;
    cdsAux: TClientDataSet;
    dspAux: TDataSetProvider;
    qryAux: TSQLQuery;
    btnGerarFaturamento: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtCodFornecedorExit(Sender: TObject);
    procedure edtCodFornecedorEnter(Sender: TObject);
    procedure BtnBuscaFornecedorClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure edtValorTotalNFExit(Sender: TObject);
    procedure edtValorUnitarioExit(Sender: TObject);
    procedure edtValorTotalExit(Sender: TObject);
    procedure edtValorProdutosExit(Sender: TObject);
    procedure edtCodProdutoExit(Sender: TObject);
    procedure edtCodProdutoEnter(Sender: TObject);
    procedure BtnBuscaProdutoClick(Sender: TObject);
    procedure edtCodEquipamentoEnter(Sender: TObject);
    procedure edtCodEquipamentoExit(Sender: TObject);
    procedure BtnBuscaEquipamentoClick(Sender: TObject);
    procedure BtnIncluirItemClick(Sender: TObject);
    procedure BtnConcluirClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGerarFaturamentoClick(Sender: TObject);
  private

    loFuncoes: TFuncoes;
    function ValidaDadosCompra: Boolean;
    function BuscaUltimaCompra: integer;
    procedure mostraItens;
    procedure limparItens;
  public
    OpcSal: integer; // 1 - incluir //// 2 - alterar
    codCompra: integer;
  end;

var
  frmIncluirCompra: TfrmIncluirCompra;

implementation

uses unDM, unFornecedores, unProdutos, unEquipamentos, unVisualizarFatManu;

{$R *.dfm}

procedure TfrmIncluirCompra.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmIncluirCompra.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmIncluirCompra.edtCodFornecedorExit(Sender: TObject);
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
        mskEmissao.SetFocus;
    end;
end;

procedure TfrmIncluirCompra.edtCodFornecedorEnter(Sender: TObject);
begin
  lblFornecedor.Caption := '';
end;

procedure TfrmIncluirCompra.BtnBuscaFornecedorClick(Sender: TObject);
begin
  frmFornecedores := TfrmFornecedores.Create(self);
  frmFornecedores.telaChamando := 12;
  frmFornecedores.ShowModal;
  FreeAndNil(frmFornecedores);

  if lblFornecedor.Caption <> trim('') then
    edtCodFornecedor.SetFocus;
end;

procedure TfrmIncluirCompra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;



function TfrmIncluirCompra.ValidaDadosCompra: Boolean;
var
  bRetorno: boolean;
begin
  if (edtNFDoc.Text <> trim('')) and (edtNFDoc.Text <> trim('0')) then
    bRetorno := True
  else
    bRetorno := False;

  if (edtCodFornecedor.Text <> trim('')) and (edtCodFornecedor.Text <> trim('0')) then
    bRetorno := True
  else
    bRetorno := False;

  if (mskEmissao.Text <> '  /  /    ') then
    bRetorno := True
  else
    bRetorno := False;

  if (mskEntrada.Text <> '  /  /    ') then
    bRetorno := True
  else
    bRetorno := False;

  if (edtValorTotalNF.Text <> '0,00') and (edtValorTotalNF.Text <> '0') then
    bRetorno := True
  else
    bRetorno := False;

  Result := bRetorno;
end;

procedure TfrmIncluirCompra.BtnConfirmarClick(Sender: TObject);
begin
  try
    if ValidaDadosCompra then
      if OpcSal = 1 then
        begin
          qryCompra.Close;
          qryCompra.SQL.Clear;
          qryCompra.SQL.Add('INSERT INTO compras (codfornecedor,valortotal,dataemissao,dataentrada,numeronf,obs)');
          qryCompra.SQL.Add('VALUES (:forn,:vlrt,:dtemi,:dtent,:nnf,:obs)');
          qryCompra.ParamByName('forn').AsInteger := StrToInt(edtCodFornecedor.Text);
          qryCompra.ParamByName('vlrt').AsFloat   := StrToFloat(edtValorTotalNF.Text);
          qryCompra.ParamByName('dtemi').AsDate   := StrToDate(mskEmissao.Text);
          qryCompra.ParamByName('dtent').AsDate   := StrToDate(mskEntrada.Text);
          qryCompra.ParamByName('nnf').AsString   := edtNFDoc.Text;
          qryCompra.ParamByName('obs').AsString   := RchEdtObs.Text;
          qryCompra.ExecSQL();

          codCompra := BuscaUltimaCompra;
        end;

      if OpcSal = 2 then
        begin
          qryCompra.Close;
          qryCompra.SQL.Clear;
          qryCompra.SQL.Add('UPDATE compras SET codfornecedor = :forn, valortotal = :vlrt, dataemissao = :dtemi,');
          qryCompra.SQL.Add('dataentrada = :dtent, numeronf = :nnf, obs = :obs');
          qryCompra.SQL.Add('WHERE codigo = :cod');
          qryCompra.ParamByName('cod').AsInteger  := codCompra;
          qryCompra.ParamByName('forn').AsInteger := StrToInt(edtCodFornecedor.Text);
          qryCompra.ParamByName('vlrt').AsFloat   := StrToFloat(edtValorTotal.Text);
          qryCompra.ParamByName('dtemi').AsDate   := StrToDate(mskEmissao.Text);
          qryCompra.ParamByName('dtent').AsDate   := StrToDate(mskEntrada.Text);
          qryCompra.ParamByName('nnf').AsString   := edtNFDoc.Text;
          qryCompra.ParamByName('obs').AsString   := RchEdtObs.Text;
          qryCompra.ExecSQL();
        end;
  except
    on e: Exception do
    raise Exception.Create('Não foi possível incluir/alterar a compra!' + #13 + e.Message);
  end;

  PnDadosCompra.Enabled := False;
  PnItens.Enabled := True;
  edtCodProduto.SetFocus;
end;

procedure TfrmIncluirCompra.edtValorTotalNFExit(Sender: TObject);
begin
  edtValorTotalNF.Text := loFuncoes.TrataReal(edtValorTotalNF.Text);
end;

procedure TfrmIncluirCompra.edtValorUnitarioExit(Sender: TObject);
begin
  try
    edtValorTotal.Text := FloatToStr(StrToFloat(edtQuantidade.Text)*StrToFloat(edtValorUnitario.Text));
    edtValorUnitario.Text := loFuncoes.TrataReal(edtValorUnitario.Text);
  except

  end;                                                                  
end;

procedure TfrmIncluirCompra.edtValorTotalExit(Sender: TObject);
begin
  edtValorTotal.Text := loFuncoes.TrataReal(edtValorTotal.Text);
end;

function TfrmIncluirCompra.BuscaUltimaCompra: integer;
var
  bRetorno: integer;
begin
  try
    qryCompra.Close;
    qryCompra.SQL.Clear;
    qryCompra.SQL.Add('SELECT * FROM compras ORDER BY codigo');
    qryCompra.Open;
    cdsCompra.Close;
    cdsCompra.Open;

    cdsCompra.Last;

    bRetorno := cdsCompra.FieldByName('codigo').AsInteger;
  except
    on e: Exception do
    raise Exception.Create('Não foi possível buscar a ultima compra!' + #13 + e.Message);
  end;

  Result := bRetorno;
end;

procedure TfrmIncluirCompra.edtValorProdutosExit(Sender: TObject);
begin
  edtValorProdutos.Text := loFuncoes.TrataReal(edtValorProdutos.Text);
end;

procedure TfrmIncluirCompra.edtCodProdutoExit(Sender: TObject);
begin
  if edtCodProduto.Text <> trim('') then
    begin
      edtDescricaoProduto.Text := loFuncoes.BuscaFk(edtCodProduto.Text,'produtos','descricao');

      if edtDescricaoProduto.text = trim('') then
        begin
          edtCodProduto.Clear;
          BtnBuscaProduto.SetFocus;
        end
      else
        edtUnCompra.SetFocus;
    end;
end;

procedure TfrmIncluirCompra.edtCodProdutoEnter(Sender: TObject);
begin
  edtDescricaoProduto.Text := '';
end;

procedure TfrmIncluirCompra.BtnBuscaProdutoClick(Sender: TObject);
begin
  frmProdutos := TfrmProdutos.Create(self);
  frmProdutos.telaChamando := 2;
  frmProdutos.ShowModal;
  FreeAndNil(frmProdutos);

  if edtDescricaoProduto.Text <> trim('') then
    edtUnCompra.SetFocus;
end;

procedure TfrmIncluirCompra.edtCodEquipamentoEnter(Sender: TObject);
begin
  lblEquipamento.Caption := '';
end;

procedure TfrmIncluirCompra.edtCodEquipamentoExit(Sender: TObject);
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
        BtnIncluirItem.SetFocus;
    end;
end;

procedure TfrmIncluirCompra.BtnBuscaEquipamentoClick(Sender: TObject);
begin
  frmEquipamentos := TfrmEquipamentos.Create(self);
  frmEquipamentos.telaChamando := 13;
  frmEquipamentos.ShowModal;
  FreeAndNil(frmEquipamentos);

  if lblEquipamento.Caption <> trim('') then
    BtnIncluirItem.SetFocus;
end;

procedure TfrmIncluirCompra.BtnIncluirItemClick(Sender: TObject);
begin
  try
    qryItens.Close;
    qryItens.SQL.Clear;
    qryItens.SQL.Add('INSERT INTO itens_compra');
    qryItens.SQL.Add('(codproduto,valorunitario,valortotal,un_compra,quantidade,codcompra,descricao');

    if (edtCodEquipamento.Text <> trim('')) and (edtCodEquipamento.Text <> trim('0')) then
      qryItens.SQL.Add(',codequipamento');

    qryItens.SQL.Add(')');

    qryItens.SQL.Add('VALUES (:prod,:vlruni,:vlrtot,:un,:qtd,:com,:desc');

    if (edtCodEquipamento.Text <> trim('')) and (edtCodEquipamento.Text <> trim('0')) then
      qryItens.SQL.Add(',:equip');

    qryItens.SQL.Add(')');

    qryItens.ParamByName('prod').AsInteger := StrToInt(edtCodProduto.Text);
    qryItens.ParamByName('vlruni').AsFloat := StrToFloat(edtValorUnitario.Text);
    qryItens.ParamByName('vlrtot').AsFloat := StrToFloat(edtValorTotal.Text);
    qryItens.ParamByName('un').AsString    := edtUnCompra.Text;
    qryItens.ParamByName('qtd').AsFloat    := StrToFloat(edtQuantidade.Text);
    qryItens.ParamByName('com').AsInteger  := codCompra;

    if (edtCodEquipamento.Text <> trim('')) and (edtCodEquipamento.Text <> trim('0')) then
      qryItens.ParamByName('equip').AsInteger:= StrToInt(edtCodEquipamento.Text);

    qryItens.ParamByName('desc').AsString  := edtDescricaoProduto.Text;
    qryItens.ExecSQL();
  except
    on e: Exception do
    raise Exception.Create('Não foi possível incluir o item!' + #13 + e.Message);
  end;

  edtCodProduto.SetFocus;
  limparItens;
  mostraItens;
end;

procedure TfrmIncluirCompra.mostraItens;
begin
  try
    qryItens.Close;
    qryItens.SQL.Clear;
    qryItens.SQL.Add('SELECT ic.codigo AS CodItem, ic.codproduto,ic.descricao,ic.un_compra,ic.valorunitario,ic.valortotal,ic.quantidade');
    qryItens.SQL.Add('FROM itens_compra ic');
    qryItens.SQL.Add('INNER JOIN produtos prod');
    qryItens.SQL.Add('ON prod.codigo = ic.codproduto');
    qryItens.SQL.Add('WHERE ic.codcompra = :compra');
    qryItens.ParamByName('compra').AsInteger := codCompra;
    qryItens.Open;
    cdsItens.Close;
    cdsItens.Open;

    TNumericField(cdsItens.FieldByName('valorunitario')).DisplayFormat := '0.00';
    TNumericField(cdsItens.FieldByName('valortotal')).DisplayFormat := '0.00';
  except
    on e: Exception do
    raise Exception.Create('Não foi possível buscar os itens da compra!' + #13 + e.Message);
  end;
end;

procedure TfrmIncluirCompra.BtnConcluirClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmIncluirCompra.BtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmIncluirCompra.limparItens;
begin
  edtCodProduto.Text        := '';
  edtDescricaoProduto.Text  := '';
  CbxTipo.ItemIndex         := 0;
  edtUnCompra.Text          := '';
  edtQuantidade.Text        := '0,00';
  edtValorUnitario.Text     := '0,00';
  edtValorTotal.Text        := '0,00';
  edtCodEquipamento.Text    := '';
  lblEquipamento.Caption    := '';
end;

procedure TfrmIncluirCompra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.Close;

  if Key = VK_F5 then
    BtnConfirmarClick(self);
end;

procedure TfrmIncluirCompra.BtnExcluirClick(Sender: TObject);
var
  iCodItem: integer;
begin
  try
    iCodItem := cdsItens.FieldByName('coditem').AsInteger;
    cdsItens.Close;
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('DELETE FROM itens_compra WHERE codigo = :cod');
    qryAux.ParamByName('cod').AsInteger := iCodItem;
    qryAux.ExecSQL();

    mostraItens;
  except
    on e: Exception do
    raise Exception.Create('Não foi possível excluir o item desejado!' + #13 + e.Message);
  end;
end;

procedure TfrmIncluirCompra.FormShow(Sender: TObject);
begin
  mskEmissao.Text := DateToStr(Date);
  mskEntrada.Text := DateToStr(Date);
end;

procedure TfrmIncluirCompra.btnGerarFaturamentoClick(Sender: TObject);
begin
  if codCompra < 1 then
    begin
      MessageDlg('Nenhuma compra selecionada para faturar!',mtWarning,[mbOk],0);
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
  frmFaturamentoManu.iTipo      := 1; // Manutenção
  frmFaturamentoManu.ShowModal;
  FreeAndNil(frmFaturamentoManu);

  mostraManutencoes;
end;

end.

