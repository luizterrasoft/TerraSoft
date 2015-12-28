unit unRelacaoOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLParser;

type
  TfrmRelacaoOS = class(TForm)
    RlRpt: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel4: TRLLabel;
    Inicial: TRLLabel;
    RLLabel6: TRLLabel;
    Final: TRLLabel;
    RLBand5: TRLBand;
    RLLabel2: TRLLabel;
    Tipo: TRLLabel;
    CODIGO: TRLDBText;
    ABERTURA: TRLDBText;
    FECHAMENTO: TRLDBText;
    CLIENTE: TRLDBText;
    VALOR: TRLDBText;
    STATUS: TRLDBText;
    RLLabel3: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    VENDEDOR: TRLDBText;
    RLLabel13: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLExpressionParser1: TRLExpressionParser;
    RLBand6: TRLBand;
    RLDraw3: TRLDraw;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    CANCELADAS: TRLDBText;
    ABERTAS: TRLDBText;
    FECHADAS: TRLDBText;
    RLLabel17: TRLLabel;
    OSBLOCO: TRLDBText;
    RlImgLogo: TRLImage;
    procedure RlRptBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    procedure Logo;
  public
    { Public declarations }
  end;

var
  frmRelacaoOS: TfrmRelacaoOS;

implementation

uses unOS, unDM;

{$R *.dfm}

{ TfrmRelacaoOS }

procedure TfrmRelacaoOS.Logo;
begin
  DM.qryGeral.Close;
  DM.qryGeral.SQL.Clear;
  DM.qryGeral.SQL.Add('SELECT caminhologo FROM configuracoes');
  DM.qryGeral.Open;

  DM.cdsGeral.Close;
  DM.cdsGeral.Open;

  RlImgLogo.Picture.LoadFromFile(DM.cdsGeral.FieldByName('caminhologo').AsString);
end;

procedure TfrmRelacaoOS.RlRptBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  Logo;
end;

end.
