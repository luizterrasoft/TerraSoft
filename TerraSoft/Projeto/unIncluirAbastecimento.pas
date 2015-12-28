unit unIncluirAbastecimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls, FMTBcd,
  Provider, DBClient, DB, SqlExpr, unFuncoes;

type
  TfrmIncluirAbastecimento = class(TForm)
    PnIncluirAbastecimento: TPanel;
    lblTipoCombustivel: TLabel;
    lblEquipamento: TLabel;
    lblFornecedor: TLabel;
    lblFuncionario: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodTipoCombustivel: TEdit;
    BtnBuscaTipoCombustivel: TBitBtn;
    edtCodEquipamento: TEdit;
    BtnBuscaEquipamento: TBitBtn;
    edtCodFornecedor: TEdit;
    BtnBuscaFornecedor: TBitBtn;
    edtCodFuncionario: TEdit;
    BtnBuscaFuncionario: TBitBtn;
    edtQtd: TEdit;
    lblQtd: TLabel;
    Label5: TLabel;
    mskDataAbast: TMaskEdit;
    Label6: TLabel;
    edtKMHora: TEdit;
    Label7: TLabel;
    RchEdtObs: TRichEdit;
    PnBotoes: TPanel;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    qryAbastecimento: TSQLQuery;
    dsAbastecimento: TDataSource;
    cdsAbastecimento: TClientDataSet;
    dspAbastecimento: TDataSetProvider;
    Label8: TLabel;
    Label9: TLabel;
    edtVlrUnit: TEdit;
    edtVlrTotal: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    edtCodPlanoConta: TEdit;
    edtCodSubPlanoConta: TEdit;
    BtnBuscaPlanoConta: TBitBtn;
    BtnBuscaSubPlanoConta: TBitBtn;
    lblPlanoConta: TLabel;
    lblSubPlanoConta: TLabel;
    Label12: TLabel;
    edtDocumento: TEdit;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodTipoCombustivelExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtCodTipoCombustivelEnter(Sender: TObject);
    procedure edtCodEquipamentoExit(Sender: TObject);
    procedure edtCodFornecedorExit(Sender: TObject);
    procedure edtCodFornecedorEnter(Sender: TObject);
    procedure edtCodEquipamentoEnter(Sender: TObject);
    procedure edtCodFuncionarioEnter(Sender: TObject);
    procedure edtCodFuncionarioExit(Sender: TObject);
    procedure edtVlrUnitExit(Sender: TObject);
    procedure BtnBuscaTipoCombustivelClick(Sender: TObject);
    procedure BtnBuscaEquipamentoClick(Sender: TObject);
    procedure BtnBuscaFornecedorClick(Sender: TObject);
    procedure BtnBuscaFuncionarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnBuscaPlanoContaClick(Sender: TObject);
    procedure edtCodPlanoContaExit(Sender: TObject);
    procedure edtCodPlanoContaEnter(Sender: TObject);
    procedure edtCodSubPlanoContaEnter(Sender: TObject);
    procedure edtCodSubPlanoContaExit(Sender: TObject);
    procedure BtnBuscaSubPlanoContaClick(Sender: TObject);
  private

    loFuncoes: TFuncoes;
    function ValidaAbastecimento: boolean;
  public
    iOpc: integer;
  end;

var
  frmIncluirAbastecimento: TfrmIncluirAbastecimento;

implementation

{$R *.dfm}

uses unDM, unTiposCombustiveis, unEquipamentos, unFornecedores, unFuncionarios,
  unPlanoContas, unSubPlanosdeContas;

procedure TfrmIncluirAbastecimento.BtnBuscaEquipamentoClick(Sender: TObject);
begin
  frmEquipamentos := TfrmEquipamentos.Create(self);
  frmEquipamentos.telaChamando := 11;
  frmEquipamentos.ShowModal;
  FreeAndNil(frmEquipamentos);

  if lblEquipamento.Caption <> trim('') then
    edtCodFornecedor.SetFocus;
