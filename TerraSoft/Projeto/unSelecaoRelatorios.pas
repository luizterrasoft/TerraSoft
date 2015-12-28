unit unSelecaoRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, FMTBcd, SqlExpr,
  Provider, DB, DBClient;

type
  TfrmSelecaoRelatorios = class(TForm)
    RdGrpRelatorio: TRadioGroup;
    RdGrpOrdenacao: TRadioGroup;
    BtnGerar: TBitBtn;
    BtnSair: TBitBtn;
    RdGrpFiltro: TRadioGroup;
    BvSeparador1: TBevel;
    dsPadrao: TDataSource;
    cdsPadrao: TClientDataSet;
    dspPadrao: TDataSetProvider;
    qryPadrao: TSQLQuery;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecaoRelatorios: TfrmSelecaoRelatorios;

implementation

uses Math, unDM;

{$R *.dfm}

procedure TfrmSelecaoRelatorios.BtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmSelecaoRelatorios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_ESCAPE  Then
    Self.Close;
end;

procedure TfrmSelecaoRelatorios.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

end.
