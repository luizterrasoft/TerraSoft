unit unFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unConsultas, FMTBcd, Provider, DBClient, DB, SqlExpr, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, unFuncoes;

type
  TfrmFuncionarios = class(TfrmConsultas)
    GrdFuncionarios: TDBGrid;
    Bevel1: TBevel;
    RdBtnCodigo: TRadioButton;
    RdBtnNome: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure GrdFuncionariosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure GrdFuncionariosDblClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure GrdFuncionariosKeyPress(Sender: TObject; var Key: Char);
    procedure GrdFuncionariosTitleClick(Column: TColumn);
  private

    loFuncoes: TFuncoes;
    procedure carregaDados; override;
  public
    telaChamando: integer;
  end;

var
  frmFuncionarios: TfrmFuncionarios;

implementation

uses unIncluirFuncionario, unPrincipal, unIncluirEquipamento, unOS,
  unIncluirOS, unServicosRealizadosPorFuncionario, unIncluirAbastecimento,
  unAbastecimentos;

{$R *.dfm}

procedure TfrmFuncionarios.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  sSQL := 'SELECT * FROM funcionarios';

  inherited;

end;

procedure TfrmFuncionarios.BtnIncluirClick(Sender: TObject);
begin
  inherited;
  frmIncluirFuncionario := TfrmIncluirFuncionario.Create(self);
  frmIncluirFuncionario.ShowModal;
  FreeAndNil(frmIncluirFuncionario);
  mostraTodos;
end;

procedure TfrmFuncionarios.GrdFuncionariosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if State = [] then
  begin
    if cdsDados.RecNo mod 2 = 1 then
      GrdFuncionarios.Canvas.Brush.Color := clMoneyGreen
    else
      GrdFuncionarios.Canvas.Brush.Color := clWhite;
  end;
  GrdFuncionarios.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmFuncionarios.GrdFuncionariosDblClick(Sender: TObject);
begin
  inherited;
  if telaChamando <> 0 then
    begin
      if telaChamando = 1 then // equipamentos
        begin
          frmIncluirEquipamento.edtCodFuncionario.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirEquipamento.lblFuncionario.Caption := cdsDados.FieldByName('nome').AsString;
        end;

      if telaChamando = 2 then // consulta os
        begin
          frmOS.edtCodPessoa.Text     := cdsDados.FieldByName('codigo').AsString;
          frmOS.lblNomePessoa.Caption := cdsDados.FieldByName('nome').AsString;
        end;

      if telaChamando = 3 then // incluir os - funcionario   --- n�aaaao est�aa maaaiiiss seeendooo ussaaaadooo
        begin
          
        end;

      if telaChamando = 4 then // incluir os - vendedor
        begin
          frmIncluirOS.edtCodVendedor.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirOS.lblVendedor.Caption := cdsDados.FieldByName('nome').AsString;
        end;

      if telaChamando = 5 then // incluir servico - os
        begin
          frmIncluirOS.edtCodFuncITem.Text        := cdsDados.FieldByName('codigo').AsString;
          frmIncluirOS.lblFuncionarioItem.Caption := cdsDados.FieldByName('nome').AsString;
        end;

      if telaChamando = 6 then // relat�rio de servi�os realizados por funcion�rio
        begin
          frmServicosRealizadosPorFuncionario.edtCodFuncionario.Text := cdsDados.FieldByName('codigo').AsString;
          frmServicosRealizadosPorFuncionario.lblFuncionario.Caption := cdsDados.FieldByName('nome').AsString;
        end;

      if telaChamando = 7 then // incluir abastecimento
        begin
          frmIncluirAbastecimento.edtCodFuncionario.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirAbastecimento.lblFuncionario.Caption := cdsDados.FieldByName('nome').AsString;
        end;

      if telaChamando = 8  then // consulta abastecimentos
        begin
          frmAbastecimentos.edtCodFuncionario.Text := cdsDados.FieldByName('codigo').AsString;
          frmAbastecimentos.lblFuncionario.Caption := cdsDados.FieldByName('nome').AsString;
        end;

      Self.Close;
    end
  else
    BtnAlterarClick(self);
end;

procedure TfrmFuncionarios.BtnAlterarClick(Sender: TObject);
begin
  frmIncluirFuncionario := TfrmIncluirFuncionario.Create(self);

  inherited;

  frmIncluirFuncionario.ShowModal;
  FreeAndNil(frmIncluirFuncionario);

  mostraTodos;
end;

procedure TfrmFuncionarios.edtConsultaKeyPress(Sender: TObject;
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
                  Add('SELECT * FROM funcionarios WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
                end;

              // NOME
              if RdBtnNome.Checked then
                begin
                  Add('SELECT * FROM funcionarios WHERE nome LIKE :nome');
                  ParamByName('nome').AsString := '%' + edtConsulta.Text + '%';
                end;

              Open;
            end;
        end;
      cdsDados.Open;
      cdsDados.Refresh;

      GrdFuncionarios.SetFocus;         
    end;
end;

procedure TfrmFuncionarios.carregaDados;
begin
  inherited;
  with cdsDados do
    begin
      with frmIncluirFuncionario do
        begin
          edtCodigo.Text := FieldByName('codigo').AsString;
          edtNome.Text := FieldByName('nome').AsString;
          mskDataCadastro.Text := FieldByName('datacadastro').AsString;
          mskCPF.Text := FieldByName('cpf').AsString;
          edtRG.Text := FieldByName('rg').AsString;
          edtComissao.Text := loFuncoes.TrataReal(FieldByName('comissaovenda').AsString);
          edtEndereco.Text := FieldByName('endereco').AsString;
          edtNumero.Text := FieldByName('numero').AsString;
          edtBairro.Text := FieldByName('bairro').AsString;

          edtCodMunicipio.Text := FieldByName('codmunicipio').AsString;
          lblMunicipio.Caption := loFuncoes.BuscaFk(edtCodMunicipio.Text,'municipios','nome');
          mskCEP.Text := loFuncoes.BuscaFk(edtCodMunicipio.Text,'municipios','cep');

          mskFone1.Text := FieldByName('fone1').AsString;
          mskCelular.Text := FieldByName('celular').AsString;
          mskFone2.Text := FieldByName('fone2').AsString;

          edtCodUsuario.Text := FieldByName('codusuario').AsString;
          lblUsuario.Caption := loFuncoes.BuscaFk(edtCodUsuario.Text,'usuarios','nome');          
        end;
    end;
end;

procedure TfrmFuncionarios.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmFuncionarios.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmFuncionarios.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir o funcion�rio '+cdsDados.FieldByName('nome').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if cdsDados.FieldByName('codigo').AsString <> trim('') then
        begin
          try
            with qryDados, SQL do
              begin
                Close;
                Clear;
                Add('DELETE FROM funcionarios WHERE codigo = :cod');
                ParamByName('cod').AsInteger := cdsDados.FieldByName('codigo').AsInteger;
                ExecSQL();
              end;
          except
            MessageDlg('Erro ao excluir o funcion�rio!',mtError,[mbOk],0);
          end;
        end;

      mostraTodos;
    end;
end;

procedure TfrmFuncionarios.GrdFuncionariosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
    if telaChamando > 0 then
      GrdFuncionariosDblClick(self)
    else
      BtnAlterarClick(self);
end;

procedure TfrmFuncionarios.GrdFuncionariosTitleClick(Column: TColumn);
begin
  inherited;
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraTodos;
end;

end.
