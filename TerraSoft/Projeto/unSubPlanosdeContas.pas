unit unSubPlanosdeContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unConsultas, FMTBcd, Provider, DBClient, DB, SqlExpr, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, unfUncoes;

type
  TfrmSubPlanosdeContas = class(TfrmConsultas)
    Bevel1: TBevel;
    RdBtnCodigo: TRadioButton;
    RdBtnDescricao: TRadioButton;
    GrdSubPlanos: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure GrdSubPlanosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdSubPlanosDblClick(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure GrdSubPlanosKeyPress(Sender: TObject; var Key: Char);
    procedure GrdSubPlanosTitleClick(Column: TColumn);
  private
    loFuncoes: TFuncoes;
    procedure carregaDados; override;
  public
    telachamando: integer;
    CodPlanoConta: integer;
  end;

var
  frmSubPlanosdeContas: TfrmSubPlanosdeContas;

implementation

uses unIncluirSubPlanoContas, unManutencoes, unIncluirContasPagar,
  unPrincipal, unIncluirAbastecimento;

{$R *.dfm}

{ TfrmSubPlanosdeContas }

procedure TfrmSubPlanosdeContas.carregaDados;
begin
  inherited;
  frmIncluirSubPlanoContas.edtCodigo.Text       := cdsDados.FieldByName('codigo').AsString;
  frmIncluirSubPlanoContas.edtSequencial.Text   := cdsDados.FieldByName('sequencial').AsString;
  frmIncluirSubPlanoContas.edtDescricao.Text    := cdsDados.FieldByName('descricao').AsString;

  frmIncluirSubPlanoContas.edtCodPlanoConta.Text  := cdsDados.FieldByName('codplanoconta').AsString;
  frmIncluirSubPlanoContas.lblPlanoConta.Caption  := loFuncoes.BuscaFk(frmIncluirSubPlanoContas.edtCodPlanoConta.Text,'planocontas','descricao');
end;

procedure TfrmSubPlanosdeContas.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  if CodPlanoConta < 1 then
    sSQL := 'SELECT * FROM SUBPLANOCONTAS'
  else
    sSQL := 'SELECT * FROM SUBPLANOCONTAS WHERE codplanoconta = ' + IntToStr(CodPlanoConta);

  inherited;
end;

procedure TfrmSubPlanosdeContas.BtnIncluirClick(Sender: TObject);
begin
  inherited;
  try
    frmIncluirSubPlanoContas := TfrmIncluirSubPlanoContas.Create(self);
    frmIncluirSubPlanoContas.ShowModal;
  finally
    FreeAndNil(frmIncluirSubPlanoContas);
    mostraTodos;
  end;
end;

procedure TfrmSubPlanosdeContas.GrdSubPlanosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if State = [] then
  begin
    if cdsDados.RecNo mod 2 = 1 then
      GrdSubPlanos.Canvas.Brush.Color := clMoneyGreen
    else
      GrdSubPlanos.Canvas.Brush.Color := clWhite;
  end;
  GrdSubPlanos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmSubPlanosdeContas.GrdSubPlanosDblClick(Sender: TObject);
begin
  inherited;
  if telachamando <> 0 then
    begin
      if telachamando = 1 then
        begin
          frmManutencoes.edtCodSubPlano.Text := cdsDados.FieldByName('codigo').AsString;
          frmManutencoes.lblSubPlano.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      if telaChamando = 2 then
        begin
          frmIncluirContasPagar.edtCodSubPlano.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirContasPagar.lblSubPlano.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      if telachamando = 3 then // inclusao abastecimento
        begin
          frmIncluirAbastecimento.edtCodSubPlanoConta.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirAbastecimento.lblSubPlanoConta.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      Self.Close;
    end
  else
    BtnAlterarClick(self);
end;

procedure TfrmSubPlanosdeContas.edtConsultaKeyPress(Sender: TObject;
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
                  Add('SELECT * FROM subplanocontas WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
                end;

              // DESCRICAO
              if RdBtnDescricao.Checked then
                begin
                  Add('SELECT * FROM subplanocontas WHERE descricao LIKE :desc');
                  ParamByName('desc').AsString := '%' + edtConsulta.Text + '%';
                end;
              Open;
            end;
        end;
      cdsDados.Open;
      cdsDados.Refresh;

       GrdSubPlanos.SetFocus;      
    end;
end;

procedure TfrmSubPlanosdeContas.BtnAlterarClick(Sender: TObject);
begin
  frmIncluirSubPlanoContas := TfrmIncluirSubPlanoContas.Create(self);

  inherited;

  frmIncluirSubPlanoContas.ShowModal;
  FreeAndNil(frmIncluirSubPlanoContas);

  mostraTodos;
end;

procedure TfrmSubPlanosdeContas.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmSubPlanosdeContas.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmSubPlanosdeContas.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir o sub-plano de contas? '+cdsDados.FieldByName('descricao').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if cdsDados.FieldByName('codigo').AsString <> trim('') then
        begin
          try
            with qryDados, SQL do
              begin
                Close;
                Clear;
                Add('DELETE FROM subplanocontas WHERE codigo = :cod');
                ParamByName('cod').AsInteger := cdsDados.FieldByName('codigo').AsInteger;
                ExecSQL();
              end;
          except
            MessageDlg('Erro ao excluir o sub-plano de contas!',mtError,[mbOk],0);
          end;
        end;
      mostraTodos;
    end;
end;

procedure TfrmSubPlanosdeContas.GrdSubPlanosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
    if telachamando > 0 then
      GrdSubPlanosDblClick(self)
    else
      BtnAlterarClick(self);
end;

procedure TfrmSubPlanosdeContas.GrdSubPlanosTitleClick(Column: TColumn);
begin
  inherited;
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraTodos;
end;

end.
