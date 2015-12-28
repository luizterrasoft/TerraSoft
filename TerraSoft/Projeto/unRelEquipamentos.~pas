unit unRelEquipamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLParser;

type
  TfrmRelEquipamentos = class(TForm)
    Rel: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    GRUPO1: TRLGroup;
    RLBand3: TRLBand;
    RLLabel2: TRLLabel;
    EQUIPAMENTO: TRLDBText;
    GRUPO2: TRLGroup;
    RLBand4: TRLBand;
    RLLabel3: TRLLabel;
    PLANOCONTA: TRLDBText;
    GRUPO3: TRLGroup;
    RLBand5: TRLBand;
    RLLabel4: TRLLabel;
    SUBPLANOCONTA: TRLDBText;
    RLBand6: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel8: TRLLabel;
    STATUS: TRLDBText;
    RLLabel9: TRLLabel;
    DATAABERTURA: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText4: TRLDBText;
    RLExpressionParser1: TRLExpressionParser;
    RLBand7: TRLBand;
    RLLabel11: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDraw3: TRLDraw;
    CODEQUIPAMENTO: TRLDBText;
    CODPLANOCONTA: TRLDBText;
    CODSUBPLANO: TRLDBText;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    lblInicial: TRLLabel;
    RLLabel15: TRLLabel;
    lblFinal: TRLLabel;
    RLBand2: TRLBand;
    RLLabel16: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel12: TRLLabel;
    RLDBResult2: TRLDBResult;
    RlImgLogo: TRLImage;
    procedure RelBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    procedure Logo;
  public
    { Public declarations }
  end;

var
  frmRelEquipamentos: TfrmRelEquipamentos;

implementation

uses unRelatoriosManutencoes, unDM;

{$R *.dfm}

{ TfrmRelEquipamentos }

procedure TfrmRelEquipamentos.Logo;
begin
  DM.qryGeral.Close;
  DM.qryGeral.SQL.Clear;
  DM.qryGeral.SQL.Add('SELECT caminhologo FROM configuracoes');
  DM.qryGeral.Open;

  DM.cdsGeral.Close;
  DM.cdsGeral.Open;

  RlImgLogo.Picture.LoadFromFile(DM.cdsGeral.FieldByName('caminhologo').AsString);
end;

procedure TfrmRelEquipamentos.RelBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  Logo;
end;

end.
