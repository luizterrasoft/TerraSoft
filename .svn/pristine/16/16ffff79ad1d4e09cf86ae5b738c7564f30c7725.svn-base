unit uThread;

interface

uses
   Classes, StdCtrls, ComCtrls;

type
  TClassThread = class(TThread)
  private
    FiTempo: integer;
    FoProgresBar: TProgressBar;
    FoLabel: TLabel;
    procedure InicializarPogressBar;
    procedure ProcessarPogressBar;
    function GetTempo: Integer;
    function GetProgresBar: TProgressBar;
    function GetLabel: TLabel;
    procedure SetTempo(piTempo: Integer);
    procedure SetProgresBar(poProgresBar: TProgressBar);
    procedure SetLabel(poLabel: TLabel);
  protected
    procedure Execute; override;
  public
    property Tempo: Integer read GetTempo write SetTempo;
    property ProgresBar: TProgressBar read GetProgresBar write SetProgresBar;
    property LabelResultado: TLabel read GetLabel write SetLabel;
  end;

implementation

uses
  SysUtils;

{ TClassThread }

procedure TClassThread.Execute;
var
  i: integer;
begin
  Synchronize(InicializarPogressBar);
  for i := 0 to 100 do
  begin
    Sleep(Tempo);
    Synchronize(ProcessarPogressBar);
  end;
end;

function TClassThread.GetLabel: TLabel;
begin
  Result := FoLabel;
end;

function TClassThread.GetProgresBar: TProgressBar;
begin
  Result := FoProgresBar;
end;

function TClassThread.GetTempo: Integer;
begin
  Result := FiTempo;
end;

procedure TClassThread.InicializarPogressBar;
begin
  ProgresBar.Position := 0;
  ProgresBar.Min := 0;
  ProgresBar.Max := 100;
end;

procedure TClassThread.ProcessarPogressBar;
begin
  LabelResultado.Caption := IntToStr(ProgresBar.Position) + '%';
  ProgresBar.Position := ProgresBar.Position + 1;
end;

procedure TClassThread.SetLabel(poLabel: TLabel);
begin
  Folabel := poLabel;
end;

procedure TClassThread.SetProgresBar(poProgresBar: TProgressBar);
begin
  FoProgresBar := poProgresBar;
end;

procedure TClassThread.SetTempo(piTempo: Integer);
begin
  FiTempo := piTempo;
end;

end.
