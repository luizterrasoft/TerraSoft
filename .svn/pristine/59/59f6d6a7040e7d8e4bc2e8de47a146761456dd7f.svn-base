unit unReciboCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, StdCtrls;

type
  TfrmReciboCP = class(TForm)
    RlRptReciboCP: TRLReport;
    BndTitulo: TRLBand;
    VALOREAL: TLabel;
    RLLabel1: TRLLabel;
    BndDados: TRLBand;
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
    PARCELA: TRLLabel;
    EMITENTE: TRLLabel;
    RlImgLogo: TRLImage;
    procedure RlRptReciboCPBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    procedure Logo;
  public
    { Public declarations }
  end;

var
  frmReciboCP: TfrmReciboCP;

implementation

uses unDM;

{$R *.dfm}

{ TfrmReciboCP }

procedure TfrmReciboCP.Logo;
begin
  DM.qryGeral.Close;
  DM.qryGeral.SQL.Clear;
  DM.qryGeral.SQL.Add('SELECT caminhologo FROM configuracoes');
  DM.qryGeral.Open;

  DM.cdsGeral.Close;
  DM.cdsGeral.Open;

  RlImgLogo.Picture.LoadFromFile(DM.cdsGeral.FieldByName('caminhologo').AsString);
end;

procedure TfrmReciboCP.RlRptReciboCPBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  Logo;
end;

end.
