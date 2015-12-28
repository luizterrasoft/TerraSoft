unit ufTarefa2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmTarefa2 = class(TForm)
    grpBxQuadrado: TGroupBox;
    grpBxRetangulo: TGroupBox;
    ldlLargura: TLabel;
    edLarguraQuadrado: TEdit;
    btnQuadrado: TButton;
    lblLargura: TLabel;
    edLarguraRetangulo: TEdit;
    lblAltura: TLabel;
    edAlturaRetangulo: TEdit;
    btnRetangulo: TButton;
    PaintBox: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure btnQuadradoClick(Sender: TObject);
    procedure btnRetanguloClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure LimparCanvas;
  public
    { Public declarations }
  end;

var
  frmTarefa2: TfrmTarefa2;

implementation

uses
  uFigura;

{$R *.dfm}

procedure TfrmTarefa2.FormCreate(Sender: TObject);
begin
  edLarguraQuadrado.Clear;
  edLarguraRetangulo.Clear;
  edAlturaRetangulo.Clear;
end;

procedure TfrmTarefa2.btnQuadradoClick(Sender: TObject);
var
  oQuadrado: TQuadrado;
  nLargura: Integer;
begin
  LimparCanvas;
  try
    nLargura := StrToInt(edLarguraQuadrado.Text);
  except
    MessageDlg('Informe a largura do quadrado.', mtInformation, [mbOK], 0);
    edLarguraQuadrado.SetFocus;
    Exit;
  end;

  oQuadrado := TQuadrado.Create(nLargura);
  try
    oQuadrado.Desenha(PaintBox.Canvas, 10, 10);
  finally
    FreeAndNil(oQuadrado);
  end;
end;

procedure TfrmTarefa2.LimparCanvas;
begin
  PaintBox.Canvas.Pen.Style := psSolid;
  PaintBox.Canvas.Pen.Color := clBtnFace;
  PaintBox.Canvas.Brush.Style := bsSolid;
  PaintBox.Canvas.Brush.Color := clBtnFace;
  PaintBox.Canvas.Rectangle(0, 0, PaintBox.Width, PaintBox.Height);
  PaintBox.Canvas.MoveTo(0, 0);
end;

procedure TfrmTarefa2.btnRetanguloClick(Sender: TObject);
var
  oRetangulo: TRetangulo;
  nLargura: Integer;
  nAltura: Integer;
begin
  LimparCanvas;
  try
    nLargura := StrToInt(edLarguraRetangulo.Text);
  except
    MessageDlg('Informe a largura do retângulo.', mtInformation, [mbOK], 0);
    edLarguraRetangulo.SetFocus;
    Exit;
  end;

  try
    nAltura := StrToInt(edAlturaRetangulo.Text);
  except
    MessageDlg('Informe a altura do retângulo.', mtInformation, [mbOK], 0);
    edAlturaRetangulo.SetFocus;
    Exit;
  end;

  oRetangulo := TRetangulo.Create(nLargura, nAltura);
  try
    oRetangulo.Desenha(PaintBox.Canvas, 10, 10);
  finally
    FreeAndNil(oRetangulo);
  end;
end;

procedure TfrmTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Self) then
    FreeAndNil(Self);
end;

end.
