unit unRelOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLParser;

type
  TfrmRelOS = class(TForm)
    RlRptOS: TRLReport;
    RLGroup1: TRLGroup;
    RLBand1: TRLBand;
    RLDraw5: TRLDraw;
    CONDPGTO: TRLDBText;
    STATUS: TRLDBText;
    VENDEDOR: TRLDBText;
    RLLabel7: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    VLRTOTAL: TRLDBText;
    DESCONTO: TRLDBText;
    SUBTOTAL: TRLDBText;
    RLLabel10: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel8: TRLLabel;
    DATAFECH: TRLDBText;
    PREVFECH: TRLDBText;
    ABERTURA: TRLDBText;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    CODCLIENTE: TRLDBText;
    NOMECLI: TRLDBText;
    RLLabel3: TRLLabel;
    FONECLI: TRLDBText;
    RLDraw2: TRLDraw;
    RLDraw4: TRLDraw;
    RLLabel1: TRLLabel;
    CODIGO: TRLDBText;
    RLLabel2: TRLLabel;
    RLBand2: TRLBand;
    CODITEM: TRLDBText;
    EQUIPAMENTO: TRLDBText;
    CODFUN: TRLDBText;
    INICIAL: TRLDBText;
    FINAL: TRLDBText;
    HORAS: TRLDBText;
    VALOR: TRLDBText;
    TOTAL: TRLDBText;
    RLBand3: TRLBand;
    RLLabel22: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel13: TRLLabel;
    RLDraw7: TRLDraw;
    RLDraw6: TRLDraw;
    RLLabel14: TRLLabel;
    RLExpressionParser1: TRLExpressionParser;
    RLLabel15: TRLLabel;
    DATACAD: TRLDBText;
    RLBand4: TRLBand;
    RLLabel25: TRLLabel;
    RLDraw10: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw1: TRLDraw;
    RLLabel26: TRLLabel;
    RLSubDetail1: TRLSubDetail;
    RLBand5: TRLBand;
    VCTO: TRLDBText;
    PARCELA: TRLDBText;
    RLBand6: TRLBand;
    RLLabel24: TRLLabel;
    RLLabel23: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel27: TRLLabel;
    OSBLOCO: TRLDBText;
    RlImgLogo: TRLImage;
    procedure RlRptOSBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    procedure Logo;
  public
    { Public declarations }
  end;

var
  frmRelOS: TfrmRelOS;

implementation

uses unOS, unDM;

{$R *.dfm}

{ TfrmRelOS }

procedure TfrmRelOS.Logo;
begin
  DM.qryGeral.Close;
  DM.qryGeral.SQL.Clear;
  DM.qryGeral.SQL.Add('SELECT caminhologo FROM configuracoes');
  DM.qryGeral.Open;

  DM.cdsGeral.Close;
  DM.cdsGeral.Open;

  RlImgLogo.Picture.LoadFromFile(DM.cdsGeral.FieldByName('caminhologo').AsString);
end;

procedure TfrmRelOS.RlRptOSBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  Logo;
end;

end.
