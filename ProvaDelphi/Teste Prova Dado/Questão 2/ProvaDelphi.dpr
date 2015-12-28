program ProvaDelphi;

uses
  Forms,
  uFigura in 'uFigura.pas',
  uDesenhar in 'uDesenhar.pas' {frmDesenhar};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmDesenhar, frmDesenhar);
  Application.Run;
end.