end;

procedure TfrmIncluirAbastecimento.BtnBuscaFornecedorClick(Sender: TObject);
begin
  frmFornecedores := TfrmFornecedores.Create(self);
  frmFornecedores.telaChamando := 9;
  frmFornecedores.ShowModal;
  FreeAndNil(frmFornecedores);

  if lblFornecedor.Caption <> trim('') then
    edtCodFuncionario.SetFocus;
end;

procedure TfrmIncluirAbastecimento.BtnBuscaFuncionarioClick(Sender: TObject);
begin
  frmFuncionarios := TfrmFuncionarios.Create(self);
  frmFuncionarios.telaChamando := 7;
  frmFuncionarios.ShowModal;
  FreeAndNil(frmFuncionarios);

  if lblFuncionario.Caption <> trim('') then
    edtQtd.SetFocus;
end;

procedure TfrmIncluirAbastecimento.BtnBuscaPlanoContaClick(Sender: TObject);
begin
  frmPlanoContas := TfrmPlanoContas.Create(self);
  frmPlanoContas.telaChamando := 8;
  frmPlanoContas.ShowModal;
  FreeAndNil(frmPlanoContas);

  if lblPlanoConta.Caption <> trim('') then
    edtCodSubPlanoConta.SetFocus;
end;

procedure TfrmIncluirAbastecimento.BtnBuscaSubPlanoContaClick(Sender: TObject);
begin
  frmSubPlanosdeContas := TfrmSubPlanosdeContas.Create(self);
  frmSubPlanosdeContas.telaChamando := 3;
  frmSubPlanosdeContas.ShowModal;
  FreeAndNil(frmSubPlanosdeContas);

  if lblSubPlanoConta.Caption <> trim('') then
    edtQtd.SetFocus;
end;

procedure TfrmIncluirAbastecimento.BtnBuscaTipoCombustivelClick(
  Sender: TObject);
begin
  frmTiposCombustiveis := TfrmTiposCombustiveis.Create(self);
  frmTiposCombustiveis.telaChamando := 1;
  frmTiposCombustiveis.ShowModal;
  FreeAndNil(frmTiposCombustiveis);

  if lblTipoCombustivel.Caption <> trim('') then
    edtCodEquipamento.SetFocus;
end;

