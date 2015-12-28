unit unRelContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLParser;

type
  TfrmRelContasPagar = class(TForm)
    RlRptContasPagar: TRLReport;
    BndTitulo: TRLBand;
    BndTitulos: TRLBand;
    BdnDados: TRLBand;
    BndRodape: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    lblCodigo: TRLLabel;
    lblVcto: TRLLabel;
    lblVlr: TRLLabel;
    lblDtPgto: TRLLabel;
    lblVlrPg: TRLLabel;
    lblFornecedor: TRLLabel;
    lblEmissao: TRLLabel;
    RLDraw2: TRLDraw;
    RLLabel2: TRLLabel;
    lblSituacao: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel3: TRLLabel;
    CODIGO: TRLDBText;
    EMISSAO: TRLDBText;
    VCTO: TRLDBText;
    VALOR: TRLDBText;
    DTPGTO: TRLDBText;
    VLRPAGO: TRLDBText;
    FORNECEDOR: TRLDBText;
    RLLabel4: TRLLabel;
    DESCRICAO: TRLDBText;
    RLDBText1: TRLDBText;
    RLExpressionParser1: TRLExpressionParser;
    RLLabel5: TRLLabel;
    lblPeriodoInicial: TRLLabel;
    RLLabel6: TRLLabel;
    lblPeriodoFinal: TRLLabel;
    RLLabel7: TRLLabel;
    lblFiltro: TRLLabel;
    VALORGERAL: TRLDBResult;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    VALORPAGO: TRLDBResult;
    RLLabel10: TRLLabel;
    RLDBResult1: TRLDBResult;
    RlImgLogo: TRLImage;
    procedure RlRptContasPagarBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    procedure Logo;
  public
    { Public declarations }
  end;

var
  frmRelContasPagar: TfrmRelContasPagar;

implementation

uses unContasPagar, unDM;

{$R *.dfm}

procedure TfrmRelContasPagar.Logo;
begin
  DM.qryGeral.Close;
  DM.qryGeral.SQL.Clear;
  DM.qryGeral.SQL.Add('SELECT caminhologo FROM configuracoes');
  DM.qryGeral.Open;

  DM.cdsGeral.Close;
  DM.cdsGeral.Open;

  RlImgLogo.Picture.LoadFromFile(DM.cdsGeral.FieldByName('caminhologo').AsString);
end;

procedure TfrmRelContasPagar.RlRptContasPagarBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  Logo;

  CODIGO.DataField   := 'CODIGO';
  EMISSAO.DataField  := 'LANCAMENTO';
  VCTO.DataField     := 'VENCIMENTO';
  VALOR.DataFormula    := 'VALOR';
  DTPGTO.DataField   := 'DATAPAGAMENTO';
  VLRPAGO.DataFormula  := 'VALORPAGO';
  FORNECEDOR.DataField     := 'FORNECEDOR';
  DESCRICAO.DataField      := 'DESCRICAO';
end;

end.
