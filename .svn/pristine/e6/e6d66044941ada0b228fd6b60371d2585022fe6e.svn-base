unit unReciboCR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, StdCtrls;

type
  TfrmReciboCR = class(TForm)
    RlRptReciboCR: TRLReport;
    BndTitulo: TRLBand;
    BndDados: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    DATAEXTENSO: TRLLabel;
    RLDraw1: TRLDraw;
    RLLabel7: TRLLabel;
    VALOREXTENSO: TRLLabel;
    PESSOA: TRLLabel;
    VALOREAL: TLabel;
    PARCELA: TRLLabel;
    EMITENTE: TRLLabel;
    RlImgLogo: TRLImage;
    procedure RlRptReciboCRBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    procedure Logo;
  public
    { Public declarations }
  end;

var
  frmReciboCR: TfrmReciboCR;

implementation

uses unContasReceber, unDM;



{$R *.dfm}

{ TfrmReciboCR }

procedure TfrmReciboCR.Logo;
begin
  DM.qryGeral.Close;
  DM.qryGeral.SQL.Clear;
  DM.qryGeral.SQL.Add('SELECT caminhologo FROM configuracoes');
  DM.qryGeral.Open;

  DM.cdsGeral.Close;
  DM.cdsGeral.Open;

  RlImgLogo.Picture.LoadFromFile(DM.cdsGeral.FieldByName('caminhologo').AsString);
end;

procedure TfrmReciboCR.RlRptReciboCRBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  Logo;
end;

end.
