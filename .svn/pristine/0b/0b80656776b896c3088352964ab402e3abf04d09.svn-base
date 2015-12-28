unit uFigura;

interface

uses
  Graphics;

type
  TFigura = class

  private
    FoCor: TColor;

  public
    procedure Desenha(poCanvas: TCanvas; pnX, pnY: integer); virtual; abstract;
    property Cor: TColor read FoCor  write FoCor;
  end;

  TQuadrado = class(TFigura)

  private
    FnLargura: Integer;
  public
    constructor Create(pnLargura: Integer); overload;
    procedure Desenha(poCanvas: TCanvas; pnX, pnY: Integer); override;
    property Largura: Integer read FnLargura write FnLargura;
  end;

  TRetangulo = class(TQuadrado)

  private
    FnAltura: Integer;
  public
   constructor Create(pnLargura: Integer; pnAltura: Integer); overload;
   procedure Desenha(poCanvas: TCanvas; pnX, pnY: Integer); override;
   property Altura: Integer read FnAltura write FnAltura;
  end;

implementation

{ TQuadrado }

constructor TQuadrado.Create(pnLargura: Integer);
begin
  Cor:= clBlue;
  Largura:= pnLargura;
  inherited Create;
end;

procedure TQuadrado.Desenha(poCanvas: TCanvas; pnX, pnY: Integer);
begin
  inherited;
 
  poCanvas.Pen.Style := psSolid;
  poCanvas.Pen.Color := Cor;
  poCanvas.Brush.Style := bsSolid;
  poCanvas.Brush.Color := Cor;
  poCanvas.Rectangle(pnX, pnY, Largura, Largura);
end;

{ TRetangulo }

constructor TRetangulo.Create(pnLargura, pnAltura: Integer);
begin
  Altura := pnAltura;
  inherited Create(pnLargura);
end;

procedure TRetangulo.Desenha(poCanvas: TCanvas; pnX, pnY: Integer);
begin
  inherited;
  poCanvas.Pen.Style := psSolid;
  poCanvas.Pen.Color := Cor;
  poCanvas.Brush.Style := bsSolid;
  poCanvas.Brush.Color := Cor;
  poCanvas.Rectangle(pnX, pnY, Largura, Altura);
end;

end.
