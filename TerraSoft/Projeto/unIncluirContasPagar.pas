unit unIncluirContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, Mask, FMTBcd, SqlExpr,
  Provider, DB, DBClient, unFuncoes;

type
  TfrmIncluirContasPagar = class(TForm)
    PnTopo: TPanel;
    Panel2: TPanel;
    PnDados: TPanel;
    PnRodape: TPanel;
    lblTitulo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblFornecedor: TLabel;
    Label9: TLabel;
    mskEmissao: TMaskEdit;
    mskVencimento: TMaskEdit;
    edtDescricao: TEdit;
    edtValor: TEdit;
    edtNumeroParcela: TEdit;
    edtCodFornecedor: TEdit;
    BtnBuscaFornecedor: TBitBtn;
    RchEdtObs: TRichEdit;
    BtnConfirmar: TBitBtn;
    BtnCancelar: TBitBtn;
    dsContasPagar: TDataSource;
    cdsContasPagar: TClientDataSet;
    dspContasPagar: TDataSetProvider;
    qryContasPagar: TSQLQuery;
    Label7: TLabel;
    edtCodPlanoConta: TEdit;
    BtnBuscaPlanoConta: TBitBtn;
    lblPlanoConta: TLabel;
    Label8: TLabel;
    edtCodSubPlano: TEdit;
    BtnBuscaSubPlano: TBitBtn;
    lblSubPlano: TLabel;
    lblNotaFiscal: TLabel;
    edtNotaFiscal: TEdit;
    lblBuscaEquipamento: TLabel;
    edtCodEquipamento: TEdit;
    BtnBuscaEquipamento: TBitBtn;
    lblEquipamento: TLabel;
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodFornecedorEnter(Sender: TObject);
    procedure edtCodFornecedorExit(Sender: TObject);
    procedure BtnBuscaFornecedorClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure edtCodPlanoContaExit(Sender: TObject);
    procedure edtCodPlanoContaEnter(Sender: TObject);
    procedure edtCodSubPlanoExit(Sender: TObject);
    procedure edtCodSubPlanoEnter(Sender: TObject);
    procedure BtnBuscaPlanoContaClick(Sender: TObject);
    procedure BtnBuscaSubPlanoClick(Sender: TObject);
    procedure BtnBuscaEquipamentoClick(Sender: TObject);
    procedure edtCodEquipamentoExit(Sender: TObject);
    procedure edtCodEquipamentoEnter(Sender: TObject);
  private
    loFuncoes: TFuncoes;
  public
    opcSal: integer;
    codConta: integer;
  end;

var
  frmIncluirContasPagar: TfrmIncluirContasPagar;

implementation

uses unDM, unFornecedores, unPlanoContas, unSubPlanosdeContas,
  unEquipamentos;

{$R *.dfm}

procedure TfrmIncluirContasPagar.BtnConfirmarClick(Sender: TObject);
begin
  if (edtNumeroParcela.Text = ('0.00')) or (edtNumeroParcela.Text = ('0,00'))
  and (edtNumeroParcela.Text = ('0')) or (edtNumeroParcela.Text = trim('')) then
    begin
      MessageDlg('Campo n�mero da parcela deve ser informado!',mtWarning,[mbOk],0);
      edtNumeroParcela.SetFocus;
      Exit;
    end;

  try
    if opcSal = 0 then
      begin
        with qryContasPagar, SQL do
          begin
            Close;
            Clear;
            Add('INSERT INTO contaspagar');
            Add('(lancamento,vencimento,descricao,valor,numeroparcela,codfornecedor,obs,status,numeronf,codplanoconta,');
            Add('codsubplanoconta,codequipamento)');
            Add('VALUES (:lan,:ven,:des,:vlr,:npa,:for,:obs,:sta,:nnf,:cpc,:cspc,:equip)') ;
            ParamByName('lan').AsDate := StrToDate(mskEmissao.Text);
            ParamByName('ven').AsDate := StrToDate(mskVencimento.Text);
            ParamByName('des').AsString := edtDescricao.Text;
            ParamByName('vlr').AsFloat := StrToFloat(edtValor.Text);
            ParamByName('npa').AsInteger := StrToInt(edtNumeroParcela.Text);
            ParamByName('for').AsInteger := StrToInt(edtCodFornecedor.Text);
            ParamByName('obs').AsString := RchEdtObs.Text;
            ParamByName('sta').AsString := 'A';
            ParamByName('nnf').AsString := edtNotaFiscal.Text;
            ParamByName('cpc').AsInteger:= StrToInt(edtCodPlanoConta.Text);
            ParamByName('cspc').AsInteger := StrToInt(edtCodSubPlano.Text);
            ParamByName('equip').AsInteger:= StrToInt(edtCodEquipamento.Text);
            Prepared := True;
            ExecSQL();
          end;
      end
    else
    if opcSal = 1 then
      begin
        with qryContasPagar, SQL do
          begin
            Close;
            Clear;
            Add('UPDATE contaspagar SET lancamento=:lan,vencimento=:ven,descricao=:des,valor=:vlr,');
            Add('numeroparcela=:npa,codfornecedor=:for,obs=:obs,status=:sta,numeronf=:nnf');
            Add(',codplanoconta=:cpc,codsubplanoconta=:cspc,codequipamento=:equip');
            Add('WHERE codigo = :codigo');
            ParamByName('codigo').AsInteger := codConta;
             ParamByName('lan').AsDate := StrToDate(mskEmissao.Text);
            ParamByName('ven').AsDate := StrToDate(mskVencimento.Text);
            ParamByName('des').AsString := edtDescricao.Text;
            ParamByName('vlr').AsFloat := StrToFloat(edtValor.Text);
            ParamByName('npa').AsInteger := StrToInt(edtNumeroParcela.Text);
            ParamByName('for').AsInteger := StrToInt(edtCodFornecedor.Text);
            ParamByName('obs').AsString := RchEdtObs.Text;
            ParamByName('sta').AsString := 'A';
            ParamByName('nnf').AsString := edtNotaFiscal.Text;
            ParamByName('cpc').AsInteger:= StrToInt(edtCodPlanoConta.Text);
            ParamByName('cspc').AsInteger:= StrToInt(edtCodSubPlano.Text);
            ParamByName('equip').AsInteger:= StrToInt(edtCodEquipamento.Text);
            Prepared := True;
            ExecSQL();
          end;
      end;
  except
    MessageDlg('Erro ao gravar!',mtError,[mbOk],0);
  end;

  Self.Close;
