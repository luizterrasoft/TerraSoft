unit unFormasPgto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unConsultas, FMTBcd, Provider, DBClient, DB, SqlExpr, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids;

type
  TfrmFormasPgto = class(TfrmConsultas)
    Bevel1: TBevel;
    RdBtnCodigo: TRadioButton;
    RdBtnDescricao: TRadioButton;
    GrdFormasPgto: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure GrdFormasPgtoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure GrdFormasPgtoDblClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnExcluirClick(Sender: TObject);
    procedure GrdFormasPgtoKeyPress(Sender: TObject; var Key: Char);
    procedure GrdFormasPgtoTitleClick(Column: TColumn);
  private

    procedure CarregaDados; override;
  public
    telaChamando: integer;
  end;

var
  frmFormasPgto: TfrmFormasPgto;

implementation

uses unIncluirFormaPgto, unIncluirOS, unFaturamentoOS,
  unIncluirContasReceber, unQuitarContaReceber, unQuitarContaPagar,
  unPrincipal;

{$R *.dfm}

procedure TfrmFormasPgto.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  sSQL := 'SELECT * FROM formaspgto';

  inherited;

end;

procedure TfrmFormasPgto.BtnIncluirClick(Sender: TObject);
begin
  inherited;
  frmIncluirFormaPgto := TfrmIncluirFormaPgto.Create(self);
  frmIncluirFormaPgto.ShowModal;
  FreeAndNil(frmIncluirFormaPgto);
  mostraTodos;
end;

procedure TfrmFormasPgto.GrdFormasPgtoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if State = [] then
  begin
    if cdsDados.RecNo mod 2 = 1 then
      GrdFormasPgto.Canvas.Brush.Color := clMoneyGreen
    else
      GrdFormasPgto.Canvas.Brush.Color := clWhite;
  end;
  GrdFormasPgto.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmFormasPgto.GrdFormasPgtoDblClick(Sender: TObject);
begin                              
  if telaChamando <> 0 then
    begin
      if telaChamando = 1 then // faturamento da os
        begin
          // não está sendo usado por em qnto
          {frmFaturamentoOS.edtCodFormaPgto.Text := cdsDados.FieldByName('codigo').AsString;
          frmFaturamentoOS.lblFormaPgto.Caption := cdsDados.FieldByName('descricao').AsString;}
        end;

      if telaChamando = 2 then // inclusao contas receber
        begin
          
        end;

      if telaChamando = 3 then // quitando conta a receber
        begin
          frmQuitarContaReceber.edtCodFormaRcbto.Text := cdsDados.FieldByName('codigo').AsString;
          frmQuitarContaReceber.lblFormaRcbto.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      if telaChamando = 4 then // quitando conta a pagar
        begin
          frmQuitarContaPagar.edtCodFormaPgto.Text := cdsDados.FieldByName('codigo').AsString;
          frmQuitarContaPagar.lblFormaPgto.Caption := cdsDados.FieldByName('descricao').AsString; 
        end;

      Self.Close;
    end
  else
    BtnAlterarClick(self);
end;

procedure TfrmFormasPgto.BtnAlterarClick(Sender: TObject);
begin
  frmIncluirFormaPgto := TfrmIncluirFormaPgto.Create(self);

  inherited;

  frmIncluirFormaPgto.ShowModal;
  FreeAndNil(frmIncluirFormaPgto);

  mostraTodos;
end;

procedure TfrmFormasPgto.edtConsultaKeyPress(Sender: TObject;
  var Key: Char);
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
                  Add('SELECT * FROM formaspgto WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
                end;

              // DESCRICAO
              if RdBtnDescricao.Checked then
                begin
                  Add('SELECT * FROM formaspgto WHERE descricao LIKE :desc');
                  ParamByName('desc').AsString := '%' + edtConsulta.Text + '%';
                end;

              Open;
            end;
        end;
      cdsDados.Open;
      cdsDados.Refresh;

      GrdFormasPgto.SetFocus;
    end;
end;

procedure TfrmFormasPgto.CarregaDados;
begin
  inherited;
  with cdsDados do
    begin
      with frmIncluirFormaPgto do
        begin
          edtCodigo.Text    := FieldByName('codigo').AsString;
          edtDescricao.Text := FieldByName('descricao').AsString;
        end;
    end;
end;

procedure TfrmFormasPgto.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir a forma de pagamento '+cdsDados.FieldByName('descricao').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if cdsDados.FieldByName('codigo').AsString <> trim('') then
        begin
          try
            with qryDados, SQL do
              begin
                Close;
                Clear;
                Add('DELETE FROM formaspgto WHERE codigo = :cod');
                ParamByName('cod').AsInteger := cdsDados.FieldByName('codigo').AsInteger;
                ExecSQL();
              end;
          except
            MessageDlg('Erro ao excluir a forma de pagamento!',mtError,[mbOk],0);
          end;
        end;         
      mostraTodos;
    end;
end;

procedure TfrmFormasPgto.GrdFormasPgtoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
    if telaChamando > 0 then
      GrdFormasPgtoDblClick(self)
    else
      BtnAlterarClick(self);
end;

procedure TfrmFormasPgto.GrdFormasPgtoTitleClick(Column: TColumn);
begin
  inherited;
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraTodos;
end;

end.
