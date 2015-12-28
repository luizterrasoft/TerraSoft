unit unTelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unConsultas, FMTBcd, Provider, DBClient, DB, SqlExpr, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, unFuncoes;

type
  TfrmTelas = class(TfrmConsultas)
    RdBtnCodigo: TRadioButton;
    RdBtnDescricao: TRadioButton;
    RdBtnCaption: TRadioButton;
    Bevel1: TBevel;
    GrdTelas: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure GrdTelasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdTelasDblClick(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure GrdTelasKeyPress(Sender: TObject; var Key: Char);
    procedure GrdTelasTitleClick(Column: TColumn);
  private
    loFuncoes: TFuncoes;
    procedure carregaDados; override;
  public
    telachamando: integer;
  end;

var
  frmTelas: TfrmTelas;

implementation

uses unIncluirTela, unIncluirBotao, unPermissoesUsuarios, unPrincipal;

{$R *.dfm}

procedure TfrmTelas.FormShow(Sender: TObject);
begin
  if frmPrincipal.iModoSuporte = 1 then
    begin
      BtnIncluir.Visible := True;
      BtnAlterar.Visible := True;
      BtnExcluir.Visible := True;
    end;

  frmPrincipal.sCampo := 'CODIGO';

  sSQL := 'SELECT * FROM formularios';

  inherited;

end;

procedure TfrmTelas.BtnIncluirClick(Sender: TObject);
begin
  frmIncluirTela := TfrmIncluirTela.Create(self);
  inherited;
  frmIncluirTela.ShowModal;
  FreeAndNil(frmIncluirTela);
  mostraTodos;
end;

procedure TfrmTelas.GrdTelasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if State = [] then
  begin
    if cdsDados.RecNo mod 2 = 1 then
      GrdTelas.Canvas.Brush.Color := clMoneyGreen
    else
      GrdTelas.Canvas.Brush.Color := clWhite;
  end;
  GrdTelas.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmTelas.GrdTelasDblClick(Sender: TObject);
begin
  inherited;
  if telachamando <> 0 then
    begin
      if telaChamando = 1 then // BOTOES
        begin
          frmIncluirBotao.edtCodtela.Text := cdsDados.FieldByname('codigo').AsString;
          frmIncluirBotao.lblTela.Caption := cdsDados.FieldByName('caption').AsString;
        end;

      if telaChamando = 2 then // PERMISSOES
        begin
          frmPermissoesUsuarios.edtCodTela.Text := cdsDados.FieldByname('codigo').AsString;
          frmPermissoesUsuarios.lblTela.Caption := cdsDados.FieldByName('caption').AsString;
        end;

      Self.Close;
    end
  else
    if frmPrincipal.iModoSuporte = 1 then
      BtnAlterarClick(self);
end;

procedure TfrmTelas.edtConsultaKeyPress(Sender: TObject; var Key: Char);
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
                  Add('SELECT * FROM formularios WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
                end;

              // DESCRICAO
              if RdBtnDescricao.Checked then
                begin
                  Add('SELECT * FROM formularios WHERE descricao LIKE :desc');
                  ParamByName('desc').AsString := '%' + edtConsulta.Text + '%';
                end;

              // CAPTION
              if RdBtnCaption.Checked then
                begin
                  Add('SELECT * FROM formularios WHERE caption LIKE :cap');
                  ParamByName('cap').AsString := '%' + edtConsulta.Text + '%';
                end;
              Open;
            end;
        end;
      cdsDados.Open;
      cdsDados.Refresh;

      GrdTelas.SetFocus;
    end;
end;

procedure TfrmTelas.BtnAlterarClick(Sender: TObject);
begin
  frmIncluirTela := TfrmIncluirTela.Create(self);

  inherited;

  frmIncluirTela.ShowModal;
  FreeAndNil(frmIncluirTela);

  mostraTodos;
end;

procedure TfrmTelas.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmTelas.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmTelas.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir a tela '+cdsDados.FieldByName('caption').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if cdsDados.FieldByName('codigo').AsString <> trim('') then
        begin
          try
            with qryDados, SQL do
              begin
                Close;
                Clear;
                Add('DELETE FROM formularios WHERE codigo = :cod');
                ParamByName('cod').AsInteger := cdsDados.FieldByName('codigo').AsInteger;
                ExecSQL();
              end;
          except
            MessageDlg('Erro ao excluir a tela!',mtError,[mbOk],0);
          end;
        end;         
      mostraTodos;
    end;
end;

procedure TfrmTelas.GrdTelasKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
    if telachamando > 0 then
      GrdTelasDblClick(self)
    else
      BtnAlterarClick(self);
end;

procedure TfrmTelas.carregaDados;
begin
  inherited;
  frmIncluirTela.edtCodigo.Text     := cdsDados.FieldByname('codigo').AsString;
  frmIncluirTela.edtDescricao.Text  := cdsDados.FieldByName('descricao').AsString;
  frmIncluirTela.edtCaption.Text    := cdsDados.FieldByName('caption').AsString;
end;

procedure TfrmTelas.GrdTelasTitleClick(Column: TColumn);
begin
  inherited;
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraTodos;
end;

end.
