unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, DBXpress, DB,
  SqlExpr, FMTBcd, Provider, DBClient, RLConsts, Mask;

type
  TfrmPrincipal = class(TForm)
    PnConsultar: TPanel;
    lblPesquisaPor: TLabel;
    RdBtnCodigo: TRadioButton;
    RdBtnNome: TRadioButton;
    RdBtnCPF: TRadioButton;
    lblConsulta: TLabel;
    edtConsulta: TEdit;
    BtnConsultar: TBitBtn;
    PnBotoes: TPanel;
    BtnIncluir: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnImprimir: TBitBtn;
    BtnSair: TBitBtn;
    BtnRelatorio: TBitBtn;
    PnClientes: TPanel;
    GrdClientes: TDBGrid;
    qryClientes: TSQLQuery;
    dsClientes: TDataSource;
    cdsClientes: TClientDataSet;
    dspClientes: TDataSetProvider;
    Connection: TSQLConnection;
    BtnMostrartodos: TBitBtn;
    mskLicenca: TMaskEdit;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnMostrartodosClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure GrdClientesCellClick(Column: TColumn);
    procedure BtnRelatorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    sDefault: string;
    iCodCliente: integer;
    procedure Conectar;
    procedure carregarDados;
    procedure mostraClientes;
    procedure mostraClienteRelatorio;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses unManutencaoCliente, unRelFichaCliente, unRelClientes;

{$R *.dfm}

procedure TfrmPrincipal.BtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPrincipal.BtnIncluirClick(Sender: TObject);
begin
  try
    frmManutencaoCliente := TfrmManutencaoCliente.Create(self);
    frmManutencaoCliente.iOpcsal := 1;
    frmManutencaoCliente.ShowModal;
    mostraClientes;
  finally
    FreeAndNil(frmManutencaoCliente);
  end;
end;

procedure TfrmPrincipal.BtnAlterarClick(Sender: TObject);
begin
  try
    frmManutencaoCliente := TfrmManutencaoCliente.Create(self);
    frmManutencaoCliente.iOpcsal := 2;
    carregarDados;
    frmManutencaoCliente.ShowModal;
    mostraClientes;
  finally
    FreeAndNil(frmManutencaoCliente);
  end;
end;

procedure TfrmPrincipal.BtnExcluirClick(Sender: TObject);
var
  iCliente: integer;
