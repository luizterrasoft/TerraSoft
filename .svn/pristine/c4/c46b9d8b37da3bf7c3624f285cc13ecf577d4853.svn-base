unit uFMenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus;

type
  TfMenuPrincipal = class(TForm)
    MnMnuTarefas: TMainMenu;
    MnTarefas: TMenuItem;
    MnItTarefa2: TMenuItem;
    MnItTarefa1: TMenuItem;
    MnItTarefa8: TMenuItem;
    MnItTarefa6: TMenuItem;
    procedure MnItTarefa2Click(Sender: TObject);
    procedure MnItTarefa1Click(Sender: TObject);
    procedure MnItTarefa8Click(Sender: TObject);
    procedure MnItTarefa6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenuPrincipal: TfMenuPrincipal;

implementation

uses uFTarefa2, uFTarefa1, uFTarefa8, UFTarefa6;

{$R *.DFM}

procedure TfMenuPrincipal.MnItTarefa2Click(Sender: TObject);
var
  fTarefa2: TFTarefa2;
begin
  fTarefa2 := TFTarefa2.Create(nil);
  fTarefa2.Show;
end;

procedure TfMenuPrincipal.MnItTarefa1Click(Sender: TObject);
var
  fTarefa1: TFTarefa1;
begin
  fTarefa1 := TFTarefa1.Create(nil);
  fTarefa1.Show;
end;

procedure TfMenuPrincipal.MnItTarefa8Click(Sender: TObject);
var
  FTarefa8: TFTarefa8;
begin
  FTarefa8 := TFTarefa8.Create(nil);
  FTarefa8.Show;
end;

procedure TfMenuPrincipal.MnItTarefa6Click(Sender: TObject);
var
  FTarefa6: TFTarefa6;
begin
  FTarefa6 := TFTarefa6.Create(nil);
  FTarefa6.Show; 
end;

end.
