unit unLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, FMTBcd, SqlExpr, Provider,
  DB, DBClient;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtUsuario: TEdit;
    Label4: TLabel;
    edtSenha: TEdit;
    Bevel1: TBevel;
    BtnEntrar: TBitBtn;
    BtnCancelar: TBitBtn;
    dsLogin: TDataSource;
    cdsLogin: TClientDataSet;
    dspLogin: TDataSetProvider;
    qryLogin: TSQLQuery;
    qryTentativas: TSQLQuery;
    dspTentativas: TDataSetProvider;
    cdsTentativas: TClientDataSet;
    dsTentativas: TDataSource;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnEntrarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    bTrocandoUsuario: boolean;
  end;

var
  frmLogin: TfrmLogin;

implementation

uses unDM, unPrincipal;

{$R *.dfm}

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BtnCancelarClick(self);

  if Key = VK_RETURN then
    BtnEntrarClick(self);
    
end;

procedure TfrmLogin.BtnEntrarClick(Sender: TObject);
begin
  try
    qryLogin.Close;
    
    qryLogin.SQL.Clear;
    qryLogin.SQL.Add('SELECT * FROM usuarios');
    qryLogin.SQL.Add('WHERE usuario = :usu AND senha = :sen');
    qryLogin.ParamByName('usu').AsString := edtUsuario.Text;
    qryLogin.ParamByName('sen').AsString := edtSenha.Text;
    qryLogin.Open;
    cdsLogin.Close;
    cdsLogin.Open;

    if cdsLogin.RecordCount > 0 then
      begin
        try
          frmPrincipal := TfrmPrincipal.Create(self);
          frmPrincipal.iCodUsuario := cdsLogin.FieldByName('codigo').AsInteger;
          frmPrincipal.iModoSuporte:= cdsLogin.FieldByName('suporte').AsInteger;
          frmPrincipal.StBarPrincipal.Panels[2].Text := IntToStr(frmPrincipal.iCodUsuario) + ' - ' + cdsLogin.FieldByName('nome').AsString;
          frmLogin.Close;
          frmPrincipal.ShowModal;
        finally
          FreeAndNil(frmPrincipal);
        end;
      end
    else
      begin
        MessageDlg('Dados de Usuário ou senha incorretos, por favor tente novamente!',mtWarning,[mbOk],0);

        try
          qryTentativas.Close;
          qryTentativas.SQL.Clear;
          qryTentativas.SQL.Add('INSERT INTO tentativaslogin');
          qryTentativas.SQL.Add('(usuario,senha,data,hora)');
          qryTentativas.SQL.Add('VALUES (:usu,:sen,:dat,:ho)');
          qryTentativas.ParamByName('usu').AsString := edtUsuario.Text;
          qryTentativas.ParamByName('sen').AsString := edtSenha.Text;
          qryTentativas.ParamByName('dat').AsDate   := Date;
          qryTentativas.ParamByName('ho').AsTime    := Time;
          qryTentativas.ExecSQL();
        except
          MessageDlg('Erro ao gravar tentativa no banco de dados!',mtError,[mbOk],0);
        end;

        edtUsuario.SetFocus;
      end;
  except
    MessageDlg('Erro ao tentar efetuar login!',mtError,[mbOk],0);
    Application.Terminate;
  end;
end;

procedure TfrmLogin.BtnCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

end.
