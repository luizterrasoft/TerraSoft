unit unRegioes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unConsultas, FMTBcd, Provider, DBClient, DB, SqlExpr, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids;

type
  TfrmRegioes = class(TfrmConsultas)
    RdBtnCodigo: TRadioButton;
    RdBtnDescricao: TRadioButton;
    Bevel1: TBevel;
    GrdRegioes: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnExcluirClick(Sender: TObject);
    procedure GrdRegioesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnAlterarClick(Sender: TObject);
    procedure GrdRegioesDblClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure GrdRegioesKeyPress(Sender: TObject; var Key: Char);
    procedure GrdRegioesTitleClick(Column: TColumn);
  private
    procedure carregaDados; override;
  public
    telaChamando: integer;
  end;

var
  frmRegioes: TfrmRegioes;

implementation

uses unIncluirCliente, unIncluirMunicipio, unIncluirRegioes, unPrincipal;

{$R *.dfm}

procedure TfrmRegioes.carregaDados;
begin
  inherited;
  with cdsDados do
    begin
      with frmIncluirRegioes do
        begin
          edtCodigo.Text    := FieldByName('codigo').AsString;
          edtDescricao.Text := FieldByName('descricao').AsString;
        end;
    end;
end;

procedure TfrmRegioes.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  sSQL := 'SELECT * FROM regioes';

  inherited;

end;

procedure TfrmRegioes.edtConsultaKeyPress(Sender: TObject; var Key: Char);
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
                  Add('SELECT * FROM regioes WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
                end;

              // DESCRICAO
              if RdBtnDescricao.Checked then
                begin
                  Add('SELECT * FROM regioes WHERE descricao LIKE :desc');
                  ParamByName('desc').AsString := '%' + edtConsulta.Text + '%';
                end;
              Open;
            end;
        end;
      cdsDados.Open;
      cdsDados.Refresh;


      GrdRegioes.SetFocus;      
    end;
end;

procedure TfrmRegioes.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir a região '+cdsDados.FieldByName('descricao').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if cdsDados.FieldByName('codigo').AsString <> trim('') then
        begin
          try
            with qryDados, SQL do
              begin
                Close;
                Clear;
                Add('DELETE FROM regioes WHERE codigo = :cod');
                ParamByName('cod').AsInteger := cdsDados.FieldByName('codigo').AsInteger;
                ExecSQL();
              end;
          except
            MessageDlg('Erro ao excluir a região!',mtError,[mbOk],0);
          end;
        end;

      mostraTodos;
    end;
end;

procedure TfrmRegioes.GrdRegioesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if State = [] then
  begin
    if cdsDados.RecNo mod 2 = 1 then
      GrdRegioes.Canvas.Brush.Color := clMoneyGreen
    else
      GrdRegioes.Canvas.Brush.Color := clWhite;
  end;
  GrdRegioes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmRegioes.BtnAlterarClick(Sender: TObject);
begin
  frmIncluirRegioes := TfrmIncluirRegioes.Create(self);

  inherited;

  frmIncluirRegioes.ShowModal;
  FreeAndNil(frmIncluirRegioes);

  mostraTodos;
end;

procedure TfrmRegioes.GrdRegioesDblClick(Sender: TObject);
begin
  inherited;
  if telaChamando <> 0 then
    begin
      if telaChamando = 1 then // clientes
        begin
          frmIncluirCliente.edtCodRegiao.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirCliente.lblRegiao.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      Self.Close;
    end
  else
    BtnAlterarClick(self);
end;

procedure TfrmRegioes.BtnIncluirClick(Sender: TObject);
begin
  inherited;
  frmIncluirRegioes := TfrmIncluirRegioes.Create(self);
  frmIncluirRegioes.ShowModal;
  FreeAndNil(frmIncluirRegioes);
  mostraTodos;
end;

procedure TfrmRegioes.GrdRegioesKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
    if telaChamando > 0 then
      GrdRegioesDblClick(self)
    else
      BtnAlterarClick(self);
end;

procedure TfrmRegioes.GrdRegioesTitleClick(Column: TColumn);
begin
  inherited;
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraTodos;
end;

end.
