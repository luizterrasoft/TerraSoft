unit ufTarefa8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, uThread;

type
  TfrmTarefa8 = class(TForm)
    pbThread1: TProgressBar;
    pbThread2: TProgressBar;
    lblThread1: TLabel;
    lblThread2: TLabel;
    lblQuantidadeMilissegundos1: TLabel;
    edThread1Milisegundos: TEdit;
    lblQuantidadeMilissegundos2: TLabel;
    edThread2Milisegundos: TEdit;
    lblThread1Resultado: TLabel;
    lblThread2Resultado: TLabel;
    btnIniciar: TButton;
    procedure btnIniciarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Processo1: TClassThread;
    Processo2: TClassThread;
  public
    { Public declarations }
  end;

var
  frmTarefa8: TfrmTarefa8;

implementation

{$R *.dfm}

procedure TfrmTarefa8.btnIniciarClick(Sender: TObject);
begin
  Processo1 := TClassThread.Create(False);
  Processo1.FreeOnTerminate := True;
  Processo1.Priority := tpNormal;
  Processo1.ProgresBar := pbThread1;
  Processo1.Tempo := StrToIntDef(edThread1Milisegundos.Text, 0);
  Processo1.LabelResultado := lblThread1Resultado;

  Processo2 := TClassThread.Create(False);
  Processo2.FreeOnTerminate := True;
  Processo2.Priority := tpNormal;
  Processo2.ProgresBar := pbThread2;
  Processo2.Tempo := StrToIntDef(edThread2Milisegundos.Text, 0);
  Processo2.LabelResultado := lblThread2Resultado;

  Processo1.Resume;
  Processo2.Resume;
end;

procedure TfrmTarefa8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Self) then
    FreeAndNil(Self);
end;

end.
