unit unConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons;

type
  TfrmConsulta = class(TForm)
    PnOpcoes: TPanel;
    StBarConsulta: TStatusBar;
    BtnIncluir: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnRelatorios: TBitBtn;
    BtnSair: TBitBtn;
    PnConsulta: TPanel;
    PnConsultaPor: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtConsulta: TEdit;
    BtnConsultar: TBitBtn;
    RdBtnCodigo: TRadioButton;
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsulta: TfrmConsulta;

implementation

{$R *.dfm}

procedure TfrmConsulta.BtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

end.
