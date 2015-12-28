unit uFigura;

interface

uses
  Graphics;

type
  TFigura = class

    private
      FoCor: TColor;
    function GetCor: TColor;
    procedure SetCor(const poCor: TColor);

    protected

    public
      property Cor: TColor read GetCor write SetCor;
      procedure Desenhar(poCanvas: TCanvas; piX, piY: integer); virtual; abstract;

    published

  end;

  TQuadrado = class(TFigura)

    private
      FiLargura: integer;
    procedure SetLargura(const Value: integer);

    protected

    public
      property Largura: integer read FiLargura write SetLargura;

    published

  end;

  TRetangulo = class(TQuadrado)

    private
      FiLargura: integer;
      FiAltura: integer;
    procedure SetAltura(const Value: integer);

    protected

    public
      property Largura: integer read FiLargura write SetLargura;
      property Altura: integer read FiAltura write SetAltura;
    published

  end;

implementation

{ TRetangulo }



{ TFigura }

function TFigura.GetCor: TColor;
begin

end;

procedure TFigura.SetCor(const poCor: TColor);
begin

end;

{ TQuadrado }

procedure TQuadrado.SetLargura(const Value: integer);
begin
  FiLargura := Value;
end;

{ TRetangulo }

procedure TRetangulo.SetAltura(const Value: integer);
begin
  FiAltura := Value;
end;

end.
