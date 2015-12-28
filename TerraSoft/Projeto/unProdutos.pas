unit unProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unConsultas, FMTBcd, Provider, DBClient, DB, SqlExpr, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, unFuncoes;

type
  TfrmProdutos = class(TfrmConsultas)
    Bevel1: TBevel;
    RdBtnCodigo: TRadioButton;
    RdBtnDescricao: TRadioButton;
    RdBtnReferencia: TRadioButton;
    GrdProdutos: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure GrdProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnAlterarClick(Sender: TObject);
    procedure GrdProdutosDblClick(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure GrdProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure GrdProdutosTitleClick(Column: TColumn);
  private
    loFuncoes: TFuncoes;
    procedure carregaDados; override;
  public
    telaChamando: integer;
  end;

var
  frmProdutos: TfrmProdutos;

implementation

uses unIncluirProduto, unPrincipal, unManutencoes, unIncluirCompra;

{$R *.dfm}

procedure TfrmProdutos.carregaDados;
begin
  inherited;
  with cdsDados do
    begin
      with frmIncluirProduto do
        begin
          edtCodigo.Text    := FieldByname('codigo').AsString;
          edtDescricao.Text := FieldByName('descricao').AsString;
          edtUnidade.Text   := FieldByName('unidade').AsString;
          mskDataCadastro.Text := FieldByName('datacadastro').AsString;
          edtReferencia.Text   := FieldByName('referencia').AsString;
          edtPrecoCusto.Text   := loFuncoes.TrataReal(FieldByName('precocusto').AsString);
          edtEstoqueInicial.Text := FieldByName('estoqueinicial').AsString;
          edtEstoque.Text        := FieldByName('estoque').AsString;
          mskUltimaCompra.Text   := FieldByName('ultimacompra').AsString;
        end;
    end;
end;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  sSQL := 'SELECT * FROM produtos';

  inherited;

  TNumericField(cdsDados.FieldByName('precocusto')).DisplayFormat := ',0.00;-,0.00';
end;

procedure TfrmProdutos.BtnIncluirClick(Sender: TObject);
begin
  inherited;
  frmIncluirProduto := TfrmIncluirProduto.Create(self);
  frmIncluirProduto.ShowModal;
  FreeAndNil(frmIncluirProduto);
  mostraTodos;
end;

procedure TfrmProdutos.GrdProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if State = [] then
  begin
    if cdsDados.RecNo mod 2 = 1 then
      GrdProdutos.Canvas.Brush.Color := clMoneyGreen
    else
      GrdProdutos.Canvas.Brush.Color := clWhite;
  end;
  GrdProdutos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmProdutos.BtnAlterarClick(Sender: TObject);
begin
  frmIncluirProduto := TfrmIncluirProduto.Create(self);

  inherited;

  frmIncluirProduto.ShowModal;
  FreeAndNil(frmIncluirProduto);

  mostraTodos;
end;

procedure TfrmProdutos.GrdProdutosDblClick(Sender: TObject);
begin
  inherited;
  if telaChamando <> 0 then
    begin
      if telaChamando = 1 then // manutencoes
        begin
          frmManutencoes.edtCodProduto.Text := cdsDados.FieldByName('codigo').AsString;
          frmManutencoes.edtProduto.Text    := cdsDados.FieldByName('descricao').AsString;
          frmManutencoes.edtCusto.Text      := cdsDados.FieldByName('precocusto').AsString;
        end;

      if telaChamando = 2 then // incluindo compra
        begin
          frmIncluirCompra.edtCodProduto.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirCompra.edtDescricaoProduto.Text := cdsDados.FieldByname('descricao').AsString;
        end;

      Self.Close;
    end
  else
    BtnAlterarClick(self);

end;

procedure TfrmProdutos.edtConsultaKeyPress(Sender: TObject; var Key: Char);
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
                  Add('SELECT * FROM produtos WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
                end;

              // DESCRICAO
              if RdBtnDescricao.Checked then
                begin
                  Add('SELECT * FROM produtos WHERE descricao LIKE :desc');
                  ParamByName('desc').AsString := '%' + edtConsulta.Text + '%';
                end;

              // REFERENCIA
              if RdBtnReferencia.Checked then
                begin
                  Add('SELECT * FROM produtos WHERE referencia LIKE :ref');
                  ParamByName('ref').AsString := '%' + edtConsulta.Text + '%';
                end;
              Open;
            end;
        end;
      cdsDados.Open;
      cdsDados.Refresh;

      GrdProdutos.SetFocus;      
    end;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmProdutos.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmProdutos.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir o produto '+cdsDados.FieldByName('descricao').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if cdsDados.FieldByName('codigo').AsString <> trim('') then
        begin
          try
            with qryDados, SQL do
              begin
                Close;
                Clear;
                Add('DELETE FROM produtos WHERE codigo = :cod');
                ParamByName('cod').AsInteger := cdsDados.FieldByName('codigo').AsInteger;
                ExecSQL();
              end;
          except
            MessageDlg('Erro ao excluir o produto!',mtError,[mbOk],0);
          end;
        end;

      mostraTodos;
    end;
end;

procedure TfrmProdutos.GrdProdutosKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
    if telaChamando > 0 then
      GrdProdutosDblClick(self)
    else
      BtnAlterarClick(self);
end;

procedure TfrmProdutos.GrdProdutosTitleClick(Column: TColumn);
begin
  inherited;
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraTodos;
end;

end.
