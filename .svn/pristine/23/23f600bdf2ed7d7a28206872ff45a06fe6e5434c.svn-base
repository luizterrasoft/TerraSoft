unit unBackupRestore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBServices, ComCtrls, StdCtrls, Buttons;

type
  TfrmBackupRestore = class(TForm)
    Backup: TIBBackupService;
    Restore: TIBRestoreService;
    Label1: TLabel;
    PageControl1: TPageControl;
    tsBackup: TTabSheet;
    tsRestaurar: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    deBackup: TEdit;
    edtDestinoBackup: TEdit;
    mmBackup: TMemo;
    BtnBuscaCaminhoBD: TBitBtn;
    BtnBuscaDestinoBackup: TBitBtn;
    BtnBackup: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtCaminhoBackup: TEdit;
    edtCaminhoBD: TEdit;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BtnRestaurar: TBitBtn;
    procedure BtnBackupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackupRestore: TfrmBackupRestore;

implementation

uses unDM;

{$R *.dfm}

procedure TfrmBackupRestore.BtnBackupClick(Sender: TObject);
begin
{if deBackup.Text = trim('') then
  begin
    MessageDlg('Indique onde esta seu Banco',mtWarning,[mbOk],0);
    febanco.SetFocus;
    Abort;
  end;
  if edtDestinoBackup.Text = trim('') then
  begin
    MessageDlg('Indique onde irá Gravar o Backup',mtWarning,[mbOk],0);
    deBackup.SetFocus;
    Abort;
  end;
  with Backup do
  begin
    Params.Clear;
    BackupFile.Clear;
    ServerName := 'localhost';
    LoginPrompt := False;
    Params.Add('user_name=SYSDBA');
    Params.Add('password=masterkey');
    Active := True;
    try
      Verbose := True;
      Options := [NonTransportable, IgnoreLimbo];
      DatabaseName := DM.Con..FileName;
      //BackupFile.Add(deBackup.Text+'/'+'Backup.gbk');
      BackupFile.Add('D:\TerraSoft\Dados\DADOS.FDB');
      ServiceStart;
      While not Eof do
        mmBackup.Lines.Add(GetNextLine);
    finally
      Active := False;
    end;
  end;
  ShowMessage('Backup Efetuado com Sucesso');  }
end;

end.
