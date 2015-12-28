unit unRelContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLParser;

type
  TfrmRelContasReceber = class(TForm)
    RlRptContasPagar: TRLReport;
    BndTitulo: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    RLLabel2: TRLLabel;
    lblSituacao: TRLLabel;
    BndTitulos: TRLBand;
    lblCodigo: TRLLabel;
    lblVcto: TRLLabel;
    lblVlr: TRLLabel;
    lblDtPgto: TRLLabel;
    lblVlrPg: TRLLabel;
    lblFornecedor: TRLLabel;
    lblEmissao: TRLLabel;
    RLDraw2: TRLDraw;
    BdnDados: TRLBand;
    CODIGO: TRLDBText;
    EMISSAO: TRLDBText;
    VCTO: TRLDBText;
    VALOR: TRLDBText;
    DTRBTO: TRLDBText;
    VLRRCBDO: TRLDBText;
    CLIENTE: TRLDBText;
    BndRodape: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    TPCOB: TRLDBText;
    VALORGERAL: TRLDBResult;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    VALORRECEBIDO: TRLDBResult;
    RLLabel10: TRLLabel;
    RLExpressionParser1: TRLExpressionParser;
    TOTAL_RECEBER: TRLDBResult;
    RLLabel7: TRLLabel;
    lblPeriodoInicial: TRLLabel;
    RLLabel11: TRLLabel;
    lblPeriodoFinal: TRLLabel;
    RlImgLogo: TRLImage;
    procedure RlRptContasPagarBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    procedure Logo;
  public
    { Public declarations }
  end;

var
  frmRelContasReceber: TfrmRelContasReceber;

implementation

uses unContasReceber, unDM;

{$R *.dfm}

procedure TfrmRelContasReceber.Logo;
begin
  DM.qryGeral.Close;
  DM.qryGeral.SQL.Clear;
  DM.qryGeral.SQL.Add('SELECT caminhologo FROM configuracoes');
  DM.qryGeral.Open;

  DM.cdsGeral.Close;
  DM.cdsGeral.Open;

  RlImgLogo.Picture.LoadFromFile(DM.cdsGeral.FieldByName('caminhologo').AsString);
end;

procedure TfrmRelContasReceber.RlRptContasPagarBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  Logo;

  CODIGO.DataField   := 'CODIGO';
  EMISSAO.DataField  := 'LANCAMENTO';
  VCTO.DataField     := 'VENCIMENTO';
  VALOR.DataFormula  := 'VALOR';
  DTRBTO.DataField   := 'DATARECEBIMENTO';
  VLRRCBDO.DataFormula  := 'VALORRECEBIDO';
  CLIENTE.DataField     := 'CLIENTE';
  TPCOB.DataField   := 'TIPOCOBRANCA';
end;

end.
