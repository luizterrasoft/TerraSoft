unit unRelCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, StdCtrls;

type
  TfrmRelCaixa = class(TForm)
    RlRptCaixa: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLLabel1: TRLLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    CODIGO: TRLDBText;
    CONTA: TRLDBText;
    VALOR: TRLDBText;
    DESCRICAO: TRLDBText;
    TIPO: TRLDBText;
    RLLabel2: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    DIA: TRLLabel;
    ENTRADASDIARIAS: TRLLabel;
    SAIDASDIARIAS: TRLLabel;
    SALDOGERAL: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel5: TRLLabel;
    SALDOTOTAL: TRLLabel;
    RLLabel7: TRLLabel;
    ATE: TRLLabel;
    FINAL: TRLLabel;
    RlImgLogo: TRLImage;
    procedure RlRptCaixaBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    procedure Logo;
  public
    { Public declarations }
  end;

var
  frmRelCaixa: TfrmRelCaixa;

implementation

uses unCaixa, unDM;

{$R *.dfm}

{ TfrmRelCaixa }

procedure TfrmRelCaixa.Logo;
begin
  DM.qryGeral.Close;
  DM.qryGeral.SQL.Clear;
  DM.qryGeral.SQL.Add('SELECT caminhologo FROM configuracoes');
  DM.qryGeral.Open;

  DM.cdsGeral.Close;
  DM.cdsGeral.Open;

  RlImgLogo.Picture.LoadFromFile(DM.cdsGeral.FieldByName('caminhologo').AsString);
end;

procedure TfrmRelCaixa.RlRptCaixaBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  Logo;
end;

end.