begin
  iCliente := cdsClientes.FieldByName('codigo').AsInteger;

  if (MessageDlg('Deseja realmente excluir o cliente: '+ cdsClientes.FieldByname('nome').AsString + ' ?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
    begin
      try
        qryClientes.Close;
        qryClientes.SQL.Clear;
        qryClientes.SQL.Add('DELETE FROM clientes');
        qryClientes.SQL.Add('WHERE codigo = :cod');
        qryClientes.ParamByName('cod').AsInteger := iCliente;
        qryClientes.ExecSQL();
        mostraClientes;
      except
        on e: Exception do
        raise Exception.Create('Não foi possível excluir o cliente!' + #13 + e.Message);
      end;
    end;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F2 then
    BtnIncluirClick(self);

  if key = VK_F3 then
    BtnAlterarClick(self);

  if key = VK_F4 then
    BtnExcluirClick(self);
end;

procedure TfrmPrincipal.mostraClientes;
begin
  try
    qryClientes.Close;
    qryClientes.SQL.Clear;
    qryClientes.SQL.Add('SELECT * FROM clientes');
    qryClientes.Open;
    cdsClientes.Close;
    cdsClientes.Open;
  except
    on e: Exception do
    raise Exception.Create('Não foi possível realizar a consulta!' + #13 + e.Message);
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  mostraClientes;
end;

procedure TfrmPrincipal.carregarDados;
begin
  frmManutencaoCliente.edtCodigo.Text := cdsClientes.FieldByName('codigo').AsString;
  frmManutencaoCliente.edtNome.Text   := cdsClientes.FieldByname('nome').AsString;
  frmManutencaoCliente.mskNascimento.Text := cdsClientes.FieldByName('nascimento').AsString;
  frmManutencaoCliente.mskDataCadastro.Text := cdsClientes.FieldByname('datacadastro').AsString;
  frmManutencaoCliente.edtEndereco.Text     := cdsClientes.FieldByName('endereco').AsString;
  frmManutencaoCliente.edtNumero.Text       := cdsClientes.FieldByName('numero').AsString;
  frmManutencaoCliente.edtMunicipio.Text    := cdsClientes.FieldByname('municipio').AsString;
  frmManutencaoCliente.CbxUF.ItemIndex      := cdsClientes.FieldByName('uf').AsInteger;
  frmManutencaoCliente.mskFone.Text         := cdsClientes.FieldByname('fone').AsString;
  frmManutencaoCliente.mskCelular.Text      := cdsClientes.FieldByName('celular').AsString;
  frmManutencaoCliente.mskCPF.Text          := cdsClientes.FieldByname('cpf').AsString;
  frmManutencaoCliente.edtRG.Text           := cdsClientes.FieldByName('rg').AsString;
  frmManutencaoCliente.CbxEstadoCivil.ItemIndex := cdsClientes.FieldByname('estadocivil').AsInteger;
  frmManutencaoCliente.edtOutroDocumento.Text   := cdsClientes.FieldByName('outrodoc').AsString;
  frmManutencaoCliente.edtConjuge.Text          := cdsClientes.FieldByname('conjuge').AsString;
  frmManutencaoCliente.edtEmpresa.Text          := cdsClientes.FieldByname('empresatrabalha').AsString;
  frmManutencaoCliente.edtprofissao.Text        := cdsClientes.FieldByname('profissaocargo').AsString;
  frmManutencaoCliente.edtPai.Text              := cdsClientes.FieldByname('pai').AsString;
  frmManutencaoCliente.edtMae.Text              := cdsClientes.FieldByname('mae').AsString;
  frmManutencaoCliente.edtValorAluguel.Text     := cdsClientes.FieldByname('valoraluguel').AsString;
  frmManutencaoCliente.edtReferencia.Text       := cdsClientes.FieldByName('referencia').AsString;
  frmManutencaoCliente.mskFoneRespAluguel.Text  := cdsClientes.FieldByName('foneresponsavelaluguel').AsString;
  frmManutencaoCliente.mskUltimaCompraPrazo.Text:= cdsClientes.FieldByName('ultimacompraprazo').AsString;
  frmManutencaoCliente.edtUltimaEmpresaComprou.Text := cdsClientes.FieldByName('empresaultimacompra').AsString;
  frmManutencaoCliente.RchEdtEmpresas.Text          := cdsClientes.FieldByname('empresasprazo').AsString;
  frmManutencaoCliente.edtValorCompra.Text          := cdsClientes.FieldByName('valor').AsString;
  frmManutencaoCliente.edtValorPrestacao.Text       := cdsClientes.FieldByName('valorprestacao').AsString;
  frmManutencaoCliente.CbxTipoPgto.ItemIndex        := cdsClientes.FieldByname('tipopagamento').AsInteger;
  frmManutencaoCliente.RchEdtObs.Text               := cdsClientes.FieldByname('observacoes').AsString;
end;

procedure TfrmPrincipal.BtnConsultarClick(Sender: TObject);
begin
  try
    qryClientes.Close;
    qryClientes.SQL.Clear;
    qryClientes.SQL.Add('SELECT * FROM clientes');

    if (RdBtnCodigo.Checked) and (edtConsulta.Text <> trim('')) then
      begin
        qryClientes.SQL.Add('WHERE codigo = :cod');
        qryClientes.ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
      end;

    if (RdBtnNome.Checked) and (edtConsulta.Text <> trim('')) then
      begin
        qryClientes.SQL.Add('WHERE nome LIKE :nome');
        qryClientes.ParamByName('nome').AsString := '%' + edtConsulta.Text + '%';
      end;

    if (RdBtnCPF.Checked) and (edtConsulta.Text <> trim('')) then
      begin
        qryClientes.SQL.Add('WHERE cpf LIKE :cpf');
        qryClientes.ParamByName('cpf').AsString := '%' + edtConsulta.Text + '%';
      end;

    qryClientes.Open;
    cdsClientes.Close;
    cdsClientes.Open;
  except

  end;
end;

procedure TfrmPrincipal.BtnMostrartodosClick(Sender: TObject);
begin
  mostraClientes;
  edtConsulta.Clear;
end;

procedure TfrmPrincipal.BtnImprimirClick(Sender: TObject);
begin
  mostraClienteRelatorio;

  try
    frmRelFichaCliente := TfrmRelFichaCliente.Create(self);

    case cdsClientes.FieldByName('estadocivil').AsInteger of
      0: frmRelFichaCliente.ESTADOCIVIL.Caption := 'SOLTEIRO(A)';

      1: frmRelFichaCliente.ESTADOCIVIL.Caption := 'CASADO(A)';

      2: frmRelFichaCliente.ESTADOCIVIL.Caption := 'DIVORCIADO(A)';

      3: frmRelFichaCliente.ESTADOCIVIL.Caption := 'VIUVO(A)';

      4: frmRelFichaCliente.ESTADOCIVIL.Caption := 'AMAZIADO(A)';
    end;

    case cdsClientes.FieldByName('tipopagamento').AsInteger of
      0: frmRelFichaCliente.TIPOPAGAMENTO.Caption := 'A PRAZO DINHEIRO';

      1: frmRelFichaCliente.TIPOPAGAMENTO.Caption := 'A VISTA DINHEIRO';

      2: frmRelFichaCliente.TIPOPAGAMENTO.Caption := 'A PRAZO CHEQUE';

      3: frmRelFichaCliente.TIPOPAGAMENTO.Caption := 'A VISTA CHEQUE';

      4: frmRelFichaCliente.TIPOPAGAMENTO.Caption := 'A PRAZO CARTAO';

      5: frmRelFichaCliente.TIPOPAGAMENTO.Caption := 'A VISTA CARTAO';

    end;

    case cdsClientes.FieldByName('uf').AsInteger of

      23: frmRelFichaCliente.UF.Caption := 'SC';

      20: frmRelFichaCliente.UF.Caption := 'RS';

      15: frmRelFichaCliente.UF.Caption := 'PR';

    end;

    frmRelFichaCliente.RlRptFicha.Preview();
  finally
    FreeAndNil(frmRelFichaCliente);
  end;
end;

procedure TfrmPrincipal.mostraClienteRelatorio;
begin
  try
    qryClientes.Close;
    qryClientes.SQL.Clear;
    qryClientes.SQL.Add('SELECT * FROM clientes');
    qryClientes.SQL.add('WHERE codigo = :cod');
    qryClientes.ParamByName('cod').AsInteger := iCodCliente;
    qryClientes.Open;
    cdsClientes.Close;
    cdsClientes.Open;
  except
    on e: Exception do
    raise Exception.Create('Não foi possível realizar a impressão!' + #13 + e.Message);
  end;
end;

procedure TfrmPrincipal.GrdClientesCellClick(Column: TColumn);
begin
  iCodCliente := cdsClientes.FieldByName('codigo').AsInteger;
end;

procedure TfrmPrincipal.BtnRelatorioClick(Sender: TObject);
begin
  try
    frmRelClientes := TfrmRelClientes.Create(self);
    frmRelClientes.RlRptClientes.Preview();
  finally
    FreeAndNil(frmRelClientes);
  end;
end;

procedure TfrmPrincipal.Conectar;
var
  Arquivo: TextFile;
  Caminho: string;
begin
  assignfile (arquivo, sDefault+'\Config.ini');
  reset (arquivo);
  readln (arquivo, caminho);
  CloseFile(arquivo);
  Connection.Params.Values['Database']:=caminho;
  try
    Connection.Connected:=true;
  except
    MessageDlg('Não foi possivel conectar ao banco de dados'+#13+'Consulte o suporte Técnico Tel.: (49)9926-1999',mtError,[mbOk],0);
    Application.Terminate;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
{  if Date > StrToDate(mskLicenca.Text)  then
    begin
      MessageDlg('A licença do sistema expirou, contate o suporte técnico!' +#13+
      '49 9926-1999',mtInformation,[mbOk],0);
      Application.Terminate;
    end;}

  sDefault := ExtractFileDir(Application.Exename);
  if FileExists(sDefault+'\Config.ini') then
    Conectar;
end;

initialization
  RlConsts.SetVersion(3,72,'B');

end.
