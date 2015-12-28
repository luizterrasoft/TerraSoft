unit unCadastroDevolucao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB, SqlExpr, Mask;

type
  TfrmCadastroDevolucao = class(TForm)
    PnDados: TPanel;
    PnOpcoes: TPanel;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    Label1: TLabel;
    edtIDEmprestimo: TEdit;
    qryDevolucao: TSQLQuery;
    Label2: TLabel;
    mskDataDevolvido: TMaskEdit;
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private

  public

  end;

var
  frmCadastroDevolucao: TfrmCadastroDevolucao;

implementation

uses unDM;

{$R *.dfm}

{ TfrmCadastroLivros }

procedure TfrmCadastroDevolucao.BtnGravarClick(Sender: TObject);
begin
  if (mskDataDevolvido.Text = trim('  /  /    ')) then
    begin
      MessageDlg('Campo data devolvido é de preenchimento obrigatório, por favor confira!',mtWarning,[mbOk],0);
      mskDataDevolvido.SetFocus;
      Exit;
    end;

  try
    qryDevolucao.Close;
    qryDevolucao.SQL.Clear;
    qryDevolucao.SQL.Add('UPDATE emprestimo SET data_devolvido = :dv');
    qryDevolucao.SQL.Add('WHERE id_emprestimo = :id');

    qryDevolucao.ParamByName('id').AsInteger := StrToInt(edtIDEmprestimo.Text);
    qryDevolucao.ParamByName('dv').AsDate    := StrToDate(mskDataDevolvido.Text);

    qryDevolucao.Prepared := True;
    qryDevolucao.ExecSQL();
    Close;
  except
    MessageDlg('Erro ao devolver o livro!',mtError,[mbOk],0);
  end;
end;

procedure TfrmCadastroDevolucao.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroDevolucao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
