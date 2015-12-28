unit unRelServicosRealizadosPorEquipamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLParser;

type
  TfrmRelServicosRealizadosPorEquipamento = class(TForm)
    RlRptRelatorio: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel5: TRLLabel;
    lblPeriodoInicial: TRLLabel;
    lblPeriodoFinal: TRLLabel;
    RLLabel6: TRLLabel;
    lblStatus: TRLLabel;
    RLLabel3: TRLLabel;
    lblEquipamento: TRLLabel;
    RLLabel4: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLDraw1: TRLDraw;
    OS: TRLDBText;
    Status: TRLDBText;
    HInicial: TRLDBText;
    Hfinal: TRLDBText;
    QtdHoras: TRLDBText;
    ValorHora: TRLDBText;
    Total: TRLDBText;
    Data: TRLDBText;
    CLIENTE: TRLDBText;
    RLExpressionParser1: TRLExpressionParser;
    RLDBResult2: TRLDBResult;
    RLLabel17: TRLLabel;
    RLLabel16: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLLabel18: TRLLabel;
    RLDBText1: TRLDBText;
    RlImgLogo: TRLImage;
    procedure RlRptRelatorioBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    procedure Logo;
  public
    { Public declarations }
  end;

var
  frmRelServicosRealizadosPorEquipamento: TfrmRelServicosRealizadosPorEquipamento;

implementation

uses unSelRelServicosEquipamentos, unDM;

{$R *.dfm}

{ TfrmRelServicosRealizadosPorEquipamento }

procedure TfrmRelServicosRealizadosPorEquipamento.Logo;
begin
  DM.qryGeral.Close;
  DM.qryGeral.SQL.Clear;
  DM.qryGeral.SQL.Add('SELECT caminhologo FROM configuracoes');
  DM.qryGeral.Open;

  DM.cdsGeral.Close;
  DM.cdsGeral.Open;

  RlImgLogo.Picture.LoadFromFile(DM.cdsGeral.FieldByName('caminhologo').AsString);
end;

procedure TfrmRelServicosRealizadosPorEquipamento.RlRptRelatorioBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  Logo;
end;

end.
