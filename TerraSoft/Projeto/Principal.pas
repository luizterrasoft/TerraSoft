unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, XPMan;

type
  TfrmBackup = class(TForm)
    BExecBack: TButton;
    Button3: TButton;
    EBase: TEdit;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    SBLoca: TSpeedButton;
    Panel1: TPanel;
    EServ: TEdit;
    Label2: TLabel;
    XPManifest1: TXPManifest;
    BRestaurarBackup: TButton;
    StaticText1: TStaticText;
    procedure Button3Click(Sender: TObject);
    procedure SBLocaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BExecBackClick(Sender: TObject);
    procedure BRestaurarBackupClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    sCampo: string;
  end;

var
  frmBackup: TfrmBackup;

implementation

uses GerarBackup, IBDatabase, RestaurarBackup, unDM, unPrincipal;

{$R *.dfm}

procedure TfrmBackup.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmBackup.SBLocaClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    EBase.Text:=OpenDialog1.FileName;
end;

procedure TfrmBackup.FormCreate(Sender: TObject);
begin
  EBase.Text := DM.Con.Params.Values['Database'];
end;

procedure TfrmBackup.BExecBackClick(Sender: TObject);
begin
  try
    FGerarBackup := TFGerarBackup.Create(self);
    FGerarBackup.ShowModal;
  finally
    FreeAndNil(FGerarBackup);
  end;
end;

procedure TfrmBackup.BRestaurarBackupClick(Sender: TObject);
begin
  try
    FRestaurarBackup := TFRestaurarBackup.Create(self);
    FRestaurarBackup.ShowModal;
  finally
    FreeAndNil(FRestaurarBackup);
  end;

end;

procedure TfrmBackup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
    Self.Close;
end;

procedure TfrmBackup.FormShow(Sender: TObject);
begin
  if frmPrincipal.iModoSuporte = 1 then
    begin
      BRestaurarBackup.Visible := True;
      EServ.Enabled := True;
    end;

end;

end.
