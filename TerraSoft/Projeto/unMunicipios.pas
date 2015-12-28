unit unMunicipios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unConsultas, FMTBcd, Provider, DBClient, DB, SqlExpr, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids;

type
  TfrmMunicipios = class(TfrmConsultas)
    RdBtnCodigo: TRadioButton;
    RdBtnNome: TRadioButton;
    RdBtnCEP: TRadioButton;
    Bevel1: TBevel;
    GrdMunicipios: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure GrdMunicipiosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure GrdMunicipiosDblClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure GrdMunicipiosKeyPress(Sender: TObject; var Key: Char);
    procedure GrdMunicipiosTitleClick(Column: TColumn);
  private

    procedure carregaDados; override;
  public
    telaChamando: integer;
  end;

var
  frmMunicipios: TfrmMunicipios;

implementation

uses unPrincipal, Math, unIncluirCliente, unIncluirMunicipio,
  unIncluirFornecedor, unIncluirFuncionario, unIncluirEmpresa;

{$R *.dfm}

procedure TfrmMunicipios.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  sSQL := 'SELECT * FROM municipios';

  inherited;

end;

procedure TfrmMunicipios.GrdMunicipiosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if State = [] then
  begin
    if cdsDados.RecNo mod 2 = 1 then
      GrdMunicipios.Canvas.Brush.Color := clMoneyGreen
    else
      GrdMunicipios.Canvas.Brush.Color := clWhite;
  end;
  GrdMunicipios.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmMunicipios.edtConsultaKeyPress(Sender: TObject;
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
                  Add('SELECT * FROM municipios WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
                end;

              // NOME
              if RdBtnNome.Checked then
                begin
                  Add('SELECT * FROM municipios WHERE nome LIKE :nome');
                  ParamByName('nome').AsString := '%' + edtConsulta.Text + '%';
                end;

              // CEP
              if RdBtnCEP.Checked then
                begin
                  Add('SELECT * FROM municipios WHERE cep LIKE :cep');
                  ParamByName('cep').AsString := '%' + edtConsulta.Text + '%';
                end;
              Open;
            end;
        end;
      cdsDados.Open;
      cdsDados.Refresh;

      GrdMunicipios.SetFocus;
      
    end;
end;

procedure TfrmMunicipios.GrdMunicipiosDblClick(Sender: TObject);
begin
  inherited;
  if telaChamando <> 0 then
    begin
      if telaChamando = 1 then // clientes
        begin
          frmIncluirCliente.edtCodMunicipio.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirCliente.lblMunicipio.Caption := cdsDados.FieldByName('nome').AsString;
        end;

      if telaChamando = 2 then // fornecedores
        begin
          frmIncluirFornecedor.edtCodMunicipio.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirFornecedor.lblMunicipio.Caption := cdsDados.FieldByName('nome').AsString;
        end;

      if telaChamando = 3 then // funcionarios
        begin
          frmIncluirFuncionario.edtCodMunicipio.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirFuncionario.lblMunicipio.Caption := cdsDados.FieldByName('nome').AsString;
        end;

      if telaChamando = 4 then // empresas
        begin
          frmIncluirEmpresa.edtCodMunicipio.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirEmpresa.lblMunicipio.Caption := cdsDados.FieldByName('nome').AsString;
        end;

      Self.Close;
    end
  else
    BtnAlterarClick(self);
end;

procedure TfrmMunicipios.BtnIncluirClick(Sender: TObject);
begin
  inherited;
  frmIncluirMunicipio := TfrmIncluirMunicipio.Create(self);
  frmIncluirMunicipio.ShowModal;
  FreeAndNil(frmIncluirMunicipio);
  mostraTodos;
end;

procedure TfrmMunicipios.carregaDados;
begin
  inherited;
  with cdsDados do
    begin
      with frmIncluirMunicipio do
        begin
          edtCodigo.Text := FieldByName('codigo').AsString;
          edtNome.Text   := FieldByName('nome').AsString;
          CbxUF.Text     := FieldByName('uf').AsString;

          if FieldByName('cepunico').AsString = 'S' then
            ChBxCEPUnico.Checked := True
          else
            ChBxCEPUnico.Checked := False;

          mskCEP.Text := FieldByName('cep').AsString;
          edtCodMunicipio.Text := FieldByName('codmunicipio').AsString;
          edtCodIBGE.Text      := FieldByName('codibge').AsString;
        end;
    end;
end;

procedure TfrmMunicipios.BtnAlterarClick(Sender: TObject);
begin
  frmIncluirMunicipio := TfrmIncluirMunicipio.Create(self);

  inherited;

  frmIncluirMunicipio.ShowModal;
  FreeAndNil(frmIncluirMunicipio);

  mostraTodos;
end;

procedure TfrmMunicipios.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir o município '+cdsDados.FieldByName('nome').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if cdsDados.FieldByName('codigo').AsString <> trim('') then
        begin
          try
            with qryDados, SQL do
              begin
                Close;
                Clear;
                Add('DELETE FROM municipios WHERE codigo = :cod');
                ParamByName('cod').AsInteger := cdsDados.FieldByName('codigo').AsInteger;
                ExecSQL();
              end;
          except
            MessageDlg('Erro ao excluir o município!',mtError,[mbOk],0);
          end;
        end;

      mostraTodos;
    end;
end;

procedure TfrmMunicipios.GrdMunicipiosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
    if telaChamando > 0 then
      GrdMunicipiosDblClick(self)
    else
      BtnAlterarClick(self);
end;

procedure TfrmMunicipios.GrdMunicipiosTitleClick(Column: TColumn);
begin
  inherited;
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraTodos;
end;

end.