end;

procedure TfrmIncluirContasPagar.BtnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmIncluirContasPagar.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmIncluirContasPagar.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TfrmIncluirContasPagar.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmIncluirContasPagar.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmIncluirContasPagar.FormShow(Sender: TObject);
begin
  if opcSal = 0 then
    begin
      mskEmissao.Text := DateToStr(Date);
      mskEmissao.SetFocus;
    end;
end;

procedure TfrmIncluirContasPagar.edtCodFornecedorEnter(Sender: TObject);
begin
  lblFornecedor.Caption := '';
end;

procedure TfrmIncluirContasPagar.edtCodFornecedorExit(Sender: TObject);
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
        BtnConfirmar.SetFocus;
    end;
end;

procedure TfrmIncluirContasPagar.BtnBuscaFornecedorClick(Sender: TObject);
begin
  frmFornecedores := TfrmFornecedores.Create(self);
  frmFornecedores.telaChamando := 3;
  frmFornecedores.ShowModal;
  FreeAndNil(frmFornecedores);

  if lblFornecedor.Caption <> trim('') then
    edtCodPlanoConta.SetFocus;
end;

procedure TfrmIncluirContasPagar.edtValorExit(Sender: TObject);
begin
  if (edtValor.Text <> trim('')) and (edtValor.Text <> trim('0')) then
    edtValor.Text := loFuncoes.TrataReal(edtValor.Text);
end;

procedure TfrmIncluirContasPagar.edtCodPlanoContaExit(Sender: TObject);
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

procedure TfrmIncluirContasPagar.edtCodPlanoContaEnter(Sender: TObject);
begin
  lblPlanoConta.Caption := '';
end;

procedure TfrmIncluirContasPagar.edtCodSubPlanoExit(Sender: TObject);
begin
  if edtCodSubPlano.Text <> trim('') then
    begin
      lblSubPlano.Caption := loFuncoes.BuscaFk(edtCodSubPlano.Text,'subplanocontas','descricao');

      if lblSubPlano.Caption = trim('') then
        begin
          edtCodSubPlano.Clear;
          BtnBuscaSubPlano.SetFocus;
        end
      else
        edtCodEquipamento.SetFocus;
    end;
end;

procedure TfrmIncluirContasPagar.edtCodSubPlanoEnter(Sender: TObject);
begin
  lblSubPlano.Caption := '';
end;

procedure TfrmIncluirContasPagar.BtnBuscaPlanoContaClick(Sender: TObject);
begin
  frmPlanoContas := TfrmPlanoContas.Create(self);
  frmPlanoContas.telaChamando := 7;
  frmPlanoContas.ShowModal;
  FreeAndNil(frmPlanoContas);

  if lblPlanoConta.Caption <> trim('') then
    edtCodSubPlano.SetFocus;
end;

procedure TfrmIncluirContasPagar.BtnBuscaSubPlanoClick(Sender: TObject);
begin
  frmSubPlanosdeContas := TfrmSubPlanosdeContas.Create(self);

  { PASSA O CODIGO DO PLANO DE CONTAS PRA FILTRAR APENAS OS SUBPLANOS DELE }
  if (edtCodPlanoConta.Text <> trim('')) and (edtCodPlanoConta.Text <> '0') then
    frmSubPlanosdeContas.CodPlanoConta:= StrToInt(edtCodPlanoConta.Text);

  frmSubPlanosdeContas.telaChamando := 2;
  frmSubPlanosdeContas.ShowModal;
  FreeAndNil(frmSubPlanosdeContas);

  if lblSubPlano.Caption <> trim('') then
    edtCodEquipamento.SetFocus;
end;

procedure TfrmIncluirContasPagar.BtnBuscaEquipamentoClick(Sender: TObject);
begin
  frmEquipamentos := TfrmEquipamentos.Create(self);
  frmEquipamentos.telaChamando := 8;
  frmEquipamentos.ShowModal;
  FreeAndNil(frmEquipamentos);

  if lblEquipamento.Caption <> trim('') then
    BtnConfirmar.SetFocus;
end;

procedure TfrmIncluirContasPagar.edtCodEquipamentoExit(Sender: TObject);
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
        BtnConfirmar.SetFocus;
    end;
end;

procedure TfrmIncluirContasPagar.edtCodEquipamentoEnter(Sender: TObject);
begin
  lblEquipamento.Caption := '';
end;

end.

