unit unIncluirContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ComCtrls, FMTBcd, SqlExpr,
  Provider, DB, DBClient, unFuncoes;

type
  TfrmIncluirContasReceber = class(TForm)
    PnTopo: TPanel;
    lblTitulo: TLabel;
    PnConta: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskEmissao: TMaskEdit;
    mskVencimento: TMaskEdit;
    Label3: TLabel;
    edtDescricao: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtValor: TEdit;
    edtNumeroParcela: TEdit;
    edtCodCliente: TEdit;
    BtnBuscaCliente: TBitBtn;
    lblCliente: TLabel;
    dsContasReceber: TDataSource;
    cdsContasReceber: TClientDataSet;
    dspContasReceber: TDataSetProvider;
    qryContasReceber: TSQLQuery;
    qryCR: TSQLQuery;
    dsCR: TDataSource;
    cdsCR: TClientDataSet;
    dspCR: TDataSetProvider;
    lblTipoCobranca: TLabel;
    lblResTipoCobranca: TLabel;
    edtCodiTipoCobranca: TEdit;
    BtnBuscaCodiTipoCobranca: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnGravar: TBitBtn;
    Bevel1: TBevel;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodClienteEnter(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnBuscaClienteClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure PnContaExit(Sender: TObject);
    procedure edtCodTipoCobrancaEnter(Sender: TObject);
    procedure BtnBuscaTipoCobrancaClick(Sender: TObject);
    procedure BtnBuscaCodiTipoCobrancaClick(Sender: TObject);
    procedure edtCodiTipoCobrancaExit(Sender: TObject);
    procedure edtCodiTipoCobrancaEnter(Sender: TObject);
    procedure RchEdtObsKeyPress(Sender: TObject; var Key: Char);
    procedure BtnGravarClick(Sender: TObject);
  private

    loFuncoes: TFuncoes;
    procedure limpar;
  public
    codConta: integer;
    opcSal: integer;
    sTipoCobranca: string;
    iTipoCobranca: integer;

    procedure buscaTipoCobranca;
  end;

var
  frmIncluirContasReceber: TfrmIncluirContasReceber;

implementation

uses unDM, UnClientes, unPlanoContas, unFormasPgto, unTiposCobrancas;

{$R *.dfm}

procedure TfrmIncluirContasReceber.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmIncluirContasReceber.limpar;
begin
  mskEmissao.Clear;
  mskVencimento.Clear;
  edtDescricao.Clear;
  edtValor.Text := '0,00';
  edtNumeroParcela.Clear;
  edtCodCliente.Clear;
  lblCliente.Caption := '';
  lblResTipoCobranca.Caption := '';
end;

procedure TfrmIncluirContasReceber.FormShow(Sender: TObject);
begin
  if opcSal = 0 then
    begin
      limpar;
      mskEmissao.Text := DateToStr(Date);
      mskEmissao.SetFocus;
    end;

  if opcSal = 1 then
    begin
      buscaTipoCobranca;
    end;
end;

procedure TfrmIncluirContasReceber.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmIncluirContasReceber.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TfrmIncluirContasReceber.edtCodClienteEnter(Sender: TObject);
begin
  lblCliente.Caption := '';
end;

procedure TfrmIncluirContasReceber.edtCodClienteExit(Sender: TObject);
begin
  if edtCodCliente.Text <> trim('') then
    begin
      lblCliente.Caption := loFuncoes.BuscaFk(edtCodCliente.Text,'clientes','nome');

      if lblCliente.Caption = trim('') then
        begin
          edtCodCliente.Clear;
          BtnBuscaCliente.SetFocus;
        end
      else
        begin
          edtCodiTipoCobranca.SetFocus;
        end;                  
    end;
end;

procedure TfrmIncluirContasReceber.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmIncluirContasReceber.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmIncluirContasReceber.BtnBuscaClienteClick(Sender: TObject);
begin
  frmClientes := TfrmClientes.Create(self);
  frmClientes.telaChamando := 3;
  frmClientes.ShowModal;
  FreeAndNil(frmClientes);

  if lblCliente.Caption <> trim('') then
    edtCodiTipoCobranca.SetFocus;
end;

procedure TfrmIncluirContasReceber.edtValorExit(Sender: TObject);
begin
  if (edtValor.Text <> trim('')) and (edtValor.Text <> trim('0')) then
    edtValor.Text := loFuncoes.TrataReal(edtValor.Text);
end;

procedure TfrmIncluirContasReceber.PnContaExit(Sender: TObject);
begin
  if edtCodCliente.Text <> trim('') then
    begin
      lblCliente.Caption := loFuncoes.BuscaFk(edtCodCliente.Text,'clientes','nome');

      if lblCliente.Caption = trim('') then
        begin
          edtCodCliente.Clear;
          BtnBuscaCliente.SetFocus;
        end
      else
        edtCodiTipoCobranca.SetFocus;
    end;
end;

procedure TfrmIncluirContasReceber.edtCodTipoCobrancaEnter(
  Sender: TObject);
begin
  lblResTipoCobranca.Caption := '';
end;

procedure TfrmIncluirContasReceber.BtnBuscaTipoCobrancaClick(
  Sender: TObject);
begin
  frmTiposCobrancas := TfrmTiposCobrancas.Create(self);
  frmTiposCobrancas.telaChamando := 2;
  frmTiposCobrancas.ShowModal;
  FreeAndNil(frmTiposCobrancas);

  if lblResTipoCobranca.Caption <> trim('') then
    BtnGravar.SetFocus;
end;

procedure TfrmIncluirContasReceber.BtnBuscaCodiTipoCobrancaClick(
  Sender: TObject);
begin
  frmTiposCobrancas := TfrmTiposCobrancas.Create(self);
  frmTiposCobrancas.telaChamando := 2;
  frmTiposCobrancas.ShowModal;
  FreeAndNil(frmTiposCobrancas);

  if lblResTipoCobranca.Caption <> trim('') then
    BtnGravar.SetFocus;
end;

procedure TfrmIncluirContasReceber.edtCodiTipoCobrancaExit(
  Sender: TObject);
begin
  if edtCodiTipoCobranca.Text <> trim('') then
    begin
      lblResTipoCobranca.Caption := loFuncoes.BuscaFk(edtCodiTipoCobranca.Text,'tipocobranca','descricao');

      if lblResTipoCobranca.Caption = trim('') then
        begin
          edtCodiTipoCobranca.Clear;
          BtnBuscaCodiTipoCobranca.SetFocus;
        end
      else
        BtnGravar.SetFocus;
    end;
end;

procedure TfrmIncluirContasReceber.edtCodiTipoCobrancaEnter(
  Sender: TObject);
begin
  lblResTipoCobranca.Caption := '';
end;

procedure TfrmIncluirContasReceber.RchEdtObsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
    end;
end;

procedure TfrmIncluirContasReceber.buscaTipoCobranca;
begin
  qryCR.Close;
  qryCR.SQL.Clear;
  qryCR.SQL.Add('SELECT * FROM tipocobranca');
  qryCR.SQL.Add('WHERE descricao = :desc');
  qryCR.ParamByName('desc').AsString := sTipoCobranca;
  qryCR.Open;
  cdsCR.Close;
  cdsCR.Open;

  edtCodiTipoCobranca.Text := cdsCR.FieldByName('codigo').AsString;
  lblResTipoCobranca.Caption  := sTipoCobranca;
end;

procedure TfrmIncluirContasReceber.BtnGravarClick(Sender: TObject);
begin
  try
    if opcSal = 0 then
      begin
        with qryContasReceber, SQL do
          begin
            Close;
            Clear;
            Add('INSERT INTO contasreceber');
            Add('(emissao,vencimento,descricao,valor,numeroparcela,codcliente,status,tipocobranca)');
            Add('VALUES (:emi,:ven,:des,:vlr,:npa,:cli,:sta,:tpcob)') ;
            ParamByName('emi').AsDate := StrToDate(mskEmissao.Text);
            ParamByName('ven').AsDate := StrToDate(mskVencimento.Text);
            ParamByName('des').AsString := edtDescricao.Text;
            ParamByName('vlr').AsFloat := StrToFloat(edtValor.Text);
            ParamByName('npa').AsInteger := StrToInt(edtNumeroParcela.Text);
            ParamByName('cli').AsInteger := StrToInt(edtCodCliente.Text);
            ParamByName('sta').AsString := 'A';
            ParamByName('tpcob').AsString := lblResTipoCobranca.Caption;
            Prepared := True;
            ExecSQL();
          end;
      end
    else
    if opcSal = 1 then
      begin
        with qryContasReceber, SQL do
          begin
            Close;
            Clear;
            Add('UPDATE contasreceber SET emissao=:emi,vencimento=:ven,descricao=:des,valor=:vlr,');
            Add('numeroparcela=:npa,codcliente=:cli,status=:sta, tipocobranca=:tpcob');
            Add('WHERE codigo = :codigo');
            ParamByName('codigo').AsInteger := codConta;
             ParamByName('emi').AsDate := StrToDate(mskEmissao.Text);
            ParamByName('ven').AsDate := StrToDate(mskVencimento.Text);
            ParamByName('des').AsString := edtDescricao.Text;
            ParamByName('vlr').AsFloat := StrToFloat(edtValor.Text);
            ParamByName('npa').AsInteger := StrToInt(edtNumeroParcela.Text);
            ParamByName('cli').AsInteger := StrToInt(edtCodCliente.Text);
            ParamByName('sta').AsString := 'A';
            ParamByName('tpcob').AsString := lblResTipoCobranca.Caption;
            ExecSQL();
          end;
      end;
  except
    MessageDlg('Erro ao gravar!',mtError,[mbOk],0);
  end;

  Self.Close;
end;

end.
