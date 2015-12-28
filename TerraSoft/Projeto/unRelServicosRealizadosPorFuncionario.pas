unit unRelServicosRealizadosPorFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLParser;

type
  TfrmRelServicosRealizadosPorFuncionario = class(TForm)
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
    lblFuncionario: TRLLabel;
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
    Obs: TRLDBText;
    RLExpressionParser1: TRLExpressionParser;
    RLDBResult2: TRLDBResult;
    RLLabel17: TRLLabel;
    RLLabel16: TRLLabel;
    RLDBResult1: TRLDBResult;
    RlImgLogo: TRLImage;
    procedure RlRptRelatorioBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    procedure Logo;
  public
    { Public declarations }
  end;

var
  frmRelServicosRealizadosPorFuncionario: TfrmRelServicosRealizadosPorFuncionario;

implementation

uses unServicosRealizadosPorFuncionario, unDM;

{$R *.dfm}

{ TfrmRelServicosRealizadosPorFuncionario }

procedure TfrmRelServicosRealizadosPorFuncionario.Logo;
begin
  DM.qryGeral.Close;
  DM.qryGeral.SQL.Clear;
  DM.qryGeral.SQL.Add('SELECT caminhologo FROM configuracoes');
  DM.qryGeral.Open;

  DM.cdsGeral.Close;
  DM.cdsGeral.Open;

  RlImgLogo.Picture.LoadFromFile(DM.cdsGeral.FieldByName('caminhologo').AsString);
end;

procedure TfrmRelServicosRealizadosPorFuncionario.RlRptRelatorioBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  Logo;
end;

end.
