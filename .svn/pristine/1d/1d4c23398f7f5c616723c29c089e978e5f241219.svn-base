unit unLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, FMTBcd, Provider, DBClient, DB,
  SqlExpr;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    BtnEntrar: TBitBtn;
    BtnCancelar: TBitBtn;
    qryLogin: TSQLQuery;
    dsLogin: TDataSource;
    cdsLogin: TClientDataSet;
    dspLogin: TDataSetProvider;
    procedure BtnEntrarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses unDM, unPrincipal;

{$R *.dfm}

procedure TfrmLogin.BtnEntrarClick(Sender: TObject);
begin
  if edtLogin.Text = trim('') then
    begin
      MessageDlg('Por favor digite o login!',mtWarning,[mbOk],0);
      edtLogin.SetFocus;
      Exit;
    end;

  if edtSenha.Text = trim('') then
    begin
      MessageDlg('Por favor digite a senha!',mtWarning,[mbOk],0);
      edtSenha.SetFocus;
      Exit;
    end;

  qryLogin.Close;
  qryLogin.SQL.Clear;
  qryLogin.SQL.Add('SELECT login,senha FROM atendente');
  qryLogin.SQL.Add('WHERE login = :log AND senha = :sen');
  qryLogin.ParamByName('log').AsString := edtLogin.Text;
  qryLogin.ParamByName('sen').AsString := edtSenha.Text;
  qryLogin.Open;
  cdsLogin.Close;
  cdsLogin.Open;

  if cdsLogin.RecordCount > 0 then
    begin
      try
        frmPrincipal := TfrmPrincipal.Create(self);
        frmPrincipal.ShowModal;
      finally
        FreeAndNil(frmPrincipal);
        Application.Terminate;
      end;
    end
  else
    begin
      MessageDlg('Login ou senha incorreto! Por favor tente novamente.',mtWarning,[mbOk],0);
      edtLogin.SetFocus;
    end;
end;

procedure TfrmLogin.BtnCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
