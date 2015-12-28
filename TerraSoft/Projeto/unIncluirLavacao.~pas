unit unIncluirLavacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, FMTBcd, SqlExpr, Provider,
  DB, DBClient, unFuncoes;

type
  TfrmIncluirLavacao = class(TForm)
    PnDados: TPanel;
    Pnrodape: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtCodigo: TEdit;
    mskData: TMaskEdit;
    edtValor: TEdit;
    CbxStatus: TComboBox;
    edtCodFornecedor: TEdit;
    BtnBuscaFornecedor: TBitBtn;
    edtCodEquipamento: TEdit;
    BtnBuscaequipamento: TBitBtn;
    edtDescricao: TEdit;
    edtCondPgto: TEdit;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    lblFornecedor: TLabel;
    lblEquipamento: TLabel;
    lblCondicaoPgto: TLabel;
    dsLavacao: TDataSource;
    cdsLavacao: TClientDataSet;
    dspLavacao: TDataSetProvider;
    qryLavacao: TSQLQuery;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodFornecedorExit(Sender: TObject);
    procedure edtCodEquipamentoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure BtnBuscaFornecedorClick(Sender: TObject);
    procedure BtnBuscaequipamentoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure edtCodFornecedorEnter(Sender: TObject);
    procedure edtCodEquipamentoEnter(Sender: TObject);
  private
    loFuncoes: TFuncoes;
  public
    opcSal: integer;
  end;

var
  frmIncluirLavacao: TfrmIncluirLavacao;

implementation

uses unDM, unFornecedores, unMunicipios, unEquipamentos, unCondicoesPgto;

{$R *.dfm}

procedure TfrmIncluirLavacao.BtnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmIncluirLavacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmIncluirLavacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TfrmIncluirLavacao.edtCodFornecedorExit(Sender: TObject);
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
        edtCodEquipamento.SetFocus;
    end;
end;

procedure TfrmIncluirLavacao.edtCodEquipamentoExit(Sender: TObject);
begin
  if edtCodEquipamento.Text <> trim('') then
    begin
      lblEquipamento.Caption := loFuncoes.BuscaFk(edtCodEquipamento.Text,'equipamentos','descricao');

      if lblEquipamento.Caption = trim('') then
        begin
          edtCodEquipamento.Clear;
          BtnBuscaequipamento.SetFocus;
        end
      else
        edtDescricao.SetFocus;
    end;
end;

procedure TfrmIncluirLavacao.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmIncluirLavacao.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmIncluirLavacao.edtValorExit(Sender: TObject);
begin
  edtValor.Text := loFuncoes.TrataReal(edtValor.Text);
end;

procedure TfrmIncluirLavacao.BtnBuscaFornecedorClick(Sender: TObject);
begin
  frmFornecedores := TfrmFornecedores.Create(self);
  frmFornecedores.telaChamando := 6;
  frmFornecedores.ShowModal;
  FreeAndNil(frmFornecedores);

  if lblFornecedor.Caption <> trim('') then
    edtCodEquipamento.SetFocus;
end;

procedure TfrmIncluirLavacao.BtnBuscaequipamentoClick(Sender: TObject);
begin
  frmEquipamentos := TfrmEquipamentos.Create(self);
  frmEquipamentos.telaChamando := 7;
  frmEquipamentos.ShowModal;
  FreeAndNil(frmEquipamentos);

  if lblEquipamento.Caption <> trim('') then
    edtDescricao.SetFocus;
end;

procedure TfrmIncluirLavacao.BtnGravarClick(Sender: TObject);
begin
  if opcSal = 1 then
    begin
      try
        qryLavacao.Close;
        qryLavacao.SQL.Clear;
        qryLavacao.SQL.Add('INSERT INTO lavacoes (codfornecedor,codequipamento,data, valor, descricao');

        if CbxStatus.ItemIndex > 0 then
          qryLavacao.SQL.Add(',status');

        qryLavacao.SQL.Add(')');

        qryLavacao.SQL.Add('VALUES (:forn,:equip,:data,:vlr,:desc');

        if CbxStatus.ItemIndex > 0 then
          qryLavacao.SQL.Add(',:sta');

        qryLavacao.SQL.Add(')');

        qryLavacao.ParamByName('forn').AsInteger := StrToInt(edtCodFornecedor.Text);
        qryLavacao.ParamByName('equip').AsInteger:= StrToInt(edtCodEquipamento.Text);
        qryLavacao.ParamByName('data').AsDate := StrToDate(mskData.Text);
        qryLavacao.ParamByName('vlr').AsFloat := StrToFloat(edtValor.Text);
        qryLavacao.ParamByName('desc').AsString := edtDescricao.Text;

        if CbxStatus.ItemIndex > 0 then
          qryLavacao.ParamByName('sta').AsInteger := CbxStatus.ItemIndex;

        qryLavacao.Prepared := True;
        qryLavacao.ExecSQL();
      except
        MessageDlg('Erro ao gravar lavação!',mtError,[mbOk],0);
      end;
    end;

  if opcSal = 2 then
    begin
      try
        qryLavacao.Close;
        qryLavacao.SQL.Clear;
        qryLavacao.SQL.Add('UPDATE lavacoes SET codfornecedor=:forn,codequipamento=:equip,');
        qryLavacao.SQL.Add('data=:data,valor=:vlr,descricao=:desc,status=:sta');
        qryLavacao.SQL.Add('WHERE codigo = :cod');
        qryLavacao.ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
        qryLavacao.ParamByName('forn').AsInteger := StrToInt(edtCodFornecedor.Text);
        qryLavacao.ParamByName('equip').AsInteger:= StrToInt(edtCodEquipamento.Text);
        qryLavacao.ParamByName('data').AsDate := StrToDate(mskData.Text);
        qryLavacao.ParamByName('vlr').AsFloat := StrToFloat(edtValor.Text);
        qryLavacao.ParamByName('desc').AsString := edtDescricao.Text;

        if CbxStatus.ItemIndex > 0 then
          qryLavacao.ParamByName('sta').AsInteger := CbxStatus.ItemIndex;

        qryLavacao.Prepared := true;
        qryLavacao.ExecSQL();
      except
        MessageDlg('Erro ao alterar a lavação!',mtError,[mbOk],0);
      end;

    end;

  Self.Close;
end;

procedure TfrmIncluirLavacao.edtCodFornecedorEnter(Sender: TObject);
begin
  lblFornecedor.Caption := '';
end;

procedure TfrmIncluirLavacao.edtCodEquipamentoEnter(Sender: TObject);
begin
  lblEquipamento.Caption := '';
end;

end.
