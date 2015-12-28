unit unCadastroEmprestimos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB, SqlExpr, Mask, DateUtils,
  Provider, DBClient;

type
  TfrmCadastroEmprestimos = class(TForm)
    PnDados: TPanel;
    PnOpcoes: TPanel;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    Label1: TLabel;
    edtIDEmprestimo: TEdit;
    qryCadEmprestimo: TSQLQuery;
    Label2: TLabel;
    edtCodAtendente: TEdit;
    BtnBuscaAtendente: TBitBtn;
    lblAtendente: TLabel;
    Label3: TLabel;
    edtCodLeitor: TEdit;
    btnBuscaLeitor: TBitBtn;
    Label4: TLabel;
    edtCodLivro: TEdit;
    BtnBuscaLivro: TBitBtn;
    lblLeitor: TLabel;
    lblLivro: TLabel;
    Label5: TLabel;
    mskEmprestimo: TMaskEdit;
    Label6: TLabel;
    mskDevolver: TMaskEdit;
    dsCadEmprestimo: TDataSource;
    cdsCadEmprestimo: TClientDataSet;
    dspCadEmprestimo: TDataSetProvider;
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mskEmprestimoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodAtendenteEnter(Sender: TObject);
    procedure edtCodAtendenteExit(Sender: TObject);
    procedure edtCodLeitorEnter(Sender: TObject);
    procedure edtCodLeitorExit(Sender: TObject);
    procedure edtCodLivroEnter(Sender: TObject);
    procedure edtCodLivroExit(Sender: TObject);
    procedure BtnBuscaAtendenteClick(Sender: TObject);
    procedure btnBuscaLeitorClick(Sender: TObject);
    procedure BtnBuscaLivroClick(Sender: TObject);
  private
    procedure limparCampos;

  public
    iOperacao: integer; // 1 = Inclusao ||| 2 = Alteração
  end;

var
  frmCadastroEmprestimos: TfrmCadastroEmprestimos;

implementation

uses unDM, unConsultaAtendentes, unConsultaLeitores, unConsultaLivros,
  unComprovanteEmprestimo;

{$R *.dfm}

{ TfrmCadastroLivros }

procedure TfrmCadastroEmprestimos.limparCampos;
begin
  edtIDEmprestimo.Clear;
  edtCodAtendente.Clear;
  lblAtendente.Caption := '';
  edtCodLeitor.Clear;
  lblLeitor.Caption := '';
  edtCodLivro.Clear;
  lblLivro.Caption := '';
  mskEmprestimo.Clear;
  mskDevolver.Clear;
end;

