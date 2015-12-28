unit unRelatoriosManutencoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, unFuncoes, Mask, FMTBcd, SqlExpr,
  Provider, DB, DBClient;

type
  TfrmRelatoriosManutencoes = class(TForm)
    Label1: TLabel;
    RdBtnTodosEquipamentos: TRadioButton;
    RdBtnEquipamentoSelecionado: TRadioButton;
    BtnGerar: TBitBtn;
    BtnSair: TBitBtn;
    PnEquipamento: TPanel;
    Label2: TLabel;
    edtCodEquipamento: TEdit;
    BtnBuscaEquipamento: TBitBtn;
    lblEquipamento: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    lblInicial: TLabel;
    mskInicial: TMaskEdit;
    lblFinal: TLabel;
    mskFInal: TMaskEdit;
    dsRelatorio: TDataSource;
    cdsRelatorio: TClientDataSet;
    dspRelatorio: TDataSetProvider;
    qryRelatorio: TSQLQuery;
    ChBxDataCompra: TCheckBox;
    ChBxDataLancamento: TCheckBox;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodEquipamentoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnBuscaEquipamentoClick(Sender: TObject);
    procedure RdBtnEquipamentoSelecionadoClick(Sender: TObject);
    procedure RdBtnTodosEquipamentosClick(Sender: TObject);
    procedure BtnGerarClick(Sender: TObject);
  private
    loFuncoes: TFuncoes;
  public
    { Public declarations }
  end;

var
  frmRelatoriosManutencoes: TfrmRelatoriosManutencoes;

implementation

uses unEquipamentos, unRelEquipamentos, unDM;

{$R *.dfm}

procedure TfrmRelatoriosManutencoes.BtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmRelatoriosManutencoes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmRelatoriosManutencoes.edtCodEquipamentoExit(Sender: TObject);
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
        BtnGerar.SetFocus;
    end;
end;

procedure TfrmRelatoriosManutencoes.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmRelatoriosManutencoes.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmRelatoriosManutencoes.BtnBuscaEquipamentoClick(
  Sender: TObject);
begin
  frmEquipamentos := TfrmEquipamentos.Create(self);
  frmEquipamentos.telaChamando := 9;
  frmEquipamentos.ShowModal;
  FreeAndNil(frmEquipamentos);

  if lblEquipamento.Caption <> trim('') then
    BtnGerar.SetFocus;
end;

procedure TfrmRelatoriosManutencoes.RdBtnEquipamentoSelecionadoClick(
  Sender: TObject);
begin
  PnEquipamento.Visible := True;
  mskInicial.SetFocus;
end;

procedure TfrmRelatoriosManutencoes.RdBtnTodosEquipamentosClick(
  Sender: TObject);
begin
  PnEquipamento.Visible := False;
  mskInicial.SetFocus;
end;

procedure TfrmRelatoriosManutencoes.BtnGerarClick(Sender: TObject);
begin
  qryRelatorio.Close;
  qryRelatorio.SQL.Clear;

  { DATA DA COMPRA }
  if ChBxDataCompra.Checked = true then
    begin
      qryRelatorio.SQL.Add('SELECT');
      qryRelatorio.SQL.Add('DISTINCT(pla.descricao) AS PlanoConta,');
      qryRelatorio.SQL.Add('sub.descricao AS SubPlanoConta');
      qryRelatorio.SQL.Add(', forn.razaosocial, equip.descricao As Equipamento, manu.*');
      qryRelatorio.SQL.Add('FROM manutencoes manu');
      qryRelatorio.SQL.Add('INNER JOIN planocontas pla');
      qryRelatorio.SQL.Add('ON pla.codigo = manu.codplanoconta');
      qryRelatorio.SQL.Add('INNER JOIN subplanocontas sub');
      qryRelatorio.SQL.Add('ON sub.codigo = manu.codsubplano');
      qryRelatorio.SQL.Add('INNER JOIN fornecedores forn');
      qryRelatorio.SQL.Add('ON forn.codigo = manu.codfornecedor');
      qryRelatorio.SQL.Add('INNER JOIN equipamentos equip');
      qryRelatorio.SQL.Add('ON equip.codigo = manu.codequipamento');
      qryRelatorio.SQL.Add('WHERE manu.dataabertura BETWEEN :dtini AND :dtfin');

      if RdBtnEquipamentoSelecionado.Checked = true then
        begin
          qryRelatorio.SQL.Add('AND equip.codigo = :equip');
        end;

      qryRelatorio.SQL.Add('ORDER BY manu.codequipamento, manu.codsubplano');
    end;

  { DATA DE LANÇAMENTO }
  if ChBxDataLancamento.Checked = true then
    begin
      qryRelatorio.SQL.Add('SELECT');
      qryRelatorio.SQL.Add('DISTINCT(pla.descricao) AS PlanoConta,');
      qryRelatorio.SQL.Add('sub.descricao AS SubPlanoConta');
      qryRelatorio.SQL.Add(', forn.razaosocial, equip.descricao As Equipamento, manu.*');
      qryRelatorio.SQL.Add('FROM manutencoes manu');
      qryRelatorio.SQL.Add('INNER JOIN planocontas pla');
      qryRelatorio.SQL.Add('ON pla.codigo = manu.codplanoconta');
      qryRelatorio.SQL.Add('INNER JOIN subplanocontas sub');
      qryRelatorio.SQL.Add('ON sub.codigo = manu.codsubplano');
      qryRelatorio.SQL.Add('INNER JOIN fornecedores forn');
      qryRelatorio.SQL.Add('ON forn.codigo = manu.codfornecedor');
      qryRelatorio.SQL.Add('INNER JOIN equipamentos equip');
      qryRelatorio.SQL.Add('ON equip.codigo = manu.codequipamento');
      qryRelatorio.SQL.Add('WHERE manu.dataabertura BETWEEN :dtini AND :dtfin');

      if RdBtnEquipamentoSelecionado.Checked = true then
        begin
          qryRelatorio.SQL.Add('AND equip.codigo = :equip');
        end;

      qryRelatorio.SQL.Add('ORDER BY manu.codequipamento, manu.codsubplano');
    end;

  qryRelatorio.ParamByName('dtini').AsDate := StrToDate(mskInicial.Text);
  qryRelatorio.ParamByName('dtfin').AsDate := StrToDate(mskFInal.Text);

  if RdBtnEquipamentoSelecionado.Checked = true then
    begin
      qryRelatorio.ParamByName('equip').AsInteger := StrToInt(edtCodEquipamento.Text);
    end;

  qryRelatorio.Open;
  cdsRelatorio.Close;
  cdsRelatorio.Open;

  frmRelEquipamentos := TfrmRelEquipamentos.Create(self);
  frmRelEquipamentos.lblInicial.Caption := mskInicial.Text;
  frmRelEquipamentos.lblFinal.Caption   := mskFInal.Text;
  frmRelEquipamentos.Rel.Preview();
  FreeAndNil(frmRelEquipamentos);
end;

end.
