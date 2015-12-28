unit unIncluirEquipamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls, Mask, unFuncoes;

type
  TfrmIncluirEquipamento = class(TfrmCadastros)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblFuncionario: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtMarca: TEdit;
    edtModelo: TEdit;
    edtCor: TEdit;
    edtQtdHoras: TEdit;
    edtCodFuncionario: TEdit;
    mskDataCompra: TMaskEdit;
    BtnBuscaFuncionario: TBitBtn;
    Label9: TLabel;
    CbxStatus: TComboBox;
    Label10: TLabel;
    CbxCalculo: TComboBox;
    lblPlaca: TLabel;
    edtPlaca: TEdit;
    Label11: TLabel;
    CbxPropriedade: TComboBox;
    Label12: TLabel;
    edtAnoFabricacao: TEdit;
    Label13: TLabel;
    edtCodProprietario: TEdit;
    BtnBuscaProprietario: TBitBtn;
    lblProprietario: TLabel;
    Label14: TLabel;
    edtValorAquisicao: TEdit;
    Label15: TLabel;
    edtValorServico: TEdit;
    Label16: TLabel;
    edtConsHora: TEdit;
    procedure edtCodFuncionarioExit(Sender: TObject);
    procedure edtCodFuncionarioEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnBuscaFuncionarioClick(Sender: TObject);
    procedure edtCodProprietarioExit(Sender: TObject);
    procedure edtCodProprietarioEnter(Sender: TObject);
    procedure edtValorAquisicaoExit(Sender: TObject);
    procedure edtValorServicoExit(Sender: TObject);
    procedure edtConsHoraExit(Sender: TObject);
    procedure BtnBuscaProprietarioClick(Sender: TObject);
  private
    loFuncoes: TFuncoes;

  public
    procedure limpa; override;
    procedure incluir; override;
    procedure alterar; override;
  end;

var
  frmIncluirEquipamento: TfrmIncluirEquipamento;

implementation

uses unEquipamentos, unFuncionarios, unFornecedores;

{$R *.dfm}

{ TfrmIncluirEquipamento }