procedure TfrmCadastroEmprestimos.BtnGravarClick(Sender: TObject);
begin
  if (edtCodAtendente.Text = trim('')) then
    begin
      MessageDlg('Campo atendente é de preenchimento obrigatório, por favor confira!',mtWarning,[mbOk],0);
      edtCodAtendente.SetFocus;
      Exit;
    end;

  if (edtCodLeitor.Text = trim('')) then
    begin
      MessageDlg('Campo leitor é de preenchimento obrigatório, por favor confira!',mtWarning,[mbOk],0);
      edtCodLeitor.SetFocus;
      Exit;
    end;

  if (edtCodLivro.Text = trim('')) then
    begin
      MessageDlg('Campo livro é de preenchimento obrigatório, por favor confira!',mtWarning,[mbOk],0);
      edtCodLivro.SetFocus;
      Exit;
    end;

  try
    qryCadEmprestimo.Close;
    qryCadEmprestimo.SQL.Clear;
    qryCadEmprestimo.SQL.Add('INSERT INTO emprestimo');
    qryCadEmprestimo.SQL.Add('(id_leitor,id_livro,id_atendente,data_emprestimo,data_devolucao)');
    qryCadEmprestimo.SQL.Add('VALUES (:lei,:liv,:ate,:emp,:dev)');

    qryCadEmprestimo.ParamByName('lei').AsInteger:= StrToInt(edtCodLeitor.Text);
    qryCadEmprestimo.ParamByName('liv').AsInteger:= StrToInt(edtCodLivro.Text);
    qryCadEmprestimo.ParamByName('ate').AsInteger:= StrToInt(edtCodAtendente.Text);
    qryCadEmprestimo.ParamByName('emp').AsDate   := StrToDate(mskEmprestimo.Text);
    qryCadEmprestimo.ParamByName('dev').AsDate   := StrToDate(mskDevolver.Text);

    qryCadEmprestimo.Prepared := True;
    qryCadEmprestimo.ExecSQL();

    if (MessageDlg('Deseja imprimir o comprovante de empréstimo?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
      begin
        try
          frmComprovanteEmprestimo := TfrmComprovanteEmprestimo.Create(self);
          frmComprovanteEmprestimo.lblLeitor.Caption    := lblLeitor.Caption;
          frmComprovanteEmprestimo.lblAtendente.Caption := lblAtendente.Caption;
          frmComprovanteEmprestimo.lblLivro.Caption     := lblLivro.Caption;
          frmComprovanteEmprestimo.lblEmprestimo.Caption:= mskEmprestimo.Text;
          frmComprovanteEmprestimo.lblDevolver.Caption  := mskDevolver.Text;
          frmComprovanteEmprestimo.QckRpCompEmprestimo.Preview;
        finally
          FreeAndNil(frmComprovanteEmprestimo);
        end;
      end;

    Close;
  except
    MessageDlg('Erro ao incluir o novo empréstimo!',mtError,[mbOk],0);
  end;
end;

procedure TfrmCadastroEmprestimos.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroEmprestimos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Close;
end;

procedure TfrmCadastroEmprestimos.mskEmprestimoExit(Sender: TObject);
begin
  if (mskEmprestimo.Text <> '  /  /    ') then
    begin
      mskDevolver.Text := DateToStr(IncDay(StrToDate(mskEmprestimo.Text),5)); // função incday para incrementar dias.
    end;
end;

procedure TfrmCadastroEmprestimos.FormShow(Sender: TObject);
begin
  limparCampos;
end;

procedure TfrmCadastroEmprestimos.edtCodAtendenteEnter(Sender: TObject);
begin
  lblAtendente.Caption := '';
end;

procedure TfrmCadastroEmprestimos.edtCodAtendenteExit(Sender: TObject);
begin
  if (edtCodAtendente.Text <> trim('')) and (edtCodAtendente.Text <> '0') then
    begin
      qryCadEmprestimo.Close;
      qryCadEmprestimo.SQL.Clear;
      qryCadEmprestimo.SQL.Add('SELECT login FROM atendente');
      qryCadEmprestimo.SQL.Add('WHERE id_atendente = :id');
      qryCadEmprestimo.ParamByName('id').AsInteger := StrToInt(edtCodAtendente.Text);
      qryCadEmprestimo.Open;
      cdsCadEmprestimo.Close;
      cdsCadEmprestimo.Open;

      if cdsCadEmprestimo.RecordCount > 0 then
        begin
          lblAtendente.Caption := cdsCadEmprestimo.FieldByName('login').AsString;
          edtCodLeitor.SetFocus;
        end
      else
        BtnBuscaAtendente.SetFocus;
    end;
end;

procedure TfrmCadastroEmprestimos.edtCodLeitorEnter(Sender: TObject);
begin
  lblLeitor.Caption := '';
end;

procedure TfrmCadastroEmprestimos.edtCodLeitorExit(Sender: TObject);
begin
  if (edtCodLeitor.Text <> trim('')) and (edtCodAtendente.Text <> '0') then
    begin
      qryCadEmprestimo.Close;
      qryCadEmprestimo.SQL.Clear;
      qryCadEmprestimo.SQL.Add('SELECT nome FROM leitor');
      qryCadEmprestimo.SQL.Add('WHERE id_leitor = :id');
      qryCadEmprestimo.ParamByName('id').AsInteger := StrToInt(edtCodLeitor.Text);
      qryCadEmprestimo.Open;
      cdsCadEmprestimo.Close;
      cdsCadEmprestimo.Open;

      if cdsCadEmprestimo.RecordCount > 0 then
        begin
          lblLeitor.Caption := cdsCadEmprestimo.FieldByName('nome').AsString;
          edtCodLivro.SetFocus;
        end
      else
        btnBuscaLeitor.SetFocus;
    end;
end;

procedure TfrmCadastroEmprestimos.edtCodLivroEnter(Sender: TObject);
begin
  lblLivro.Caption := '';
end;

procedure TfrmCadastroEmprestimos.edtCodLivroExit(Sender: TObject);
begin
  if (edtCodLivro.Text <> trim('')) and (edtCodLivro.Text <> '0') then
    begin
      qryCadEmprestimo.Close;
      qryCadEmprestimo.SQL.Clear;
      qryCadEmprestimo.SQL.Add('SELECT titulo FROM livro');
      qryCadEmprestimo.SQL.Add('WHERE id_livro = :id');
      qryCadEmprestimo.ParamByName('id').AsInteger := StrToInt(edtCodLivro.Text);
      qryCadEmprestimo.Open;
      cdsCadEmprestimo.Close;
      cdsCadEmprestimo.Open;

      if cdsCadEmprestimo.RecordCount > 0 then
        begin
          lblLivro.Caption := cdsCadEmprestimo.FieldByName('titulo').AsString;
          mskEmprestimo.SetFocus;
        end
      else
        btnBuscaLeitor.SetFocus;
    end;
end;

procedure TfrmCadastroEmprestimos.BtnBuscaAtendenteClick(Sender: TObject);
begin
  try
    frmConsultaAtendentes := TfrmConsultaAtendentes.Create(self);
    frmConsultaAtendentes.BtnSelecionar.Visible := True;
    frmConsultaAtendentes.BtnIncluir.Visible := False;
    frmConsultaAtendentes.BtnAlterar.Visible := False;
    frmConsultaAtendentes.BtnExcluir.Visible := False;
    frmConsultaAtendentes.ShowModal;
  finally
    FreeAndNil(frmConsultaAtendentes);
  end;
end;

procedure TfrmCadastroEmprestimos.btnBuscaLeitorClick(Sender: TObject);
begin
  try
    frmConsultaLeitores := TfrmConsultaLeitores.Create(self);
    frmConsultaLeitores.BtnSelecionar.Visible := True;
    frmConsultaLeitores.BtnIncluir.Visible := False;
    frmConsultaLeitores.BtnAlterar.Visible := False;
    frmConsultaLeitores.BtnExcluir.Visible := False;
    frmConsultaLeitores.ShowModal;
  finally
    FreeAndNil(frmConsultaLeitores);
  end;
end;

procedure TfrmCadastroEmprestimos.BtnBuscaLivroClick(Sender: TObject);
begin
  try
    frmConsultaLivros := TfrmConsultaLivros.Create(self);
    frmConsultaLivros.BtnSelecionar.Visible := True;
    frmConsultaLivros.BtnIncluir.Visible := False;
    frmConsultaLivros.BtnAlterar.Visible := False;
    frmConsultaLivros.BtnExcluir.Visible := False;
    frmConsultaLivros.ShowModal;
  finally
    FreeAndNil(frmConsultaLivros);
  end;
end;

end.
