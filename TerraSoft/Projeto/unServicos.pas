unit unServicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unConsultas, FMTBcd, Provider, DBClient, DB, SqlExpr, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, unFuncoes;

type
  TfrmServicos = class(TfrmConsultas)
    Bevel1: TBevel;
    RdBtnCodigo: TRadioButton;
    RdBtnDescricao: TRadioButton;
    GrdServicos: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure GrdServicosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdServicosDblClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnExcluirClick(Sender: TObject);
    procedure GrdServicosKeyPress(Sender: TObject; var Key: Char);
    procedure GrdServicosTitleClick(Column: TColumn);
  private

    loFuncoes: TFuncoes;
    procedure carregaDados; override;
  public
    telachamando: integer;
  end;

var
  frmServicos: TfrmServicos;

implementation

uses unIncluirServico, unPrincipal, unIncluirOS;

{$R *.dfm}

procedure TfrmServicos.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  sSQL := 'SELECT * FROM servicos';

  inherited;

  TNumericField(cdsDados.FieldByName('valor')).DisplayFormat := ',0.00;-,0.00'; 
end;

procedure TfrmServicos.BtnIncluirClick(Sender: TObject);
begin
  inherited;
  frmIncluirServico := TfrmIncluirServico.Create(self);
  frmIncluirServico.ShowModal;
  FreeAndNil(frmIncluirServico);
  mostraTodos;
end;

procedure TfrmServicos.GrdServicosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if State = [] then
  begin
    if cdsDados.RecNo mod 2 = 1 then
      GrdServicos.Canvas.Brush.Color := clMoneyGreen
    else
      GrdServicos.Canvas.Brush.Color := clWhite;
  end;
  GrdServicos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmServicos.GrdServicosDblClick(Sender: TObject);
begin
  inherited;
  if telachamando <> 0 then
    begin
      if telaChamando = 1 then // os /// naaaoooo exiiiste maaaiss
        begin

        end;

      Self.Close;
    end
  else
    BtnAlterarClick(self);
end;

procedure TfrmServicos.BtnAlterarClick(Sender: TObject);
begin
  frmIncluirServico := TfrmIncluirServico.Create(self);

  inherited;

  frmIncluirServico.ShowModal;
  FreeAndNil(frmIncluirServico);

  mostraTodos;
end;

procedure TfrmServicos.edtConsultaKeyPress(Sender: TObject; var Key: Char);
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
                  Add('SELECT * FROM servicos WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
                end;

              // DESCRICAO
              if RdBtnDescricao.Checked then
                begin
                  Add('SELECT * FROM servicos WHERE descricao LIKE :desc');
                  ParamByName('desc').AsString := '%' + edtConsulta.Text + '%';
                end;
              Open;
            end;
        end;
      cdsDados.Open;
      cdsDados.Refresh;

      GrdServicos.SetFocus;

    end;
end;

procedure TfrmServicos.carregaDados;
begin
  inherited;
  with cdsDados do
    begin
      with frmIncluirServico do
        begin
          edtCodigo.Text    := FieldByName('codigo').AsString;
          edtDescricao.Text := FieldByName('descricao').AsString;
          edtUnidade.Text   := FieldByName('unidade').AsString;
          edtValor.Text     := loFuncoes.TrataReal(FieldByName('valor').AsString);
        end;
    end;
end;

procedure TfrmServicos.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir o servi�o '+cdsDados.FieldByName('descricao').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if cdsDados.FieldByName('codigo').AsString <> trim('') then
        begin
          try
            with qryDados, SQL do
              begin
                Close;
                Clear;
                Add('DELETE FROM servicos WHERE codigo = :cod');
                ParamByName('cod').AsInteger := cdsDados.FieldByName('codigo').AsInteger;
                ExecSQL();
              end;
          except
            MessageDlg('Erro ao excluir o servi�o!',mtError,[mbOk],0);
          end;
        end;

      mostraTodos;
    end;
end;

procedure TfrmServicos.GrdServicosKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
    if telachamando > 0 then
      GrdServicosDblClick(self)
    else
      BtnAlterarClick(self);
end;

procedure TfrmServicos.GrdServicosTitleClick(Column: TColumn);
begin
  inherited;
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraTodos;
end;

end.