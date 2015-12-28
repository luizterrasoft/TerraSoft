unit unLavacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, FMTBcd, SqlExpr,
  Provider, DB, DBClient, Mask, unFuncoes, MidasLib;

type
  TfrmLavacoes = class(TForm)
    PnTopo: TPanel;
    PnDados: TPanel;
    PnRodape: TPanel;
    BtnNovo: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnCancelarFaturamento: TBitBtn;
    BtnRelatorio: TBitBtn;
    BtnSair: TBitBtn;
    BtnFechar: TBitBtn;
    Label1: TLabel;
    RdBtnTodos: TRadioButton;
    RdBtnEquipamento: TRadioButton;
    RdBtnFornecedor: TRadioButton;
    Bevel1: TBevel;
    lblCod: TLabel;
    edtCodigo: TEdit;
    BtnBusca: TBitBtn;
    lblResultado: TLabel;
    BtnConsultar: TBitBtn;
    GrdLavacoes: TDBGrid;
    dsLavacoes: TDataSource;
    cdsLavacoes: TClientDataSet;
    dspLavacoes: TDataSetProvider;
    qryLavacoes: TSQLQuery;
    Label2: TLabel;
    mskInicial: TMaskEdit;
    mskfInal: TMaskEdit;
    Label3: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RdBtnTodosClick(Sender: TObject);
    procedure RdBtnEquipamentoClick(Sender: TObject);
    procedure RdBtnFornecedorClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnBuscaClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
  private

    loFuncoes: TFuncoes;
    procedure mostraTodas;
    procedure carregaDados;
  public
    { Public declarations }
  end;

var
  frmLavacoes: TfrmLavacoes;

implementation

uses unDM, unEquipamentos, unFornecedores, unIncluirLavacao;

{$R *.dfm}

procedure TfrmLavacoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmLavacoes.BtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmLavacoes.mostraTodas;
begin
  if (RdBtnEquipamento.Checked = true) and (edtCodigo.Text = trim('')) then
    begin
      MessageDlg('Primeiro selecione o equipamento!',mtWarning,[mbOk],0);
      edtCodigo.SetFocus;
      Exit;
    end;

  if (RdBtnFornecedor.Checked = true) and (edtCodigo.Text = trim('')) then
    begin
      MessageDlg('Primeiro selecione o fornecedor!',mtWarning,[mbOk],0);
      edtCodigo.SetFocus;
      Exit;
    end;

  try
    qryLavacoes.Close;
    qryLavacoes.SQL.Clear;
    qryLavacoes.SQL.Add('SELECT lav.codigo, lav.data, lav.valor, lav.descricao');
    qryLavacoes.SQL.Add(',forn.razaosocial AS Fornecedor, lav.codequipamento, lav.codcondpgto');
    qryLavacoes.SQL.Add(',equip.descricao AS Equipamento, lav.status, lav.codfornecedor');
    qryLavacoes.SQL.Add('FROM lavacoes lav');
    qryLavacoes.SQL.Add('INNER JOIN fornecedores forn');
    qryLavacoes.SQL.Add('ON lav.codfornecedor = forn.codigo');
    qryLavacoes.SQL.Add('INNER JOIN equipamentos equip');
    qryLavacoes.SQL.Add('ON lav.codequipamento = equip.codigo');
    qryLavacoes.SQL.Add('WHERE lav.data BETWEEN :dtini AND :dtfin');

    if RdBtnFornecedor.Checked = true then
      qryLavacoes.SQL.Add('AND lav.codfornecedor = :forn');

    if RdBtnEquipamento.Checked = true then
      qryLavacoes.SQL.Add('AND lav.codequipamento = :equip');

    qryLavacoes.ParamByName('dtini').AsDate := StrToDate(mskInicial.Text);
    qryLavacoes.ParamByName('dtfin').AsDate := StrToDate(mskfInal.Text);

    if RdBtnFornecedor.Checked = true then
      qryLavacoes.ParamByName('forn').AsInteger := StrToInt(edtCodigo.Text);

    if RdBtnEquipamento.Checked = true then
      qryLavacoes.ParamByName('equip').AsInteger := StrToInt(edtCodigo.Text);

    qryLavacoes.Prepared := True;
    qryLavacoes.Open;
    cdsLavacoes.Open;
    cdsLavacoes.Refresh;

    TNumericField(cdsLavacoes.FieldByName('valor')).DisplayFormat := ',0.00;-,0.00';
  except
    MessageDlg('Erro ao efetuar consulta na tabela de lavações!',mtError,[mbOk],0);
  end;
end;

procedure TfrmLavacoes.FormShow(Sender: TObject);
begin
  mostraTodas;