procedure TfrmIncluirEquipamento.alterar;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE equipamentos SET descricao=:desc,marca=:mar,modelo=:mode,');
      Add('cor=:cor,placa=:placa');

      if (edtValorAquisicao.Text <> ('0.00')) and (edtValorAquisicao.Text <> ('0,00'))
      and (edtValorAquisicao.Text <> ('0')) and (edtValorAquisicao.Text <> trim('')) then
        Add(',valoraquisicao=:vlraq');

      if (edtValorServico.Text <> ('0.00')) and (edtValorServico.Text <> ('0,00'))
      and (edtValorServico.Text <> ('0')) and (edtValorServico.Text <> trim('')) then
        Add(',valorhorakm=:vlrhk');

      if (edtConsHora.Text <> ('0.00')) and (edtConsHora.Text <> ('0,00'))
      and (edtConsHora.Text <> ('0')) and (edtConsHora.Text <> trim('')) then
        Add(',consumohorakm=:conshk');

      if (mskDataCompra.Text <> '  /  /    ') then
        Add(',datacompra=:dtcom');

      if (edtCodFuncionario.Text <> trim('')) and (edtCodFuncionario.Text <> trim('0')) then
        Add(',codfuncionario=:cFun');

      if (CbxStatus.ItemIndex <> 0) then
        Add(',status=:sta');

      if (CbxCalculo.ItemIndex <> 0) then
        Add(',tipocalculo=:tc');

      if (CbxPropriedade.ItemIndex <> 0) then
        Add(',propriedade=:prop');

      if (edtCodFuncionario.Text <> trim('')) and (edtCodFuncionario.Text <> trim('0')) then
        Add(',codproprietario=:cProp');

      if (edtAnoFabricacao.Text <> '') and (edtAnoFabricacao.Text <> '0') then
        Add(',anofabricacao=:ano');

      Add('WHERE codigo = :cod');

      ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
      ParamByName('desc').AsString := edtDescricao.Text;
      ParamByName('mar').AsString  := edtMarca.Text;
      ParamByName('mode').AsString := edtModelo.Text;

      if (mskDataCompra.Text <> '  /  /    ') then
        ParamByName('dtcom').AsDate  := StrToDate(mskDataCompra.Text);

      if (edtCodFuncionario.Text <> trim('')) and (edtCodFuncionario.Text <> trim('0')) then
        ParamByName('cFun').AsInteger := StrToInt(edtCodFuncionario.Text);

      if (CbxStatus.ItemIndex <> 0) then
        ParamByName('sta').AsInteger := CbxStatus.ItemIndex;

      if (CbxCalculo.ItemIndex <> 0) then
        ParamByName('tc').AsInteger := CbxCalculo.ItemIndex;

      if (CbxPropriedade.ItemIndex <> 0) then
        ParamByName('prop').AsInteger := CbxPropriedade.ItemIndex;

      if (edtCodFuncionario.Text <> trim('')) and (edtCodFuncionario.Text <> trim('0')) then
        ParamByName('cProp').AsInteger := StrToInt(edtCodProprietario.Text);

      if (edtAnoFabricacao.Text <> trim('')) and (edtAnoFabricacao.Text <> trim('0')) then
        ParamByName('ano').AsInteger := StrToInt(edtAnoFabricacao.Text);

      if (edtValorAquisicao.Text <> ('0.00')) and (edtValorAquisicao.Text <> ('0,00'))
      and (edtValorAquisicao.Text <> ('0')) and (edtValorAquisicao.Text <> trim('')) then
        ParamByName('vlrAq').AsFloat := StrToFloat(edtValorAquisicao.Text);

      if (edtValorServico.Text <> ('0.00')) and (edtValorServico.Text <> ('0,00'))
      and (edtValorServico.Text <> ('0')) and (edtValorServico.Text <> trim('')) then
        ParamByName('vlrhk').AsFloat := StrToFloat(edtValorServico.Text);

      if (edtConsHora.Text <> ('0.00')) and (edtConsHora.Text <> ('0,00'))
      and (edtConsHora.Text <> ('0')) and (edtConsHora.Text <> trim('')) then
        ParamByName('conshk').AsFloat := StrToFloat(edtConsHora.Text);

      ParamByName('cor').AsString  := edtCor.Text;
      ParamByName('placa').AsString := edtPlaca.Text;
      ExecSQL();
    end;
end;

