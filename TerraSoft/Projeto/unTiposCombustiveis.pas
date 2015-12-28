unit unTiposCombustiveis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unConsultas, FMTBcd, Provider, DBClient, DB, SqlExpr, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, unFuncoes;

type
  TfrmTiposCombustiveis = class(TfrmConsultas)
    Bevel1: TBevel;
    RdBtnCodigo: TRadioButton;
    RdBtnDescricao: TRadioButton;
    GrdTiposCombustiveis: TDBGrid;
    procedure GrdTiposCombustiveisDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure GrdTiposCombustiveisDblClick(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure GrdTiposCombustiveisKeyPress(Sender: TObject; var Key: Char);
    procedure GrdTiposCombustiveisTitleClick(Column: TColumn);
  private
    loFuncoes: TFuncoes;
    procedure carregaDados; override;
  public
    TelaChamando: integer;
  end;

var
  frmTiposCombustiveis: TfrmTiposCombustiveis;

implementation

uses unDM, unIncluirTipoCombustivel, unPrincipal, unIncluirAbastecimento,
  unAbastecimentos;

{$R *.dfm}

procedure TfrmTiposCombustiveis.GrdTiposCombustiveisDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if State = [] then
  begin
    if cdsDados.RecNo mod 2 = 1 then
      GrdTiposCombustiveis.Canvas.Brush.Color := clMoneyGreen
    else
      GrdTiposCombustiveis.Canvas.Brush.Color := clWhite;
  end;
  GrdTiposCombustiveis.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmTiposCombustiveis.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  sSQL := 'SELECT * FROM tiposcombustiveis';

  inherited;
end;

procedure TfrmTiposCombustiveis.BtnIncluirClick(Sender: TObject);
begin
  frmIncluirTipoCombustivel := TfrmIncluirTipoCombustivel.Create(self);
  inherited;

  try
    frmIncluirTipoCombustivel.ShowModal;
  finally
    FreeAndNil(frmIncluirTipoCombustivel);
  end;

  mostraTodos;
end;

procedure TfrmTiposCombustiveis.carregaDados;
begin
  inherited;
  frmIncluirTipoCombustivel.edtCodigo.Text := cdsDados.FieldByName('codigo').AsString;
  frmIncluirTipoCombustivel.edtDescricao.Text := cdsDados.FieldByName('descricao').AsString;
end;

procedure TfrmTiposCombustiveis.GrdTiposCombustiveisDblClick(
  Sender: TObject);
begin
  inherited;
  if telachamando <> 0 then
    begin
      if telaChamando = 1 then // faturamento os
        begin
          frmIncluirAbastecimento.edtCodTipoCombustivel.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirAbastecimento.lblTipoCombustivel.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      if TelaChamando = 2 then // consulta abastecimento
        begin
          frmAbastecimentos.edtCodTipoCombustivel.Text := cdsDados.FieldByName('codigo').AsString;
          frmAbastecimentos.lblTipoCombustivel.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      Self.Close;
    end
  else
    BtnAlterarClick(self);
end;

procedure TfrmTiposCombustiveis.edtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
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
                  Add('SELECT * FROM tiposcombustiveis WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
                end;

              // DESCRICAO
              if RdBtnDescricao.Checked then
                begin
                  Add('SELECT * FROM tiposcombustiveis WHERE descricao LIKE :desc');
                  ParamByName('desc').AsString := '%' + edtConsulta.Text + '%';
                end;

              Open;
            end;
        end;
      cdsDados.Open;
      cdsDados.Refresh;

      GrdTiposCombustiveis.SetFocus;
    end;
end;

procedure TfrmTiposCombustiveis.BtnAlterarClick(Sender: TObject);
begin
  frmIncluirTipoCombustivel := TfrmIncluirTipoCombustivel.Create(self);

  inherited;

  frmIncluirTipoCombustivel.ShowModal;
  FreeAndNil(frmIncluirTipoCombustivel);

  mostraTodos;
end;

procedure TfrmTiposCombustiveis.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmTiposCombustiveis.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmTiposCombustiveis.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir o tipo de combustível '+cdsDados.FieldByName('descricao').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if cdsDados.FieldByName('codigo').AsString <> trim('') then
        begin
          try
            with qryDados, SQL do
              begin
                Close;
                Clear;
                Add('DELETE FROM tiposcombustiveis WHERE codigo = :cod');
                ParamByName('cod').AsInteger := cdsDados.FieldByName('codigo').AsInteger;
                ExecSQL();
              end;
          except
            MessageDlg('Erro ao excluir o tipo de combustível!',mtError,[mbOk],0);
          end;
        end;         
      mostraTodos;
    end;
end;

procedure TfrmTiposCombustiveis.GrdTiposCombustiveisKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
    if TelaChamando > 0 then
      GrdTiposCombustiveisDblClick(self)
    else
      BtnAlterarClick(self);
end;

procedure TfrmTiposCombustiveis.GrdTiposCombustiveisTitleClick(
  Column: TColumn);
begin
  inherited;
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraTodos;
end;

end.
