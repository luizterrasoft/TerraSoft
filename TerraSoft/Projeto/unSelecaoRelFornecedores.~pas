unit unSelecaoRelFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSelecaoRelatorios, StdCtrls, Buttons, ExtCtrls, Mask, unFuncoes,
  FMTBcd, SqlExpr, Provider, DB, DBClient;

type
  TfrmSelecaoRelFornecedores = class(TfrmSelecaoRelatorios)
    PnFiltroData: TPanel;
    PnFiltroFicha: TPanel;
    label123: TLabel;
    edtCodFornecedor: TEdit;
    BtnBuscaFornecedor: TBitBtn;
    lblFornecedor: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    mskInicial: TMaskEdit;
    mskFInal: TMaskEdit;
    procedure RdGrpRelatorioClick(Sender: TObject);
    procedure edtCodFornecedorExit(Sender: TObject);
    procedure edtCodFornecedorEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnBuscaFornecedorClick(Sender: TObject);
  private
    loFuncoes: TFuncoes;
  public
    { Public declarations }
  end;

var
  frmSelecaoRelFornecedores: TfrmSelecaoRelFornecedores;

implementation

uses unFornecedores;

{$R *.dfm}

procedure TfrmSelecaoRelFornecedores.RdGrpRelatorioClick(Sender: TObject);
begin
  inherited;
  if RdGrpRelatorio.ItemIndex = 0 then
    begin
      PnFiltroData.Visible := True;
      PnFiltroFicha.Visible:= False;
    end;

  if RdGrpRelatorio.ItemIndex = 1 then
    begin
      PnFiltroData.Visible := False;
      PnFiltroFicha.Visible := True;
    end;
end;

procedure TfrmSelecaoRelFornecedores.edtCodFornecedorExit(Sender: TObject);
begin
  inherited;
  if edtCodFornecedor.Text <> trim('') then
    begin
      lblFornecedor.Caption := loFuncoes.BuscaFk(edtCodFornecedor.Text,'fornecedores','razaosocial');

      if lblFornecedor.Caption = trim('') then
        begin
          edtCodFornecedor.Clear;
          BtnBuscaFornecedor.SetFocus;
        end
      else
        BtnGerar.SetFocus;
    end;
end;

procedure TfrmSelecaoRelFornecedores.edtCodFornecedorEnter(
  Sender: TObject);
begin
  inherited;
  lblFornecedor.Caption := '';
end;

procedure TfrmSelecaoRelFornecedores.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmSelecaoRelFornecedores.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmSelecaoRelFornecedores.BtnBuscaFornecedorClick(
  Sender: TObject);
begin
  inherited;
  frmFornecedores := TfrmFornecedores.Create(self);
  frmFornecedores.telaChamando := 4;
  frmFornecedores.ShowModal;
  FreeAndNil(frmFornecedores);

  if lblFornecedor.Caption <> trim('') then
    BtnGerar.SetFocus;
end;

end.