procedure TfrmIncluirEquipamento.incluir;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('INSERT INTO equipamentos(descricao,marca,modelo,cor,status,placa');

      if (edtQtdHoras.Text <> ('0.00')) and (edtQtdHoras.Text <> ('0,00'))
      and (edtQtdHoras.Text <> ('0')) and (edtQtdHoras.Text <> trim('')) then
        Add(',qtdhoras');

      if (edtValorAquisicao.Text <> ('0.00')) and (edtValorAquisicao.Text <> ('0,00'))
      and (edtValorAquisicao.Text <> ('0')) and (edtValorAquisicao.Text <> trim('')) then
        Add(',valoraquisicao');

      if (edtValorServico.Text <> ('0.00')) and (edtValorServico.Text <> ('0,00'))
      and (edtValorServico.Text <> ('0')) and (edtValorServico.Text <> trim('')) then
        Add(',valorhorakm');

      if (edtConsHora.Text <> ('0.00')) and (edtConsHora.Text <> ('0,00'))
      and (edtConsHora.Text <> ('0')) and (edtConsHora.Text <> trim('')) then
        Add(',consumohorakm');

      if mskDataCompra.Text <> '  /  /    ' then
        Add(',datacompra');

      if (edtCodFuncionario.Text <> trim('')) and (edtCodFuncionario.Text <> trim('0')) then
        Add(',codfuncionario');

      if (CbxCalculo.ItemIndex <> 0) then
        Add(',tipocalculo');

      if (CbxPropriedade.ItemIndex <> 0) then
        Add(',propriedade');

      if (edtCodProprietario.Text <> trim('')) then
        Add(',codproprietario');

      if (edtAnoFabricacao.Text <> trim('')) then
        Add(',anofabricacao');

      Add(')');

      Add('VALUES (:desc,:marc,:mode,:cor,:status,:placa');

      if (edtQtdHoras.Text <> ('0.00')) and (edtQtdHoras.Text <> ('0,00'))
      and (edtQtdHoras.Text <> ('0')) and (edtQtdHoras.Text <> trim('')) then
        Add(',:qtdh');

      if (edtValorAquisicao.Text <> ('0.00')) and (edtValorAquisicao.Text <> ('0,00'))
      and (edtValorAquisicao.Text <> ('0')) and (edtValorAquisicao.Text <> trim('')) then
        Add(',:vlraq');

      if (edtValorServico.Text <> ('0.00')) and (edtValorServico.Text <> ('0,00'))
      and (edtValorServico.Text <> ('0')) and (edtValorServico.Text <> trim('')) then
        Add(',:vlrhk');

      if (edtConsHora.Text <> ('0.00')) and (edtConsHora.Text <> ('0,00'))
      and (edtConsHora.Text <> ('0')) and (edtConsHora.Text <> trim('')) then
        Add(',:conshk');

      if mskDataCompra.Text <> '  /  /    ' then
        Add(',:dtco');

      if (edtCodFuncionario.Text <> trim('')) and (edtCodFuncionario.Text <> trim('0')) then
        Add(',:codf');

      if (CbxCalculo.ItemIndex <> 0) then
        Add(',:tc');

      if (CbxPropriedade.ItemIndex <> 0) then
        Add(',:prop');

      if (edtCodProprietario.Text <> trim('')) then
        Add(',:cprop');

      if (edtAnoFabricacao.Text <> trim('')) then
        Add(',:afab');                

      Add(')');

      ParamByName('desc').AsString := edtDescricao.Text;
      ParamByName('marc').AsString := edtMarca.Text;
      ParamByName('mode').AsString := edtModelo.Text;

      if mskDataCompra.Text <> '  /  /    ' then
        ParamByName('dtco').AsDate   := StrToDate(mskDataCompra.Text);

      ParamByName('cor').AsString  := edtCor.Text;

      if (edtQtdHoras.Text <> ('0.00')) and (edtQtdHoras.Text <> ('0,00'))
      and (edtQtdHoras.Text <> ('0')) and (edtQtdHoras.Text <> trim('')) then
        ParamByName('qtdh').AsFloat := StrToFloat(edtQtdHoras.Text);

      if CbxStatus.ItemIndex = 0 then
        ParamByName('status').AsInteger := 0
      else
        ParamByName('status').AsInteger := 1;

      ParamByName('placa').AsString := edtPlaca.Text;

      if (edtValorAquisicao.Text <> ('0.00')) and (edtValorAquisicao.Text <> ('0,00'))
      and (edtValorAquisicao.Text <> ('0')) and (edtValorAquisicao.Text <> trim('')) then
        ParamByName('vlraq').AsFloat := StrToFloat(edtValorAquisicao.Text);

      if (edtValorServico.Text <> ('0.00')) and (edtValorServico.Text <> ('0,00'))
      and (edtValorServico.Text <> ('0')) and (edtValorServico.Text <> trim('')) then
        ParamByName('vlrhk').AsFloat := StrToFloat(edtValorServico.Text);

      if (edtConsHora.Text <> ('0.00')) and (edtConsHora.Text <> ('0,00'))
      and (edtConsHora.Text <> ('0')) and (edtConsHora.Text <> trim('')) then
        ParamByName('conshk').AsFloat := StrToFloat(edtConsHora.Text);


      if (edtCodFuncionario.Text <> trim('')) and (edtCodFuncionario.Text <> trim('0')) then
        ParamByName('codf').AsFloat := StrToFloat(edtCodFuncionario.Text);

      if (CbxCalculo.ItemIndex <> 0) then
        ParamByName('tc').AsInteger := CbxCalculo.ItemIndex;

      if (CbxPropriedade.ItemIndex <> 0) then
        ParamByName('prop').AsInteger := CbxPropriedade.ItemIndex;

      if (edtCodProprietario.Text <> trim('')) then
        ParamByName('cprop').AsInteger := StrToInt(edtCodProprietario.Text);

      if (edtAnoFabricacao.Text <> trim('')) then
        ParamByName('afab').AsInteger := StrToInt(edtAnoFabricacao.Text);
        
      ExecSQL();
    end;