procedure TfrmIncluirAbastecimento.BtnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmIncluirAbastecimento.BtnGravarClick(Sender: TObject);
begin
  if not(ValidaAbastecimento) then
    Exit;

  try
    qryAbastecimento.Close;
    qryAbastecimento.SQL.Clear;
    qryAbastecimento.SQL.Add('INSERT INTO abastecimentos');
    qryAbastecimento.SQL.Add('(codtipocombustivel,codequipamento,codfornecedor,qtd,');
    qryAbastecimento.SQL.Add('dataabastecimento,codfuncionario,kmhr,obs,vlrunit,total,');
    qryAbastecimento.SQL.Add('codplanoconta,codsubplanoconta,documento,status)');
    qryAbastecimento.SQL.Add('VALUES (:codTp,:codEq,:codFr,:qtd,:dtAba,:CFunc,:kmhr,:obs,');
    qryAbastecimento.SQL.Add(':uni,:tot,:pco,:sco,:doc,:sta)');
    qryAbastecimento.ParamByName('codTp').AsInteger := StrToInt(edtCodTipoCombustivel.Text);
    qryAbastecimento.ParamByName('codEq').AsInteger := StrToInt(edtCodEquipamento.Text);
    qryAbastecimento.ParamByName('codFr').AsInteger := StrToInt(edtCodFornecedor.Text);
    qryAbastecimento.ParamByName('qtd').AsFloat     := StrToFloat(edtQtd.Text);
    qryAbastecimento.ParamByName('dtAba').AsDate    := StrToDate(mskDataAbast.Text);
    qryAbastecimento.ParamByName('CFunc').AsInteger := StrToInt(edtCodFuncionario.Text);
    qryAbastecimento.ParamByName('kmhr').AsFloat    := StrToFloat(edtKMHora.Text);
    qryAbastecimento.ParamByName('obs').AsString    := RchEdtObs.Text;
    qryAbastecimento.ParamByName('uni').AsFloat     := StrToFloat(edtVlrUnit.Text);
    qryAbastecimento.ParamByName('tot').AsFloat     := StrToFloat(edtVlrTotal.Text);
    qryAbastecimento.ParamByName('pco').AsInteger   := StrToInt(edtCodPlanoConta.Text);
    qryAbastecimento.ParamByName('sco').AsInteger   := StrToInt(edtCodSubPlanoConta.Text);
    qryAbastecimento.ParamByName('doc').AsString    := edtDocumento.Text;
    qryAbastecimento.ParamByName('sta').AsString    := 'A';
    qryAbastecimento.Prepared := True;
    qryAbastecimento.ExecSQL();
    Self.Close;

  except
    on e: Exception do
    raise Exception.Create('N�o foi poss�vel registrar o abastecimento!' + #13 + e.Message);
  end;
end;

procedure TfrmIncluirAbastecimento.edtCodEquipamentoEnter(Sender: TObject);
begin
  lblEquipamento.Caption := '';
end;

procedure TfrmIncluirAbastecimento.edtCodEquipamentoExit(Sender: TObject);
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

procedure TfrmIncluirAbastecimento.edtCodFornecedorEnter(Sender: TObject);
begin
  lblFornecedor.Caption := '';
end;

procedure TfrmIncluirAbastecimento.edtCodFornecedorExit(Sender: TObject);
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

procedure TfrmIncluirAbastecimento.edtCodFuncionarioEnter(Sender: TObject);
begin
  lblFuncionario.Caption := '';
end;

procedure TfrmIncluirAbastecimento.edtCodFuncionarioExit(Sender: TObject);
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
        edtCodPlanoConta.SetFocus;
    end;
end;

procedure TfrmIncluirAbastecimento.edtCodPlanoContaEnter(Sender: TObject);
begin
  lblPlanoConta.Caption := '';
end;

procedure TfrmIncluirAbastecimento.edtCodPlanoContaExit(Sender: TObject);
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
        edtCodSubPlanoConta.SetFocus;
    end;
end;

procedure TfrmIncluirAbastecimento.edtCodSubPlanoContaEnter(Sender: TObject);
begin
  lblSubPlanoConta.Caption := '';
end;

procedure TfrmIncluirAbastecimento.edtCodSubPlanoContaExit(Sender: TObject);
begin
  if edtCodSubPlanoConta.Text <> trim('') then
    begin
      lblSubPlanoConta.Caption := loFuncoes.BuscaFk(edtCodSubPlanoConta.Text,'subplanocontas','descricao');

      if lblSubPlanoConta.Caption = trim('') then
        begin
          edtCodSubPlanoConta.Clear;
          BtnBuscaSubPlanoConta.SetFocus;
        end
      else
        edtQtd.SetFocus;
    end;
end;

procedure TfrmIncluirAbastecimento.edtCodTipoCombustivelEnter(Sender: TObject);
begin
  lblTipoCombustivel.Caption := '';
end;

procedure TfrmIncluirAbastecimento.edtCodTipoCombustivelExit(Sender: TObject);
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

procedure TfrmIncluirAbastecimento.edtVlrUnitExit(Sender: TObject);
begin
  if ((edtQtd.Text <> trim('')) and (edtQtd.Text <> trim('0'))) and ((edtVlrUnit.Text <> trim('')) and (edtVlrUnit.Text <> trim('0')))  then
    begin
      edtVlrTotal.Text := FloatToStr(StrToFloat(edtQtd.Text) * StrToFloat(edtVlrUnit.Text));
      edtVlrTotal.Text := loFuncoes.TrataReal(edtVlrTotal.Text);
      edtVlrUnit.Text  := loFuncoes.TrataReal(edtVlrUnit.Text);
    end
  else

end;

procedure TfrmIncluirAbastecimento.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmIncluirAbastecimento.FormDestroy(Sender: TObject);
begin
  loFuncoes.Destroy;
end;

procedure TfrmIncluirAbastecimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    BtnCancelarClick(self);
end;

procedure TfrmIncluirAbastecimento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TfrmIncluirAbastecimento.FormShow(Sender: TObject);
begin
  if iOpc = 0 then
    begin
      PnIncluirAbastecimento.Enabled := False;
      BtnGravar.Enabled := False;
    end;

  if iOpc = 1 then
    begin
      PnIncluirAbastecimento.Enabled := True;
      BtnGravar.Enabled := True;
    end;
end;

function TfrmIncluirAbastecimento.ValidaAbastecimento: boolean;
var
  bRetorno: boolean;
begin
  bRetorno := False;

  if (edtCodTipoCombustivel.Text = trim('')) or (edtCodTipoCombustivel.Text = trim('0')) then
    begin
      MessageDlg('Por favor informe o tipo de combust�vel!',mtWarning,[mbOk],0);
      edtCodTipoCombustivel.SetFocus;
      Exit;
    end;

  if (edtCodEquipamento.Text = trim('')) or (edtCodEquipamento.Text = trim('0')) then
    begin
      MessageDlg('Por favor informe o equipamento que foi abastecido!',mtWarning,[mbOk],0);
      edtCodEquipamento.SetFocus;
      Exit;
    end;

  if (edtCodFornecedor.Text = trim('')) or (edtCodFornecedor.Text = trim('0')) then
    begin
      MessageDlg('Por favor informe o fornecedor do combust�vel!',mtWarning,[mbOk],0);
      edtCodFornecedor.SetFocus;
      Exit;
    end;

  if (edtCodFuncionario.Text = trim('')) or (edtCodFuncionario.Text = trim('0')) then
    begin
      MessageDlg('Por favor informe o funcion�rio que abasteceu!',mtWarning,[mbOk],0);
      edtCodFuncionario.SetFocus;
      Exit;
    end;

  if (edtCodPlanoConta.Text = trim('')) or (edtCodPlanoConta.Text = trim('0')) then
    begin
      MessageDlg('Por favor informe o plano de contas!',mtWarning,[mbOk],0);
      edtCodPlanoConta.SetFocus;
      Exit;
    end;

  if (edtCodSubPlanoConta.Text = trim('')) or (edtCodSubPlanoConta.Text = trim('0')) then
    begin
      MessageDlg('Por favor informe o sub-plano de contas!',mtWarning,[mbOk],0);
      edtCodSubPlanoConta.SetFocus;
      Exit;
    end;

  if edtQtd.Text = trim('') then
    begin
      MessageDlg('Por favor informe a quantidade abastecida!',mtWarning,[mbOk],0);
      edtQtd.SetFocus;
      Exit;
    end;

  if (edtVlrUnit.Text = trim('0')) or (edtVlrUnit.Text = trim('0')) then
    begin
      MessageDlg('Por favor informe o valor unit�rio do produto!',mtWarning,[mbOk],0);
      edtVlrUnit.SetFocus;
      Exit;
    end;



  if mskDataAbast.Text = '  /  /    ' then
    begin
      MessageDlg('Por favor informe a data do abastecimento!',mtWarning,[mbOk],0);
      mskDataAbast.SetFocus;
      Exit;
    end;

  if edtKMHora.Text = trim('0') then
    begin
      MessageDlg('Por favor informe com quantas horas/km foi abastecido o equipamento!',mtWarning,[mbOk],0);
      edtKMHora.SetFocus;
      Exit;
    end;



  bRetorno := True;

  Result := bRetorno;
end;

end.