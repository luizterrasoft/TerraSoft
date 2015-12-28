unit uFTarefa2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFTarefa2 = class(TForm)
    GrBxQuadrado: TGroupBox;
    GrBxRetangulo: TGroupBox;
    PntBxFigura: TPaintBox;
    BtnQuadrado: TBitBtn;
    BtnRetangulo: TBitBtn;
    lblLargQuadrado: TLabel;
    lblLargRetangulo: TLabel;
    lblAlturaRetangulo: TLabel;
    edtLargQuadrado: TEdit;
    edtLargRetangulo: TEdit;
    edtAlturaRetangulo: TEdit;
    procedure BtnQuadradoClick(Sender: TObject);
    procedure BtnRetanguloClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure limparCanvas;
  public
    { Public declarations }
  end;

var
  FTarefa2: TFTarefa2;

implementation

uses
  UFigura;

{$R *.DFM}

procedure TFTarefa2.BtnQuadradoClick(Sender: TObject);
var
  iLargura: integer;
  oQuadrado: TQuadrado;
begin
  limparCanvas;

  try
    iLargura := StrToInt(edtLargQuadrado.Text);
  except
    MessageDlg('Digite um valor inteiro v�lido para definir a largura!',mtWarning,[mbOk],0);
    edtLargQuadrado.setFocus;
    Exit;
  end;

  oQuadrado := TQuadrado.Create(iLargura);

  try
    oQuadrado.Desenhar(PntBxFigura.Canvas,0,0);
  finally
    FreeAndNil(oQuadrado);
  end;
end;

procedure TFTarefa2.BtnRetanguloClick(Sender: TObject);
var
  oRetangulo: TRetangulo;
  iLargura, iAltura: integer;
begin
  limparCanvas;

  try
    iLargura := StrToInt(edtLargRetangulo.Text);
  except
    MessageDlg('Digite um valor v�lido para definir a largura do ret�ngulo!',mtWarning,[mbOk],0);
    edtLargRetangulo.SetFocus;
    Exit;
  end;

  try
    iAltura := StrToInt(edtAlturaRetangulo.Text);
  except
    MessageDlg('Digite um valor v�lido para definir a altura do ret�ngulo!',mtWarning,[mbOk],0);
    edtAlturaRetangulo.SetFocus;
    Exit;
  end;

  oRetangulo := TRetangulo.Create(iAltura,iLargura);

  try
    oRetangulo.Desenhar(PntBxFigura.Canvas,0,0);
  finally
    FreeAndNil(oRetangulo);    
  end;

end;

procedure TFTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(self) then
    FreeAndNil(self);
end;

procedure TFTarefa2.limparCanvas;
begin
  PntBxFigura.Canvas.Pen.Style := psSolid;
  PntBxFigura.Canvas.Pen.Color := clBtnFace;
  PntBxFigura.Canvas.Brush.Style := bsSolid;
  PntBxFigura.Canvas.Brush.Color := clBtnFace;
  PntBxFigura.Canvas.Rectangle(0, 0, PntBxFigura.Width, PntBxFigura.Height);
  PntBxFigura.Canvas.MoveTo(0, 0);
end;

end.