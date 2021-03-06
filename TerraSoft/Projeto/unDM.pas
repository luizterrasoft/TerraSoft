unit unDM;

interface

uses
  SysUtils, Classes, DB, SqlExpr, FMTBcd, Provider, DBClient, Dialogs,
  Forms, DBXpress;

type
  TDM = class(TDataModule)
    Con: TSQLConnection;
    dsGeral: TDataSource;
    cdsGeral: TClientDataSet;
    dspGeral: TDataSetProvider;
    qryGeral: TSQLQuery;
    ConLicenca: TSQLConnection;
    qryLicenca: TSQLQuery;
    dsLicenca: TDataSource;
    cdsLicenca: TClientDataSet;
    dspLicenca: TDataSetProvider;
    qryLicencacodigo: TIntegerField;
    qryLicencanome: TStringField;
    qryLicencacnpj: TStringField;
    qryLicencaqtdmaquinas: TIntegerField;
    qryLicencavencimento: TDateField;
    procedure DataModuleCreate(Sender: TObject);
  private

    Default: string;
    procedure Conectar;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses unOS, unQuitarContaReceber, unManutencoes, unLogin, unPrincipal;

{$R *.dfm}

procedure TDM.Conectar;
var
  Arquivo: TextFile;
  Caminho: string;
begin
  assignfile (arquivo, default+'\Config.ini');
  reset (arquivo);
  readln (arquivo, caminho);
  CloseFile(arquivo);
  Con.Params.Values['Database']:=caminho;
  try
    Con.Connected:=true;
  except
    on e: Exception do
      begin
        raise Exception.Create('N�o foi possivel conectar ao banco de dados'+#13+'Consulte o suporte T�cnico Tel.: (49)9926-1999!' + #13 + e.Message);
        Application.Terminate;
      end;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  Default := ExtractFileDir(Application.Exename);
  if FileExists(default+'\Config.ini') then
    Conectar;


  try
    qryGeral.Close;
    qryGeral.SQL.Clear;
    qryGeral.SQL.Add('SELECT * FROM configuracoes');
    qryGeral.Open;
    cdsGeral.Close;
    cdsGeral.Open;

    if cdsGeral.FieldByName('exigelogin').AsInteger < 1 then
      begin
        try
          frmLogin := TfrmLogin.Create(self);
          frmLogin.ShowModal;
        finally
          FreeAndNil(frmLogin);
        end;
      end
    else
      begin
        try
          frmPrincipal := TfrmPrincipal.Create(self);
          frmPrincipal.ShowModal;
        finally
          FreeAndNil(frmPrincipal);
        end;
      end;
  except
    MessageDlg('Erro ao identificar se o sistema exige login!',mtError,[mbOk],0);
  end;
end;

end.
