unit unCadastroAtendentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB, SqlExpr;

type
  TfrmCadastroAtendentes = class(TForm)
    PnDados: TPanel;
    PnOpcoes: TPanel;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    Label1: TLabel;
    edtIDAtendente: TEdit;
    Label2: TLabel;
    edtLogin: TEdit;
    Label3: TLabel;
    edtSenha: TEdit;
    qryCadAtendente: TSQLQuery;
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure limparCampos;

  public
    iOperacao: integer; // 1 = Inclusao ||| 2 = Alteração
  end;

var
  frmCadastroAtendentes: TfrmCadastroAtendentes;

implementation

uses unDM;

{$R *.dfm}

{ TfrmCadastroLivros }

procedure TfrmCadastroAtendentes.limparCampos;
begin
  edtIDAtendente.Clear;
  edtLogin.Clear;
  edtSenha.Clear;

end;

procedure TfrmCadastroAtendentes.FormShow(Sender: TObject);
begin
  if iOperacao = 1 then
    limparCampos;
end;

procedure TfrmCadastroAtendentes.BtnGravarClick(Sender: TObject);
begin
  case iOperacao of

    1:  // Inclusão
      begin

        if (edtLogin.Text = trim('')) then // Verifica se o campo login está vazio
          begin
            MessageDlg('Campo login é de preenchimento obrigatório, por favor confira!',mtWarning,[mbOk],0);
            edtLogin.SetFocus; // Foco vai para o campo login
            Exit; // Para por aqui
          end;

        if (edtSenha.Text = trim('')) then // Verifica se o campo senha está vazio
          begin
            MessageDlg('Campo senha é de preenchimento obrigatório, por favor confira!',mtWarning,[mbOk],0);
            edtSenha.SetFocus;
            Exit;
          end;

        try
          qryCadAtendente.Close;
          qryCadAtendente.SQL.Clear;
          qryCadAtendente.SQL.Add('INSERT INTO atendente');
          qryCadAtendente.SQL.Add('(login,senha)');
          qryCadAtendente.SQL.Add('VALUES (:log,:sen)');

          qryCadAtendente.ParamByName('log').AsString := edtLogin.Text;
          qryCadAtendente.ParamByName('sen').AsString := edtSenha.Text;

          qryCadAtendente.Prepared := True;
          qryCadAtendente.ExecSQL();
          Close;
        except
          MessageDlg('Erro ao incluir o novo atendente!',mtError,[mbOk],0);
        end;
      end;

    2: // Alteração
      begin
        try
          if (edtLogin.Text = trim('')) then // Verifica se o campo login está vazio
            begin
              MessageDlg('Campo login é de preenchimento obrigatório, por favor confira!',mtWarning,[mbOk],0);
              edtLogin.SetFocus; // Foco vai para o campo login
              Exit; // Para por aqui
            end;

          if (edtSenha.Text = trim('')) then // Verifica se o campo senha está vazio
            begin
              MessageDlg('Campo senha é de preenchimento obrigatório, por favor confira!',mtWarning,[mbOk],0);
              edtSenha.SetFocus;
              Exit;
            end;

          qryCadAtendente.Close;
          qryCadAtendente.SQL.Clear;
          qryCadAtendente.SQL.Add('UPDATE atendente SET login = :log, senha = :sen');
          qryCadAtendente.SQL.Add('WHERE id_atendente = :id');

          qryCadAtendente.ParamByName('id').AsInteger := StrToInt(edtIDAtendente.Text);
          qryCadAtendente.ParamByName('log').AsString := edtLogin.Text;
          qryCadAtendente.ParamByName('sen').AsString := edtSenha.Text;

          qryCadAtendente.Prepared := True;
          qryCadAtendente.ExecSQL();
          Close;
        except
          MessageDlg('Não foi possível alterar os dados do atendente!',mtWarning,[mbOk],0);
        end;
      end;
  end;
end;

procedure TfrmCadastroAtendentes.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroAtendentes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
