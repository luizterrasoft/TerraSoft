unit uFTarefa8;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uThread,
  StdCtrls, ComCtrls, Buttons;

type
  TFTarefa8 = class(TForm)
    lblThread1: TLabel;
    lblThread2: TLabel;
    pbThread2: TProgressBar;
    pbThread1: TProgressBar;
    lblThread1Milisegundos: TLabel;
    lblThread2Milisegundos: TLabel;
    edtThread1Milisegundos: TEdit;
    edtThread2Milisegundos: TEdit;
    BtnIniciar: TBitBtn;
    procedure BtnIniciarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    Processo1: TClassThread;
    Processo2: TClassThread;
  public
    { Public declarations }
  end;

var
  FTarefa8: TFTarefa8;

implementation

{$R *.DFM}

procedure TFTarefa8.BtnIniciarClick(Sender: TObject);
begin
  Processo1 := TClassThread.Create(false);
  Processo1.FreeOnTerminate := True;
  Processo1.Priority := tpNormal;
  Processo1.ProgressBar := pbThread1;
  Processo1.Tempo := StrToIntDef(edtThread1Milisegundos.Text,0);
  Processo1.LabelResultado := lblThread1Milisegundos;

  Processo2 := TClassThread.Create(false);
  Processo2.FreeOnTerminate := True;
  Processo2.Priority := tpNormal;
  Processo2.ProgressBar := pbThread2;
  Processo2.Tempo := StrToIntDef(edtThread2Milisegundos.Text,0);
  Processo2.LabelResultado := lblThread2Milisegundos;

  Processo1.Resume;
  Processo2.Resume;   
end;

procedure TFTarefa8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Self) then
    FreeAndNil(Self);
end;

procedure TFTarefa8.FormCreate(Sender: TObject);
begin
  edtThread1Milisegundos.Clear;
  edtThread2Milisegundos.Clear;
end;

end.
