unit unConsultaEmprestimos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, FMTBcd, Provider,
  DBClient, DB, SqlExpr, Mask;

type
  TfrmConsultaEmprestimos = class(TForm)
    PnConsulta: TPanel;
    PnOpcoes: TPanel;
    PnDados: TPanel;
    Label1: TLabel;
    RdBtnID: TRadioButton;
    RdBtnLeitor: TRadioButton;
    Bevel1: TBevel;
    Label2: TLabel;
    edtConsulta: TEdit;
    BtnConsultar: TBitBtn;
    GrdEmprestimos: TDBGrid;
    BtnEmprestar: TBitBtn;
    BtnDevolver: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnSair: TBitBtn;
    qryEmprestimo: TSQLQuery;
    dsEmprestimo: TDataSource;
    cdsEmprestimo: TClientDataSet;
    dspEmprestimo: TDataSetProvider;
    RdBtnLivro: TRadioButton;
    Label3: TLabel;
    Label4: TLabel;
    mskInicial: TMaskEdit;
    Label5: TLabel;
    mskFinal: TMaskEdit;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnEmprestarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnDevolverClick(Sender: TObject);
  private
    procedure mostraEmprestimos;

  public
    { Public declarations }
  end;

var
  frmConsultaEmprestimos: TfrmConsultaEmprestimos;

implementation

uses unDM, unCadastroLivros, unCadastroEmprestimos, unCadastroDevolucao;

{$R *.dfm}

procedure TfrmConsultaEmprestimos.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaEmprestimos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Close;
end;

procedure TfrmConsultaEmprestimos.BtnConsultarClick(Sender: TObject);
begin
  mostraEmprestimos;
end;

procedure TfrmConsultaEmprestimos.FormShow(Sender: TObject);
begin
  mostraEmprestimos;
end;

procedure TfrmConsultaEmprestimos.BtnEmprestarClick(Sender: TObject);
begin
  try
    edtConsulta.Clear;
    frmCadastroEmprestimos := TfrmCadastroEmprestimos.Create(self);
    frmCadastroEmprestimos.iOperacao := 1; // Inclusão
    frmCadastroEmprestimos.ShowModal;
  finally
    FreeAndNil(frmCadastroEmprestimos);
    mostraEmprestimos;
  end;
end;

procedure TfrmConsultaEmprestimos.BtnExcluirClick(Sender: TObject);
begin
  if (MessageDlg('Deseja realmente excluir o empréstimo '+ cdsEmprestimo.FieldByName('id_emprestimo').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
    begin
      try
        qryEmprestimo.Close;
        qryEmprestimo.SQL.Clear;
        qryEmprestimo.SQL.Add('DELETE FROM emprestimo');
        qryEmprestimo.SQL.Add('WHERE id_emprestimo = :id');
        qryEmprestimo.ParamByName('id').AsInteger := cdsEmprestimo.FieldByName('id_emprestimo').AsInteger;
        qryEmprestimo.ExecSQL();
      except
        MessageDlg('Não é possível excluir o empréstimo!',mtError,[mbOk],0);
      end;
    end;

  mostraEmprestimos;
end;

procedure TfrmConsultaEmprestimos.mostraEmprestimos;
begin
  qryEmprestimo.Close;
  qryEmprestimo.SQL.Clear;
  qryEmprestimo.SQL.Add('SELECT emp.id_emprestimo, lei.nome, liv.titulo, ate.login As Atendente,');
  qryEmprestimo.SQL.Add('emp.data_emprestimo, emp.data_devolucao');
  qryEmprestimo.SQL.Add('FROM emprestimo emp');
  qryEmprestimo.SQL.Add('INNER JOIN leitor lei');
  qryEmprestimo.SQL.Add('ON lei.id_leitor = emp.id_leitor');
  qryEmprestimo.SQL.Add('INNER JOIN livro liv');
  qryEmprestimo.SQL.Add('ON liv.id_livro = emp.id_livro');
  qryEmprestimo.SQL.Add('INNER JOIN atendente ate');
  qryEmprestimo.SQL.Add('ON ate.id_atendente = emp.id_atendente');

  if (RdBtnID.Checked = true) and (edtConsulta.Text <> trim('')) then
      qryEmprestimo.SQL.Add('WHERE emp.id_emprestimo = :id');

  if (RdBtnLeitor.Checked = true) and (edtConsulta.Text <> trim('')) then
      qryEmprestimo.SQL.Add('WHERE lei.nome LIKE :leitor');

  if (RdBtnLivro.Checked = true) and (edtConsulta.Text <> trim('')) then
      qryEmprestimo.SQL.Add('WHERE liv.titulo LIKE :titu');

  if (mskInicial.Text <> '  /  /    ') and (mskFinal.Text <> '  /  /    ') then
    qryEmprestimo.SQL.Add('AND emp.data_emprestimo BETWEEN :dtini AND :dtfin');

  if (RdBtnID.Checked = true) and (edtConsulta.Text <> trim('')) then
      qryEmprestimo.ParamByName('id').AsInteger := StrToInt(edtConsulta.Text);

  if (RdBtnLeitor.Checked = true) and (edtConsulta.Text <> trim('')) then
      qryEmprestimo.ParamByName('leitor').AsString := '%' + edtConsulta.Text + '%';

  if (RdBtnLivro.Checked = true) and (edtConsulta.Text <> trim('')) then
      qryEmprestimo.ParamByName('titu').AsString := '%' + edtConsulta.Text + '%';  

  if (mskInicial.Text <> '  /  /    ') and (mskFinal.Text <> '  /  /    ') then
    begin
      qryEmprestimo.ParamByName('dtini').AsDate := StrToDate(mskInicial.Text);
      qryEmprestimo.ParamByName('dtfin').AsDate := StrToDate(mskFinal.Text);
    end;

  qryEmprestimo.Open;
  cdsEmprestimo.Close;
  cdsEmprestimo.Open;
end;

procedure TfrmConsultaEmprestimos.BtnDevolverClick(Sender: TObject);
begin
  try
    frmCadastroDevolucao := TfrmCadastroDevolucao.Create(self);
    frmCadastroDevolucao.edtIDEmprestimo.Text := cdsEmprestimo.FieldByName('id_emprestimo').AsString;
    frmCadastroDevolucao.ShowModal;
  finally
    FreeAndNil(frmCadastroDevolucao);
    mostraEmprestimos;
  end;
end;

end.
