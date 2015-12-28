unit unBotoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unConsultas, FMTBcd, Provider, DBClient, DB, SqlExpr, StdCtrls,
  Buttons, ExtCtrls, unFuncoes, Grids, DBGrids;

type
  TfrmBotoes = class(TfrmConsultas)
    GrdBotoes: TDBGrid;
    RdBtnCodigo: TRadioButton;
    RdBtnDescricao: TRadioButton;
    RdBtnTela: TRadioButton;
    RdBtnCaption: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure GrdBotoesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdBotoesDblClick(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure GrdBotoesKeyPress(Sender: TObject; var Key: Char);
    procedure GrdBotoesTitleClick(Column: TColumn);
  private
    loFuncoes: TFuncoes;
    procedure carregaDados; override;
  public
    telachamando: integer;
  end;

var
  frmBotoes: TfrmBotoes;

implementation

uses unIncluirBotao, unPermissoesUsuarios, unPrincipal;

{$R *.dfm}

procedure TfrmBotoes.FormShow(Sender: TObject);
begin
  if frmPrincipal.iModoSuporte = 1 then
    begin
      BtnIncluir.Visible := True;
      BtnAlterar.Visible := True;
      BtnExcluir.Visible := True;
    end;

  frmPrincipal.sCampo := 'DESCRICAO';

  sSQL := 'SELECT bot.*, form.caption AS Tela ' +
          'FROM botoes bot ' +
          'INNER JOIN formularios form ' +
          'ON form.codigo = bot.codform ';

  inherited;

end;

procedure TfrmBotoes.BtnIncluirClick(Sender: TObject);
begin
  frmIncluirBotao := TfrmIncluirBotao.Create(self);
  inherited;
  frmIncluirBotao.ShowModal;
  FreeAndNil(frmIncluirBotao);
  mostraTodos;
end;

procedure TfrmBotoes.GrdBotoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if State = [] then
  begin
    if cdsDados.RecNo mod 2 = 1 then
      GrdBotoes.Canvas.Brush.Color := clMoneyGreen
    else
      GrdBotoes.Canvas.Brush.Color := clWhite;
  end;
  GrdBotoes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmBotoes.GrdBotoesDblClick(Sender: TObject);
begin
  inherited;
  if telachamando <> 0 then
    begin
      if telaChamando = 1 then // 
        begin
          frmPermissoesUsuarios.edtCodOpcaoBotao.Text := cdsDados.FieldByName('codigo').AsString;
          frmPermissoesUsuarios.lblOpcaoBotao.Caption := cdsDados.FieldByName('caption').AsString;
        end;

      Self.Close;
    end
  else
    if frmPrincipal.iModoSuporte = 1 then
      BtnAlterarClick(self);
end;

procedure TfrmBotoes.edtConsultaKeyPress(Sender: TObject; var Key: Char);
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
                  Add('SELECT * FROM botoes WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
                end;

              // DESCRICAO
              if RdBtnDescricao.Checked then
                begin
                  Add('SELECT * FROM botoes WHERE descricao LIKE :desc');
                  ParamByName('desc').AsString := '%' + edtConsulta.Text + '%';
                end;

              // CAPTION
              if RdBtnCaption.Checked then
                begin
                  Add('SELECT * FROM botoes WHERE caption LIKE :cap');
                  ParamByName('cap').AsString := '%' + edtConsulta.Text + '%';
                end;

              // TELA
              if RdBtnTela.Checked then
                begin
                  Add('SELECT bot.*, form.caption');
                  Add('FROM botoes bot');
                  Add('INNER JOIN formularios form');
                  Add('ON form.codigo = bot.codform');
                  Add('WHERE form.caption LIKE :cap');
                  ParamByName('cap').AsString := '%' + edtConsulta.Text + '%';
                end;

              Add('ORDER BY '+ frmPrincipal.sCampo);

              Open;
            end;
        end;
      cdsDados.Open;
      cdsDados.Refresh;

      GrdBotoes.SetFocus;
    end;
end;

procedure TfrmBotoes.BtnAlterarClick(Sender: TObject);
begin
  frmIncluirBotao := TfrmIncluirBotao.Create(self);

  inherited;

  frmIncluirBotao.ShowModal;
  FreeAndNil(frmIncluirBotao);

  mostraTodos;
end;

procedure TfrmBotoes.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmBotoes.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmBotoes.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir o botão/função '+cdsDados.FieldByName('caption').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if cdsDados.FieldByName('codigo').AsString <> trim('') then
        begin
          try
            with qryDados, SQL do
              begin
                Close;
                Clear;
                Add('DELETE FROM botoes WHERE codigo = :cod');
                ParamByName('cod').AsInteger := cdsDados.FieldByName('codigo').AsInteger;
                ExecSQL();
              end;
          except
            MessageDlg('Erro ao excluir o botão/função!',mtError,[mbOk],0);
          end;
        end;         
      mostraTodos;
    end;
end;

procedure TfrmBotoes.GrdBotoesKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
    if telachamando > 0 then
      GrdBotoesDblClick(self)
    else
      BtnAlterarClick(self);
end;

procedure TfrmBotoes.carregaDados;
begin
  inherited;
  frmIncluirBotao.edtCodigo.Text    := cdsDados.FieldByName('codigo').AsString;
  frmIncluirBotao.edtDescricao.Text := cdsDados.FieldByName('descricao').AsString;
  frmIncluirBotao.edtcaption.text   := cdsDados.FieldByName('caption').AsString;
  frmIncluirBotao.edtCodtela.Text   := cdsDados.FieldByName('codform').AsString;

  frmIncluirBotao.lblTela.Caption := loFuncoes.BuscaFk(frmIncluirBotao.edtCodtela.Text,'formularios','caption');  
end;

procedure TfrmBotoes.GrdBotoesTitleClick(Column: TColumn);
begin
  inherited;
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraTodos;
end;

end.
