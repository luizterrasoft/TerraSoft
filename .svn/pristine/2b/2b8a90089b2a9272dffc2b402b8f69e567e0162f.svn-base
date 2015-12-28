unit UnClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unConsultas, FMTBcd, Provider, DBClient, DB, SqlExpr, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, unFUncoes;

type
  TfrmClientes = class(TfrmConsultas)
    GrdClientes: TDBGrid;
    RdBtnCodigo: TRadioButton;
    RdBtnNome: TRadioButton;
    RdBtnApelido: TRadioButton;
    Bevel1: TBevel;
    BtnCreditos: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure GrdClientesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdClientesDblClick(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure GrdClientesKeyPress(Sender: TObject; var Key: Char);
    procedure GrdClientesTitleClick(Column: TColumn);
    procedure BtnCreditosClick(Sender: TObject);
  private

    loFuncoes: TFuncoes;
    procedure carregaDados; override;
  public
    telachamando: integer;
  end;

var
  frmClientes: TfrmClientes;

implementation

uses unIncluirCliente, unPrincipal, unOS, unIncluirOS,
  unIncluirContasReceber, unContasReceber, unCreditosCliente;

{$R *.dfm}

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  sSQL := 'SELECT * FROM clientes ORDER BY '+frmPrincipal.sCampo;

  inherited;

end;

procedure TfrmClientes.BtnIncluirClick(Sender: TObject);
begin
  if not(loFuncoes.Permissao(1,1,false)) then
    Exit;

  frmIncluirCliente := TfrmIncluirCliente.Create(self);
  inherited;
  frmIncluirCliente.ShowModal;
  FreeAndNil(frmIncluirCliente);
  mostraTodos;
end;

procedure TfrmClientes.GrdClientesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if State = [] then
  begin
    if cdsDados.RecNo mod 2 = 1 then
      GrdClientes.Canvas.Brush.Color := clMoneyGreen
    else
      GrdClientes.Canvas.Brush.Color := clWhite;
  end;
  GrdClientes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmClientes.GrdClientesDblClick(Sender: TObject);
begin
  inherited;
  if telaChamando <> 0 then
    begin
      if telaChamando = 1 then // consulta os
        begin
          frmOS.edtCodPessoa.Text     := cdsDados.FieldByName('codigo').AsString;
          frmOS.lblNomePessoa.Caption := cdsDados.FieldByName('nome').AsString;
        end;

      if telaChamando = 2 then // incluir os
        begin
          frmIncluirOS.edtCodCliente.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirOS.lblCliente.Caption := cdsDados.FieldByname('nome').AsString;
        end;

      if telaChamando = 3 then // incluir contas receber
        begin
          frmIncluirContasReceber.edtCodCliente.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirContasReceber.lblCliente.Caption := cdsDados.FieldByName('nome').AsString;
        end;

      if telaChamando = 4 then // consulta contas receber
        begin
          frmContasReceber.edtCodCLiente.Text := cdsDados.FieldByName('codigo').AsString;
          frmContasReceber.lblCliente.Caption := cdsDados.FieldByName('nome').AsString;
        end;

      Self.Close;
    end
  else
    BtnAlterarClick(self);
    
end;

procedure TfrmClientes.edtConsultaKeyPress(Sender: TObject; var Key: Char);
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
                  Add('SELECT * FROM clientes WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
                end;

              // NOME
              if RdBtnNome.Checked then
                begin
                  Add('SELECT * FROM clientes WHERE nome LIKE :nome');
                  ParamByName('nome').AsString := '%' + edtConsulta.Text + '%';
                end;

              // APELIDO
              if RdBtnApelido.Checked then
                begin
                  Add('SELECT * FROM clientes WHERE apelido LIKE :apelido');
                  ParamByName('apelido').AsString := '%' + edtConsulta.Text + '%';
                end;

                Add('ORDER BY '+ frmPrincipal.sCampo);
              Open;
            end;
        end;
      cdsDados.Open;
      cdsDados.Refresh;

      GrdClientes.SetFocus;
    end;          
end;

procedure TfrmClientes.carregaDados;
begin
  inherited;
  with cdsDados do
    begin
      with frmIncluirCliente do
        begin
          edtCodigo.Text := FieldByName('codigo').AsString;
          edtNome.Text   := FieldByName('nome').AsString;
          mskDataCad.Text:= FieldByName('datacadastro').AsString;

          if FieldByName('situacao').AsString = 'A' then
            CbxSituacao.ItemIndex := 0
          else
            CbxSituacao.ItemIndex := 1;

          edtApelido.Text := FieldByName('apelido').AsString;

          if FieldByName('tipopessoa').AsString = 'F' then
            CbxTipoPessoa.ItemIndex := 0
          else
            CbxTipoPessoa.ItemIndex := 1;

          TipoPessoa;

          mskCPF.Text := FieldByName('cpf').AsString;
          edtRG.Text  := FieldByName('rg').AsString;
          edtEndereco.Text := FieldByName('endereco').AsString;
          edtBairro.Text   := FieldByName('bairro').AsString;
          edtNumero.Text   := FIeldByName('numero').AsString;
          edtCodMunicipio.Text := FieldByName('codmunicipio').AsString;

          lblMunicipio.Caption := loFuncoes.BuscaFk(edtCodMunicipio.Text,'municipios','nome');

          edtCodRegiao.Text := FieldByName('codregiao').AsString;
          lblRegiao.Caption := loFuncoes.BuscaFk(edtCodRegiao.Text,'regioes','descricao');

          mskFone1.Text         := FieldByName('fone1').AsString;
          mskFone2.Text         := FieldByName('fone2').AsString;
          mskCelular.Text       := FieldByName('celular').AsString;
          edtLimiteCredito.Text := loFuncoes.TrataReal(FieldByName('limitecredito').AsString);

          // puchar ultima aquisicao no futuro
          edtCodUsuario.Text := FieldByName('codusuario').AsString;
          lblUsuario.Caption := loFuncoes.BuscaFk(edtCodUsuario.Text,'usuarios','nome'); 
        end;
    end;
end;

procedure TfrmClientes.BtnAlterarClick(Sender: TObject);
begin
  frmIncluirCliente := TfrmIncluirCliente.Create(self);

  inherited;

  frmIncluirCliente.ShowModal;
  FreeAndNil(frmIncluirCliente);

  mostraTodos;

end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmClientes.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmClientes.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir o cliente '+cdsDados.FieldByName('nome').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if cdsDados.FieldByName('codigo').AsString <> trim('') then
        begin
          try
            with qryDados, SQL do
              begin
                Close;
                Clear;
                Add('DELETE FROM clientes WHERE codigo = :cod');
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

procedure TfrmClientes.GrdClientesKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
    if telachamando > 0 then
      GrdClientesDblClick(self)
    else
      BtnAlterarClick(self);
end;

procedure TfrmClientes.GrdClientesTitleClick(Column: TColumn);
begin
  inherited;
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  sSQL := 'SELECT * FROM clientes ORDER BY '+frmPrincipal.sCampo;
  mostraTodos;
end;

procedure TfrmClientes.BtnCreditosClick(Sender: TObject);
begin
  inherited;
  try
    frmCreditosCliente := TfrmCreditosCliente.Create(self);
    frmCreditosCliente.lblCliente.Caption := cdsDados.FieldByName('nome').AsString;
    frmCreditosCliente.iCodCliente := cdsDados.FieldByName('codigo').AsInteger;
    frmCreditosCliente.ShowModal;
  finally
    FreeAndNil(frmCreditosCliente);
  end;
end;

end.
