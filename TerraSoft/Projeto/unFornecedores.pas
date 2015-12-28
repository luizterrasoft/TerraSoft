unit unFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unConsultas, FMTBcd, Provider, DBClient, DB, SqlExpr, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, unFuncoes;

type
  TfrmFornecedores = class(TfrmConsultas)
    Bevel1: TBevel;
    RdBtnCodigo: TRadioButton;
    RdBtnRazao: TRadioButton;
    RdBtnFantasia: TRadioButton;
    GrdFornecedores: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure GrdFornecedoresDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BtnAlterarClick(Sender: TObject);
    procedure GrdFornecedoresDblClick(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnRelatoriosClick(Sender: TObject);
    procedure GrdFornecedoresKeyPress(Sender: TObject; var Key: Char);
    procedure GrdFornecedoresTitleClick(Column: TColumn);
  private

    loFuncoes: TFuncoes;
    procedure carregaDados; override;
  public
  
    telaChamando: integer;
  end;

var
  frmFornecedores: TfrmFornecedores;

implementation

uses unPrincipal, unIncluirFornecedor, unManutencoes, unContasPagar,
  unIncluirContasPagar, unSelecaoRelFornecedores, unLavacoes,
  unIncluirLavacao, unConsultaManutencoes, unIncluirEquipamento,
  unIncluirAbastecimento, unAbastecimentos, unCompras, unIncluirCompra;

{$R *.dfm}

{ TfrmFornecedores }

procedure TfrmFornecedores.carregaDados;
begin
  inherited;
  with cdsDados do
    begin
      with frmIncluirFornecedor do
        begin
          edtCodigo.Text        := FieldByName('codigo').AsString;
          edtRazaoSocial.Text   := FieldByName('razaosocial').AsString;
          mskDataCadastro.Text  := FieldByName('datacadastro').AsString;
          edtFantasia.Text      := FieldByName('fantasia').AsString;

          if FieldByName('tipopessoa').AsString = 'J' then
            CbxTipoPessoa.ItemIndex := 0
          else
            CbxTipoPessoa.ItemIndex := 1;

          edtIE.Text        := FieldByName('ie').AsString;
          mskCNPJ.Text      := FieldByName('cnpj').AsString;
          edtEndereco.Text  := FieldBYName('endereco').AsString;
          edtBairro.Text := FieldByName('bairro').AsString;
          edtNumero.Text := FieldByName('numero').AsString;

          edtCodMunicipio.Text := FieldByName('codmunicipio').AsString;
          lblMunicipio.Caption := loFuncoes.BuscaFk(edtCodMunicipio.Text,'municipios','nome');

          edtCodUsuario.Text := FieldByName('codusuario').AsString;
          lblUsuario.Caption := loFuncoes.BuscaFk(edtCodUsuario.Text,'usuarios','nome');

          edtRepresentante.Text := FieldByName('representante').AsString;
          mskFone1.Text         := FieldByName('fone1').AsString;
          mskFone2.Text         := FieldByName('fone2').AsString;
          mskCelular.Text       := FieldByName('celular').AsString;
          mskUltimaCompra.Text  := FieldByName('ultimacompra').AsString;
        end;
    end;
end;

procedure TfrmFornecedores.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  sSQL := 'SELECT * FROM fornecedores';

  inherited;

end;

procedure TfrmFornecedores.GrdFornecedoresDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if State = [] then
  begin
    if cdsDados.RecNo mod 2 = 1 then
      GrdFornecedores.Canvas.Brush.Color := clMoneyGreen
    else
      GrdFornecedores.Canvas.Brush.Color := clWhite;
  end;
  GrdFornecedores.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmFornecedores.BtnAlterarClick(Sender: TObject);
begin
  frmIncluirFornecedor := TfrmIncluirFornecedor.Create(self);

  inherited;

  frmIncluirFornecedor.ShowModal;
  FreeAndNil(frmIncluirFornecedor);

  mostraTodos;
end;

procedure TfrmFornecedores.GrdFornecedoresDblClick(Sender: TObject);
begin
  inherited;
  if telaChamando <> 0 then
    begin
      if telaChamando = 1 then // lancar manutencoes
        begin
          frmManutencoes.edtCodFornecedor.Text      := cdsDados.FieldByName('codigo').AsString;
          frmManutencoes.lblFornecedor.Caption      := cdsDados.FieldByName('razaosocial').AsString;
        end;

      if telaChamando =  2 then // consulta contas pagar
        begin
          frmContasPagar.edtCodFornecedor.Text := cdsDados.FieldByName('codigo').AsString;
          frmContasPagar.lblFornecedor.Caption := cdsDados.FieldByName('razaosocial').AsString;
        end;

      if telaChamando = 3 then // inclusao contas pagar
        begin
          frmIncluirContasPagar.edtCodFornecedor.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirContasPagar.lblFornecedor.Caption := cdsDados.FieldByName('razaosocial').AsString;
        end;

      if telaChamando = 4 then // ficha cadastral - relatorios
        begin
          frmSelecaoRelFornecedores.edtCodFornecedor.Text := cdsDados.FieldByName('codigo').AsString;
          frmSelecaoRelFornecedores.lblFornecedor.Caption := cdsDados.FieldByName('razaosocial').AsString;
        end;

      if telaChamando = 5 then // lavacoes - consulta
        begin
          frmLavacoes.edtCodigo.Text        := cdsDados.FieldByName('codigo').AsString;
          frmLavacoes.lblResultado.Caption  := cdsDados.FieldBYname('razaosocial').AsString;
        end;

      if telaChamando = 6 then // lavacoes - incluscao
        begin
          frmIncluirLavacao.edtCodFornecedor.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirLavacao.lblFornecedor.Caption := cdsDados.FieldByName('razaosocial').AsString;
        end;

      if telaChamando = 7 then // consulta manutencoes
        begin
          frmConsultaManutencoes.edtCodEquipamento.Text := cdsDados.FieldByName('codigo').AsString;
          frmConsultaManutencoes.lblEquipamento.Caption := cdsDados.FieldByName('razaosocial').AsString;
        end;

      if telaChamando = 8 then // proprietario - inclusao equipamento
        begin
          frmIncluirEquipamento.edtCodProprietario.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirEquipamento.lblProprietario.Caption := cdsDados.FieldByName('razaosocial').AsString;
        end;

      if telaChamando = 9 then // incluir abastecimento
        begin
          frmIncluirAbastecimento.edtCodFornecedor.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirAbastecimento.lblFornecedor.Caption := cdsDados.FieldByName('razaosocial').AsString;
        end;

      if telaChamando = 10 then // consulta abastecimento
        begin
          frmAbastecimentos.edtCodFornecedor.Text := cdsDados.FieldByName('codigo').AsString;
          frmAbastecimentos.lblFornecedor.Caption := cdsDados.FieldByName('razaosocial').AsString;
        end;

      if telaChamando = 11 then // consulta compras
        begin
          frmCompras.edtCodFornecedor.Text := cdsDados.FieldByName('codigo').AsString;
          frmCompras.lblFornecedor.Caption := cdsDados.FieldByName('razaosocial').AsString;
        end;

      if telaChamando = 12 then // incluindo compra
        begin
          frmIncluirCompra.edtCodFornecedor.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirCompra.lblFornecedor.Caption := cdsDados.FieldByName('razaosocial').AsString;
        end;

      Self.Close;
    end
  else
    BtnAlterarClick(self);
end;

procedure TfrmFornecedores.edtConsultaKeyPress(Sender: TObject;
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
                  Add('SELECT * FROM fornecedores WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
                end;

              // NOME
              if RdBtnRazao.Checked then
                begin
                  Add('SELECT * FROM fornecedores WHERE razaosocial LIKE :razao');
                  ParamByName('razao').AsString := '%' + edtConsulta.Text + '%';
                end;

              // APELIDO
              if RdBtnFantasia.Checked then
                begin
                  Add('SELECT * FROM fornecedores WHERE fantasia LIKE :fanta');
                  ParamByName('fanta').AsString := '%' + edtConsulta.Text + '%';
                end;
              Open;
            end;
        end;
      cdsDados.Open;
      cdsDados.Refresh;

      GrdFornecedores.SetFocus;
    end;
end;

procedure TfrmFornecedores.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir o fornecedor '+cdsDados.FieldByName('razaosocial').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if cdsDados.FieldByName('codigo').AsString <> trim('') then
        begin
          try
            with qryDados, SQL do
              begin
                Close;
                Clear;
                Add('DELETE FROM fornecedores WHERE codigo = :cod');
                ParamByName('cod').AsInteger := cdsDados.FieldByName('codigo').AsInteger;
                ExecSQL();
              end;
          except
            MessageDlg('Erro ao excluir o cliente!',mtError,[mbOk],0);
          end;
        end;

      mostraTodos;
    end;
end;

procedure TfrmFornecedores.BtnIncluirClick(Sender: TObject);
begin
  inherited;
  frmIncluirFornecedor := TfrmIncluirFornecedor.Create(self);
  frmIncluirFornecedor.ShowModal;
  FreeAndNil(frmIncluirFornecedor);
  mostraTodos;
end;

procedure TfrmFornecedores.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmFornecedores.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmFornecedores.BtnRelatoriosClick(Sender: TObject);
begin
  inherited;
  frmSelecaoRelFornecedores := TfrmSelecaoRelFornecedores.Create(self);
  frmSelecaoRelFornecedores.ShowModal;
  FreeAndNil(frmSelecaoRelFornecedores);
end;

procedure TfrmFornecedores.GrdFornecedoresKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
    if telaChamando > 0 then
      GrdFornecedoresDblClick(self)
    else
      BtnAlterarClick(self);
end;

procedure TfrmFornecedores.GrdFornecedoresTitleClick(Column: TColumn);
begin
  inherited;
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraTodos;
end;

end.