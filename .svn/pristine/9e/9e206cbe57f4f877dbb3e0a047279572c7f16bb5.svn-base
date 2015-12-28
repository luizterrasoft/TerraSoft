unit unConsultaLeitores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, FMTBcd, Provider,
  DBClient, DB, SqlExpr;

type
  TfrmConsultaLeitores = class(TForm)
    PnConsulta: TPanel;
    PnOpcoes: TPanel;
    PnDados: TPanel;
    Label1: TLabel;
    RdBtnID: TRadioButton;
    RdBtnNome: TRadioButton;
    Bevel1: TBevel;
    Label2: TLabel;
    edtConsulta: TEdit;
    BtnConsultar: TBitBtn;
    GrdLivros: TDBGrid;
    BtnIncluir: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnSair: TBitBtn;
    qryLeitores: TSQLQuery;
    dsLeitores: TDataSource;
    cdsLeitores: TClientDataSet;
    dspLeitores: TDataSetProvider;
    BtnSelecionar: TBitBtn;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnSelecionarClick(Sender: TObject);
  private
    procedure mostraLeitores;
    procedure AlimentaCampos;

  public
    { Public declarations }
  end;

var
  frmConsultaLeitores: TfrmConsultaLeitores;

implementation

uses unDM, unCadastroLivros, unCadastroLeitores, unCadastroEmprestimos;

{$R *.dfm}

procedure TfrmConsultaLeitores.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaLeitores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Close;
end;

procedure TfrmConsultaLeitores.mostraLeitores;
begin
  try
    qryLeitores.Close;
    qryLeitores.SQL.Clear;
    qryLeitores.SQL.Add('SELECT * FROM leitor');

    if (RdBtnID.Checked = true) and (edtConsulta.Text <> trim('')) then
      qryLeitores.SQL.Add('WHERE id_leitor = :id');

    if (RdBtnNome.Checked = true) and (edtConsulta.Text <> trim('')) then
      qryLeitores.SQL.Add('WHERE nome LIKE :nome');

    if (RdBtnID.Checked = true) and (edtConsulta.Text <> trim('')) then
      qryLeitores.ParamByName('id').AsInteger := StrToInt(edtConsulta.Text);

    if (RdBtnNome.Checked = true) and (edtConsulta.Text <> trim('')) then
      qryLeitores.ParamByName('nome').AsString := '%' + edtConsulta.Text + '%';

    qryLeitores.Open;
    cdsLeitores.Close;
    cdsLeitores.Open;
  except
    MessageDlg('Erro ao mostrar os leitores!',mtError,[mbOk],0);
  end;
end;

procedure TfrmConsultaLeitores.BtnConsultarClick(Sender: TObject);
begin
  mostraLeitores;
end;

procedure TfrmConsultaLeitores.FormShow(Sender: TObject);
begin
  mostraLeitores;
end;

procedure TfrmConsultaLeitores.BtnIncluirClick(Sender: TObject);
begin
  try
    edtConsulta.Clear;
    frmCadastroLeitores := TfrmCadastroLeitores.Create(self);
    frmCadastroLeitores.iOperacao := 1; // Inclusão
    frmCadastroLeitores.ShowModal;
  finally
    FreeAndNil(frmCadastroLeitores);
    mostraLeitores;
  end;
end;

procedure TfrmConsultaLeitores.BtnAlterarClick(Sender: TObject);
begin
  try
    edtConsulta.Clear;
    frmCadastroLeitores := TfrmCadastroLeitores.Create(self);
    AlimentaCampos;
    frmCadastroLeitores.iOperacao := 2; // Alteração
    frmCadastroLeitores.ShowModal;
  finally
    FreeAndNil(frmCadastroLeitores);
    mostraLeitores;
  end;
end;

procedure TfrmConsultaLeitores.AlimentaCampos;
begin
  frmCadastroLeitores.edtIDLeitor.Text  := cdsLeitores.FieldByName('id_leitor').AsString;
  frmCadastroLeitores.edtNome.Text      := cdsLeitores.FieldByName('nome').AsString;
  frmCadastroLeitores.edtRG.Text        := cdsLeitores.FieldByName('rg').AsString;
  frmCadastroLeitores.mskCPF.Text       := cdsLeitores.FieldByName('cpf').AsString;
  frmCadastroLeitores.mskFone.Text      := cdsLeitores.FieldByName('telefone').AsString;
  frmCadastroLeitores.edtEndereco.Text  := cdsLeitores.FieldBYName('endereco').AsString;
  frmCadastroLeitores.edtNumero.Text    := cdsLeitores.FieldByName('numero').AsString;
  frmCadastroLeitores.edtBairro.Text    := cdsLeitores.FieldByName('bairro').AsString;
  frmCadastroLeitores.mskCEP.Text       := cdsLeitores.FieldByName('cep').AsString;
  frmCadastroLeitores.edtEmail.Text     := cdsLeitores.FieldByName('email').AsString;
  frmCadastroLeitores.edtCidade.Text    := cdsLeitores.FieldByName('cidade').AsString;
  frmCadastroLeitores.CbxEstado.Text    := cdsLeitores.FieldByName('estado').AsString;
  frmCadastroLeitores.edtPais.Text      := cdsLeitores.FieldByName('pais').AsString;
end;

procedure TfrmConsultaLeitores.BtnExcluirClick(Sender: TObject);
begin
  if (MessageDlg('Deseja realmente excluir o leitor '+ cdsLeitores.FieldByName('nome').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
    begin
      try
        qryLeitores.Close;
        qryLeitores.SQL.Clear;
        qryLeitores.SQL.Add('DELETE FROM leitor');
        qryLeitores.SQL.Add('WHERE id_leitor = :id');
        qryLeitores.ParamByName('id').AsInteger := cdsLeitores.FieldByName('id_leitor').AsInteger;
        qryLeitores.ExecSQL();
      except
        MessageDlg('Não é possível excluir o leitor. O mesmo já deve ter vinculo em algum empréstimo!',mtError,[mbOk],0);
      end;
    end;

  mostraLeitores;
end;

procedure TfrmConsultaLeitores.BtnSelecionarClick(Sender: TObject);
begin
  if cdsLeitores.RecordCount > 0 then
    begin
      frmCadastroEmprestimos.edtCodLeitor.Text := cdsLeitores.FieldByName('id_leitor').AsString;
      frmCadastroEmprestimos.lblLeitor.Caption := cdsLeitores.FieldByName('nome').AsString;
      frmCadastroEmprestimos.edtCodLivro.SetFocus;
      Self.Close;
    end;
end;

end.
