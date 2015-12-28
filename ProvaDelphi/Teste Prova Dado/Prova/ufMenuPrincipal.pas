unit ufMenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfMenuPrincipal = class(TForm)
    MainMenu: TMainMenu;
    mnitTarefas: TMenuItem;
    mnitTarefa1: TMenuItem;
    mnitTarefa2: TMenuItem;
    mnitTarefa3: TMenuItem;
    mnitTarefa4: TMenuItem;
    mnitTarefa5: TMenuItem;
    mnitTarefa6: TMenuItem;
    mnitTarefa7: TMenuItem;
    mnitTarefa8: TMenuItem;
    procedure mnitTarefa1Click(Sender: TObject);
    procedure mnitTarefa2Click(Sender: TObject);
    procedure mnitTarefa6Click(Sender: TObject);
    procedure mnitTarefa7Click(Sender: TObject);
    procedure mnitTarefa8Click(Sender: TObject);
    procedure mnitTarefa3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenuPrincipal: TfMenuPrincipal;

implementation

uses
  ufTarefa1, ufTarefa2, ufTarefa3, ufTarefa6, ufTarefa7, ufTarefa8;

{$R *.dfm}

procedure TfMenuPrincipal.mnitTarefa1Click(Sender: TObject);
var
  frmTarefa1: TfrmTarefa1;
begin
  frmTarefa1 := TfrmTarefa1.Create(nil);
  frmTarefa1.Show;
end;

procedure TfMenuPrincipal.mnitTarefa2Click(Sender: TObject);
var
  frmTarefa2: TfrmTarefa2;
begin
  frmTarefa2 := TfrmTarefa2.Create(nil);
  frmTarefa2.Show;
end;

procedure TfMenuPrincipal.mnitTarefa6Click(Sender: TObject);
var
  frmTarefa6: TfrmTarefa6;
begin
  frmTarefa6 := TfrmTarefa6.Create(nil);
  frmTarefa6.Show;
end;

procedure TfMenuPrincipal.mnitTarefa7Click(Sender: TObject);
var
  frmTarefa7: TfrmTarefa7;
begin
  frmTarefa7 := TfrmTarefa7.Create(nil);
  frmTarefa7.Show;
end;

procedure TfMenuPrincipal.mnitTarefa8Click(Sender: TObject);
var
  frmTarefa8: TfrmTarefa8;
begin
  frmTarefa8 := TfrmTarefa8.Create(nil);
  frmTarefa8.Show;
end;

procedure TfMenuPrincipal.mnitTarefa3Click(Sender: TObject);
var
  frmTarefa3: TfrmTarefa3;
begin
  frmTarefa3 := TfrmTarefa3.Create(nil);
  frmTarefa3.Show;
end;

end.
