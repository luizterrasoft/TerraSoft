unit unUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unConsultas, FMTBcd, Provider, DBClient, DB, SqlExpr, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, unFuncoes;

type
  TfrmUsuarios = class(TfrmConsultas)
    Bevel1: TBevel;
    RdBtnCodigo: TRadioButton;
    RdBtnNome: TRadioButton;
    RdBtnUsuario: TRadioButton;
    GrdUsuarios: TDBGrid;
    BtnPermissoes: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure GrdUsuariosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdUsuariosDblClick(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GrdUsuariosKeyPress(Sender: TObject; var Key: Char);
    procedure BtnPermissoesClick(Sender: TObject);
    procedure GrdUsuariosTitleClick(Column: TColumn);
  private
    loFuncoes: TFuncoes;
    procedure carregaDados; override;
  public
    telaChamando: integer;
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

uses unIncluirUsuario, unPermissoesUsuarios, unPrincipal;

{$R *.dfm}

{ TfrmUsuarios }

procedure TfrmUsuarios.carregaDados;
begin
  inherited;

end;

procedure TfrmUsuarios.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  sSQL := 'SELECT * FROM usuarios WHERE suporte IS NULL';

  inherited;
end;

procedure TfrmUsuarios.BtnIncluirClick(Sender: TObject);
begin
  frmIncluirUsuario := TfrmIncluirUsuario.Create(self);
  inherited;
  frmIncluirUsuario.ShowModal;
  FreeAndNil(frmIncluirUsuario);
  mostraTodos;
end;

procedure TfrmUsuarios.GrdUsuariosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if State = [] then
  begin
    if cdsDados.RecNo mod 2 = 1 then
      GrdUsuarios.Canvas.Brush.Color := clMoneyGreen
    else
      GrdUsuarios.Canvas.Brush.Color := clWhite;
  end;
  GrdUsuarios.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmUsuarios.GrdUsuariosDblClick(Sender: TObject);
begin
  inherited;
  if telachamando <> 0 then
    begin
      if telaChamando = 1 then // consulta os
        begin

        end;

      Self.Close;
    end
  else
    BtnAlterarClick(self);
end;

procedure TfrmUsuarios.edtConsultaKeyPress(Sender: TObject; var Key: Char);
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
                  Add('SELECT * FROM usuarios WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
                end;

              // NOME
              if RdBtnNome.Checked then
                begin
                  Add('SELECT * FROM usuarios WHERE nome LIKE :nome');
                  ParamByName('nome').AsString := '%' + edtConsulta.Text + '%';
                end;

              // USUARIO
              if RdBtnUsuario.Checked then
                begin
                  Add('SELECT * FROM usuarios WHERE usuario LIKE :usuario');
                  ParamByName('usuario').AsString := '%' + edtConsulta.Text + '%';
                end;
              Open;
            end;
        end;
      cdsDados.Open;
      cdsDados.Refresh;

      GrdUsuarios.SetFocus;
    end;
end;

procedure TfrmUsuarios.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir o usuário '+cdsDados.FieldByName('nome').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if cdsDados.FieldByName('codigo').AsString <> trim('') then
        begin
          try
            with qryDados, SQL do
              begin
                Close;
                Clear;
                Add('DELETE FROM usuarios WHERE codigo = :cod');
                ParamByName('cod').AsInteger := cdsDados.FieldByName('codigo').AsInteger;
                ExecSQL();
              end;
          except
            MessageDlg('Erro ao excluir o usuário!',mtError,[mbOk],0);
          end;
        end;         
      mostraTodos;
    end;
end;

procedure TfrmUsuarios.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  frmIncluirUsuario := TfrmIncluirUsuario.Create(self);

  inherited;

  frmIncluirUsuario.ShowModal;
  FreeAndNil(frmIncluirUsuario);

  mostraTodos;
end;

procedure TfrmUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmUsuarios.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmUsuarios.GrdUsuariosKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
    if telaChamando > 0 then
      GrdUsuariosDblClick(self)
    else
      BtnAlterarClick(self);
end;

procedure TfrmUsuarios.BtnPermissoesClick(Sender: TObject);
begin
  inherited;
  try
    frmPermissoesUsuarios := TfrmPermissoesUsuarios.Create(self);
    frmPermissoesUsuarios.lblUsuario.Caption := cdsDados.FieldByname('nome').AsString;
    frmPermissoesUsuarios.ShowModal;
  finally
    FreeAndNil(frmPermissoesUsuarios);
  end;;
end;

procedure TfrmUsuarios.GrdUsuariosTitleClick(Column: TColumn);
begin
  inherited;
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraTodos;
end;

end.
