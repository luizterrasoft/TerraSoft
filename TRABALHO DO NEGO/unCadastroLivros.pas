unit unCadastroLivros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB, SqlExpr;

type
  TfrmCadastroLivros = class(TForm)
    PnDados: TPanel;
    PnOpcoes: TPanel;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    Label1: TLabel;
    edtIDLivro: TEdit;
    Label2: TLabel;
    edtTitulo: TEdit;
    Label3: TLabel;
    edtExemplar: TEdit;
    Label4: TLabel;
    edtAutor: TEdit;
    Label5: TLabel;
    edtEditora: TEdit;
    Label6: TLabel;
    edtAreaConhecimento: TEdit;
    Label7: TLabel;
    edtLocalizacao: TEdit;
    Label8: TLabel;
    edtAno: TEdit;
    qryCadLivro: TSQLQuery;
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
  frmCadastroLivros: TfrmCadastroLivros;

implementation

uses unDM;

{$R *.dfm}

{ TfrmCadastroLivros }

procedure TfrmCadastroLivros.limparCampos;
begin
  edtIDLivro.Clear;
  edtTitulo.Clear;
  edtExemplar.Clear;
  edtAutor.Clear;
  edtEditora.Clear;
  edtAno.Clear;
  edtAreaConhecimento.Clear;
  edtLocalizacao.Clear;
end;

procedure TfrmCadastroLivros.FormShow(Sender: TObject);
begin
  if iOperacao = 1 then
    limparCampos;
end;

procedure TfrmCadastroLivros.BtnGravarClick(Sender: TObject);
begin
  case iOperacao of

    1:  // Inclusão
      begin

        if (edtTitulo.Text = trim('')) then // Verifica se o campo título está vazio
          begin
            MessageDlg('Campo título é de preenchimento obrigatório, por favor confira!',mtWarning,[mbOk],0);
            edtTitulo.SetFocus; // Foco vai para o campo título
            Exit; // Para por aqui
          end;

        if (edtTitulo.Text = trim('')) or (edtTitulo.Text = trim('0')) then // Verifica se o campo ano está vazio
          begin
            MessageDlg('Campo título é de preenchimento obrigatório, por favor confira!',mtWarning,[mbOk],0);
            edtAno.SetFocus;
            Exit;
          end;

        try
          qryCadLivro.Close;
          qryCadLivro.SQL.Clear;
          qryCadLivro.SQL.Add('INSERT INTO livro');
          qryCadLivro.SQL.Add('(titulo,exemplar,autor,editora,ano,area_conhecimento,localizacao)');
          qryCadLivro.SQL.Add('VALUES (:tit,:exe,:aut,:edi,:ano,:are,:loc)');

          qryCadLivro.ParamByName('tit').AsString := edtTitulo.Text;
          qryCadLivro.ParamByName('exe').AsString := edtExemplar.Text;
          qryCadLivro.ParamByName('aut').AsString := edtAutor.Text;
          qryCadLivro.ParamByName('edi').AsString := edtEditora.Text;
          qryCadLivro.ParamByName('ano').AsInteger:= StrToInt(edtAno.Text);
          qryCadLivro.ParamByName('are').AsString := edtAreaConhecimento.Text;
          qryCadLivro.ParamByName('loc').AsString := edtLocalizacao.Text;

          qryCadLivro.Prepared := True;
          qryCadLivro.ExecSQL();
          Close;
        except
          MessageDlg('Erro ao incluir o novo livro!',mtError,[mbOk],0);
        end;
      end;

    2: // Alteração
      begin
        try
          if (edtTitulo.Text = trim('')) then // Verifica se o campo título está vazio
            begin
              MessageDlg('Campo título é de preenchimento obrigatório, por favor confira!',mtWarning,[mbOk],0);
              edtTitulo.SetFocus; // Foco vai para o campo título
              Exit; // Para por aqui
            end;

          if (edtTitulo.Text = trim('')) or (edtTitulo.Text = trim('0')) then // Verifica se o campo ano está vazio
            begin
              MessageDlg('Campo título é de preenchimento obrigatório, por favor confira!',mtWarning,[mbOk],0);
              edtAno.SetFocus;
              Exit;
            end;

          qryCadLivro.Close;
          qryCadLivro.SQL.Clear;
          qryCadLivro.SQL.Add('UPDATE livro SET titulo = :tit, exemplar = :exe, autor = :aut, editora = :edi,');
          qryCadLivro.SQL.Add('ano = :ano, area_conhecimento = :are, localizacao = :loc');
          qryCadLivro.SQL.Add('WHERE id_livro = :id');

          qryCadLivro.ParamByName('id').AsInteger := StrToInt(edtIDLivro.Text);
          qryCadLivro.ParamByName('tit').AsString := edtTitulo.Text;
          qryCadLivro.ParamByName('exe').AsString := edtExemplar.Text;
          qryCadLivro.ParamByName('aut').AsString := edtAutor.Text;
          qryCadLivro.ParamByName('edi').AsString := edtEditora.Text;
          qryCadLivro.ParamByName('ano').AsInteger:= StrToInt(edtAno.Text);
          qryCadLivro.ParamByName('are').AsString := edtAreaConhecimento.Text;
          qryCadLivro.ParamByName('loc').AsString := edtLocalizacao.Text;

          qryCadLivro.Prepared := True;
          qryCadLivro.ExecSQL();
          Close;
        except
          MessageDlg('Não foi possível alterar os dados do livro!',mtWarning,[mbOk],0);
        end;
      end;
  end;
end;

procedure TfrmCadastroLivros.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroLivros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Close;
end;

end.