end;

procedure TfrmLavacoes.BtnConsultarClick(Sender: TObject);
begin
  mostraTodas;
end;

procedure TfrmLavacoes.edtCodigoExit(Sender: TObject);
begin
  if edtCodigo.Text <> trim('') then
    begin
      if RdBtnEquipamento.Checked = true then
        lblResultado.Caption := loFuncoes.BuscaFk(edtCodigo.Text,'equipamentos','descricao');

      if RdBtnFornecedor.Checked = true then
        lblResultado.Caption := loFuncoes.BuscaFk(edtCodigo.Text,'fornecedores','razaosocial');

      if lblResultado.Caption = trim('') then
        begin
          edtCodigo.Clear;
          BtnBusca.SetFocus;
        end
      else
        BtnConsultar.SetFocus;
    end;
end;

procedure TfrmLavacoes.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmLavacoes.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmLavacoes.RdBtnTodosClick(Sender: TObject);
begin
  mskInicial.SetFocus;
end;

procedure TfrmLavacoes.RdBtnEquipamentoClick(Sender: TObject);
begin
  edtCodigo.SetFocus;
end;

procedure TfrmLavacoes.RdBtnFornecedorClick(Sender: TObject);
begin
  edtCodigo.SetFocus;
end;

procedure TfrmLavacoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TfrmLavacoes.BtnBuscaClick(Sender: TObject);
begin
  if (RdBtnEquipamento.Checked = true) then
    begin
      frmEquipamentos := TfrmEquipamentos.Create(self);
      frmEquipamentos.telaChamando := 6;
      frmEquipamentos.ShowModal;
      FreeAndNil(frmEquipamentos);

      if lblResultado.Caption <> trim('') then
        mskInicial.SetFocus;
    end;

  if (RdBtnFornecedor.Checked = true) then
    begin
      frmFornecedores := TfrmFornecedores.Create(self);
      frmFornecedores.telaChamando := 5;
      frmFornecedores.ShowModal;
      FreeAndNil(frmFornecedores);

      if lblResultado.Caption <> trim('') then
        mskInicial.SetFocus;
    end;
end;

procedure TfrmLavacoes.BtnNovoClick(Sender: TObject);
begin
  try
    frmIncluirLavacao := TfrmIncluirLavacao.Create(self);
    frmIncluirLavacao.opcSal := 1;
    frmIncluirLavacao.ShowModal;
  finally
    FreeAndNil(frmIncluirLavacao);
    mostraTodas;
  end;
end;

procedure TfrmLavacoes.BtnAlterarClick(Sender: TObject);
begin
  try
    frmIncluirLavacao := TfrmIncluirLavacao.Create(self);
    frmIncluirLavacao.opcSal := 2;
    carregaDados;
    frmIncluirLavacao.ShowModal;
  finally
    FreeAndNil(frmIncluirLavacao);
    mostraTodas;
  end;
end;

procedure TfrmLavacoes.carregaDados;
begin
  frmIncluirLavacao.edtCodigo.Text := cdsLavacoes.FieldByName('codigo').AsString;
  frmIncluirLavacao.mskData.Text   := cdsLavacoes.FieldByname('data').AsString;
  frmIncluirLavacao.edtValor.Text  := cdsLavacoes.FieldByName('valor').AsString;

  if cdsLavacoes.FieldByName('status').AsInteger > 0 then
    frmIncluirLavacao.CbxStatus.ItemIndex := cdsLavacoes.FieldByName('status').AsInteger;

  frmIncluirLavacao.edtCodFornecedor.Text := cdsLavacoes.FieldByName('codfornecedor').AsString;
  frmIncluirLavacao.lblFornecedor.Caption := loFuncoes.BuscaFk(cdsLavacoes.FieldByname('codfornecedor').AsString,'fornecedores','razaosocial');

  frmIncluirLavacao.edtCodEquipamento.Text := cdsLavacoes.FieldByName('codequipamento').AsString;
  frmIncluirLavacao.lblEquipamento.Caption := loFuncoes.BuscaFk(cdsLavacoes.FieldByName('codequipamento').AsString,'equipamentos','descricao');

  frmIncluirLavacao.edtCondPgto.Text := cdsLavacoes.FieldByName('codcondpgto').AsString;
  frmIncluirLavacao.lblCondicaoPgto.Caption := loFuncoes.BuscaFk(cdsLavacoes.FieldByName('codcondpgto').AsString,'condicoespgto','descricao');

  frmIncluirLavacao.edtDescricao.Text := cdsLavacoes.FieldByName('descricao').AsString;
end;

end.