end;

procedure TfrmIncluirEquipamento.limpa;
begin
  inherited;
  lblFuncionario.Caption := '';
  lblProprietario.Caption := '';
end;

procedure TfrmIncluirEquipamento.edtCodFuncionarioExit(Sender: TObject);
begin
  inherited;
  if edtCodFuncionario.Text <> trim('') then
    begin
      lblFuncionario.Caption := loFuncoes.BuscaFk(edtCodFuncionario.Text,'funcionarios','nome');

      if lblFuncionario.Caption = trim('') then
        begin
          edtCodFuncionario.Clear;
          BtnBuscaFuncionario.SetFocus;
        end;
    end;
end;

procedure TfrmIncluirEquipamento.edtCodFuncionarioEnter(Sender: TObject);
begin
  inherited;
  lblFuncionario.Caption := '';
  edtCodFuncionario.Clear;
end;

procedure TfrmIncluirEquipamento.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmIncluirEquipamento.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmIncluirEquipamento.BtnBuscaFuncionarioClick(Sender: TObject);
begin
  inherited;
  frmFuncionarios := TfrmFuncionarios.Create(self);
  frmFuncionarios.telaChamando := 1;
  frmFuncionarios.ShowModal;
  FreeAndNil(frmFuncionarios);

  if lblFuncionario.Caption <> trim('') then
    BtnGravar.SetFocus;
end;

procedure TfrmIncluirEquipamento.edtCodProprietarioExit(Sender: TObject);
begin
  inherited;
  if edtCodProprietario.Text <> trim('') then
    begin
      lblProprietario.Caption := loFuncoes.BuscaFk(edtCodProprietario.Text,'fornecedores','razaosocial');

      if lblProprietario.Caption = trim('') then
        begin
          edtCodProprietario.Clear;
          BtnBuscaProprietario.SetFocus;
        end
      else
        edtAnoFabricacao.SetFocus;
    end;
end;

procedure TfrmIncluirEquipamento.edtCodProprietarioEnter(Sender: TObject);
begin
  inherited;
  lblProprietario.Caption := '';
end;

procedure TfrmIncluirEquipamento.edtValorAquisicaoExit(Sender: TObject);
begin
  inherited;
  edtValorAquisicao.Text := loFuncoes.TrataReal(edtValorAquisicao.Text);
end;

procedure TfrmIncluirEquipamento.edtValorServicoExit(Sender: TObject);
begin
  inherited;
  edtValorServico.Text := loFuncoes.TrataReal(edtValorServico.Text);
end;

procedure TfrmIncluirEquipamento.edtConsHoraExit(Sender: TObject);
begin
  inherited;
  edtConsHora.Text := loFuncoes.TrataReal(edtConsHora.Text);
end;

procedure TfrmIncluirEquipamento.BtnBuscaProprietarioClick(
  Sender: TObject);
begin
  inherited;
  frmFornecedores := TfrmFornecedores.Create(self);
  frmFornecedores.telaChamando := 8;
  frmFornecedores.ShowModal;
  FreeAndNil(frmFornecedores);

  if lblProprietario.Caption <> trim('') then
    edtAnoFabricacao.SetFocus;
end;

end.
