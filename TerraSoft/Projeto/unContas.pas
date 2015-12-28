unit unContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unConsultas, FMTBcd, Provider, DBClient, DB, SqlExpr, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, unFuncoes;

type
  TfrmContas = class(TfrmConsultas)
    Bevel1: TBevel;
    RdBtnCodigo: TRadioButton;
    RdBtnDescricao: TRadioButton;
    GrdContas: TDBGrid;
    procedure BtnIncluirClick(Sender: TObject);
    procedure GrdContasDblClick(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GrdContasKeyPress(Sender: TObject; var Key: Char);
    procedure GrdContasTitleClick(Column: TColumn);
  private
    loFuncoes: TFuncoes;
    procedure carregaDados; override;
  public
    telaChamando: integer;
  end;

var
  frmContas: TfrmContas;

implementation

uses unIncluirConta, unQuitarContaReceber, unIncluirCaixa, unCaixa,
  UnSelecaoContaAvista, unQuitarContaPagar, unPrincipal,
  unTransferenciaCaixa;

{$R *.dfm}

{ TfrmContas }

procedure TfrmContas.carregaDados;
begin
  inherited;
  with cdsDados do
    begin
      with frmIncluirConta do
        begin
          edtCodigo.Text := FIeldByName('codigo').AsString;
          edtDescricao.Text := FieldByName('descricao').AsString;
        end;
    end;
end;

procedure TfrmContas.BtnIncluirClick(Sender: TObject);
begin
  inherited;
  frmIncluirConta := TfrmIncluirConta.Create(self);
  frmIncluirConta.ShowModal;
  FreeAndNil(frmIncluirConta);
  mostraTodos;
end;

procedure TfrmContas.GrdContasDblClick(Sender: TObject);
begin
  inherited;
  if telachamando <> 0 then
    begin
      if telaChamando = 1 then // quita��o conta a receber
        begin
          frmQuitarContaReceber.edtCodConta.Text := cdsDados.FieldByName('codigo').AsString;
          frmQuitarContaReceber.lblConta.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      if telaChamando = 2 then // consulta caixa
        begin
          frmCaixa.edtCodConta.Text := cdsDados.FieldByName('codigo').AsString;
          frmCaixa.lblConta.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      if telaChamando = 3 then // inclusao manual no caixa
        begin
          frmIncluirCaixa.edtCodConta.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirCaixa.lblConta.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      if telaChamando = 4 then // selecionando conta para lan�amento a vista
        begin
          frmSelecaoContaAvista.edtCodConta.Text := cdsDados.FieldByName('codigo').AsString;
          frmSelecaoContaAvista.lblConta.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      if telaChamando = 5 then // quita��o contas a pagar
        begin
          frmQuitarContaPagar.edtCodConta.Text := cdsDados.FieldByName('codigo').AsString;
          frmQuitarContaPagar.lblConta.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      if telaChamando = 6 then // conta origem transferencia
        begin
          frmTransferenciaCaixa.edtContaOrigem.Text := cdsDados.FieldByName('codigo').AsString;
          frmTransferenciaCaixa.lblContaOrigem.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      if telaChamando = 7 then // conta destino transferencia
        begin
          frmTransferenciaCaixa.edtContaDestino.Text := cdsDados.FieldByName('codigo').AsString;
          frmTransferenciaCaixa.lblContaDestino.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      Self.Close;
    end
  else
    BtnAlterarClick(self);
end;

procedure TfrmContas.edtConsultaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
    begin
      if edtConsulta.Text <> trim('') then
        begin
          with qryDados, SQL do
            begin
              Close;
              Clear;

              // CODIGO
              if RdBtnCodigo.Checked then
                begin
                  Add('SELECT * FROM contas WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
                end;

              // DESCRICAO
              if RdBtnDescricao.Checked then
                begin
                  Add('SELECT * FROM contas WHERE descricao LIKE :desc');
                  ParamByName('desc').AsString := '%' + edtConsulta.Text + '%';
                end;

              Open;
            end;
        end;
      cdsDados.Open;
      cdsDados.Refresh;

      GrdContas.SetFocus;
      
    end;
end;

procedure TfrmContas.BtnAlterarClick(Sender: TObject);
begin
  frmIncluirConta := TfrmIncluirConta.Create(self);

  inherited;

  frmIncluirConta.ShowModal;
  FreeAndNil(frmIncluirConta);

  mostraTodos;
end;

procedure TfrmContas.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmContas.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmContas.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir a conta '+cdsDados.FieldByName('descricao').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if cdsDados.FieldByName('codigo').AsString <> trim('') then
        begin
          try
            with qryDados, SQL do
              begin
                Close;
                Clear;
                Add('DELETE FROM contas WHERE codigo = :cod');
                ParamByName('cod').AsInteger := cdsDados.FieldByName('codigo').AsInteger;
                ExecSQL();
              end;
          except
            MessageDlg('Erro ao excluir a conta!',mtError,[mbOk],0);
          end;
        end;         
      mostraTodos;
    end;
end;

procedure TfrmContas.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  sSQL := 'SELECT * FROM contas';

  inherited;

end;

procedure TfrmContas.GrdContasKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
    if telaChamando > 0 then
      GrdContasDblClick(self)
    else
      BtnAlterarClick(self);
end;

procedure TfrmContas.GrdContasTitleClick(Column: TColumn);
begin
  inherited;
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  sSQL := 'SELECT * FROM contas ORDER BY '+ frmPrincipal.sCampo;

  mostraTodos;
end;

end.
