unit uDesenhar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, uFigura;

type
  TfrmDesenhar = class(TForm)
    GrBxQuadrado: TGroupBox;
    GrBxRetangulo: TGroupBox;
    Image1: TImage;
    lblLarguraQuadrado: TLabel;
    edtLargQuadrado: TEdit;
    BtnQuadrado: TBitBtn;
    lblLargRetangulo: TLabel;
    lblAltRetangulo: TLabel;
    edtLargRetangulo: TEdit;
    edtAltRetangulo: TEdit;
    BtnRetangulo: TBitBtn;
    procedure BtnQuadradoClick(Sender: TObject);
  private
    FoQuadrado: TQuadrado;
    FoRetangulo: TRetangulo;
    FoFigura: TFigura;

    procedure Desenhar(poCanvas: TCanvas; piX, piY: integer); 

  public
    { Public declarations }
  end;

var
  frmDesenhar: TfrmDesenhar;

implementation

{$R *.dfm}

procedure TfrmDesenhar.BtnQuadradoClick(Sender: TObject);
begin
  try
    FoQuadrado := TQuadrado.Create;
    FoQuadrado.Cor := clBlue;
    Desenhar(frmDesenhar.Canvas,StrToInt(edtLargQuadrado.Text),StrToInt(edtLargQuadrado.Text));
  finally

  end;
end;

procedure TfrmDesenhar.Desenhar(poCanvas: TCanvas; piX, piY: integer);
begin

  poCanvas.Rectangle(1,1,1,1);
end;

end.
