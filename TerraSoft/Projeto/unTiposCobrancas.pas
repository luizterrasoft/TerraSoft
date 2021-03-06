unit unTiposCobrancas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unConsultas, FMTBcd, Provider, DBClient, DB, SqlExpr, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, unFuncoes;

type
  TfrmTiposCobrancas = class(TfrmConsultas)
    Bevel1: TBevel;
    RdBtnCodigo: TRadioButton;
    RdBtnDescricao: TRadioButton;
    GrdTiposCobranca: TDBGrid;
    procedure GrdTiposCobrancaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure GrdTiposCobrancaDblClick(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure GrdTiposCobrancaKeyPress(Sender: TObject; var Key: Char);
    procedure GrdTiposCobrancaTitleClick(Column: TColumn);
  private
    loFuncoes: TFuncoes;
    procedure carregaDados; override;
  public
    TelaChamando: integer;
  end;

var
  frmTiposCobrancas: TfrmTiposCobrancas;

implementation

uses unIncluirTipoCobranca, unFaturamentoOS, unIncluirContasReceber,
  unPrincipal, unContasReceber;

{$R *.dfm}

procedure TfrmTiposCobrancas.carregaDados;
begin
  inherited;
  frmIncluirTipoCobranca.edtCodigo.Text := cdsDados.FieldByName('codigo').AsString;
  frmIncluirTipoCobranca.edtDescricao.Text := cdsDados.FieldByName('descricao').AsString;
end;

procedure TfrmTiposCobrancas.GrdTiposCobrancaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if State = [] then
  begin
    if cdsDados.RecNo mod 2 = 1 then
      GrdTiposCobranca.Canvas.Brush.Color := clMoneyGreen
    else
      GrdTiposCobranca.Canvas.Brush.Color := clWhite;
  end;
  GrdTiposCobranca.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmTiposCobrancas.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  sSQL := 'SELECT * FROM tipocobranca';

  inherited;

end;

procedure TfrmTiposCobrancas.BtnIncluirClick(Sender: TObject);
begin
  inherited;
  frmIncluirTipoCobranca := TfrmIncluirTipoCobranca.Create(self);

  try
    frmIncluirTipoCobranca.ShowModal;
  finally
    FreeAndNil(frmIncluirTipoCobranca);
  end;

  mostraTodos;
end;

procedure TfrmTiposCobrancas.GrdTiposCobrancaDblClick(Sender: TObject);
begin
  inherited;
  if telachamando <> 0 then
    begin
      if telaChamando = 1 then // faturamento os
        begin
            frmFaturamentoOS.edtCodTipoCobranca.Text := cdsDados.FieldByName('codigo').AsString;
            frmFaturamentoOS.lblResTipoCobranca.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      if telaChamando = 2 then  // inclusao manual cr
        begin
          frmIncluirContasReceber.edtCodiTipoCobranca.Text := cdsDados.FieldByname('codigo').AsString;
          frmIncluirContasReceber.lblResTipoCobranca.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      if TelaChamando = 3 then // consulta contas receber
        begin
          frmContasReceber.edtCodTipoCobranca.Text := cdsDados.FieldByName('codigo').AsString;
          frmContasReceber.lblTipoCobranca.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      Self.Close;
    end
  else
    BtnAlterarClick(self);
end;

procedure TfrmTiposCobrancas.edtConsultaKeyPress(Sender: TObject;
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
                  Add('SELECT * FROM tipocobranca WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
                end;

              // NOME
              if RdBtnDescricao.Checked then
                begin
                  Add('SELECT * FROM tipocobranca WHERE descricao LIKE :desc');
                  ParamByName('desc').AsString := '%' + edtConsulta.Text + '%';
                end;

              Open;
            end;
        end;
      cdsDados.Open;
      cdsDados.Refresh;

      GrdTiposCobranca.SetFocus;      
    end;
end;

procedure TfrmTiposCobrancas.BtnAlterarClick(Sender: TObject);
begin
  frmIncluirTipoCobranca := TfrmIncluirTipoCobranca.Create(self);

  inherited;

  frmIncluirTipoCobranca.ShowModal;
  FreeAndNil(frmIncluirTipoCobranca);

  mostraTodos;
end;

procedure TfrmTiposCobrancas.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmTiposCobrancas.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmTiposCobrancas.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir o tipo de cobran�a '+cdsDados.FieldByName('descricao').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if cdsDados.FieldByName('codigo').AsString <> trim('') then
        begin
          try
            with qryDados, SQL do
              begin
                Close;
                Clear;
                Add('DELETE FROM tipocobranca WHERE codigo = :cod');
                ParamByName('cod').AsInteger := cdsDados.FieldByName('codigo').AsInteger;
                ExecSQL();
              end;
          except
            MessageDlg('Erro ao excluir o tipo de cobran�a!',mtError,[mbOk],0);
          end;
        end;         
      mostraTodos;
    end;
end;

procedure TfrmTiposCobrancas.GrdTiposCobrancaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
    if TelaChamando > 0 then
      GrdTiposCobrancaDblClick(self)
    else
      BtnAlterarClick(self);
end;

procedure TfrmTiposCobrancas.GrdTiposCobrancaTitleClick(Column: TColumn);
begin
  inherited;
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraTodos;
end;

end.
