unit ufTarefa7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type

  TAdicao = Function(pnA, pnB: integer): integer;
  TSubtracao = Function (pnA, pnB: integer): integer;
  TMultiplicacao = Function(pnA, pnB: integer): integer;
  TDivisao	= Function(pnA, pnB: integer): double;

  TfrmTarefa7 = class(TForm)
    rgOperacao: TRadioGroup;
    lblValor1: TLabel;
    edValor1: TEdit;
    lblValor2: TLabel;
    edValor2: TEdit;
    btnCalcular: TButton;
    edResultado: TEdit;
    lblResultado: TLabel;
    procedure btnCalcularClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FoHandle: THandle;
  public
    { Public declarations }
  end;

var
  frmTarefa7: TfrmTarefa7;

implementation

const
  iSOMAR = 0;
  iSUBTRAIR = 1;
  iMULTIPLICAR = 2;
  iDIVIDIR = 3;

{$R *.dfm}

procedure TfrmTarefa7.btnCalcularClick(Sender: TObject);
var
  oPointer: TFarProc;
  oAdicao: TAdicao;
  oSubtracao: TSubtracao;
  oMultiplicacao: TMultiplicacao;
  oDivisao: TDivisao;
  dRetorno: double;
  iValorA, iValorB: integer;
begin
  if FoHandle = 0 then
  begin
    MessageDlg('O arquivo Calculadora.dll não foi encontrado.', mtInformation, [mbOK], 0);
    Exit;
  end;

  dRetorno := 0;
  iValorA := StrToIntDef(edValor1.Text, 0);
  iValorB := StrToIntDef(edValor2.Text, 0);

  case rgOperacao.ItemIndex of
    iSOMAR:
    begin
      oPointer := GetProcAddress(FoHandle, PChar('Adicao'));
      oAdicao := TAdicao(oPointer);
      dRetorno := oAdicao(iValorA, iValorB);
    end;
    iSUBTRAIR:
    begin
      oPointer := GetProcAddress (FoHandle, PChar('Subtracao'));
      oSubtracao := TSubtracao(oPointer);
      dRetorno := oSubtracao(iValorA, iValorB);
    end;
    iMULTIPLICAR:
    begin
      oPointer := GetProcAddress (FoHandle, PChar('Multiplicacao'));
      oMultiplicacao := TMultiplicacao(oPointer);
      dRetorno := oMultiplicacao(iValorA, iValorB);
    end;
    iDIVIDIR:
    begin
      oPointer := GetProcAddress (FoHandle, PChar('Divisao'));
      oDivisao := TDivisao(oPointer);
      dRetorno := oDivisao(iValorA, iValorB);
    end;
  end;

  edResultado.Text := FormatFloat('#0.00', dRetorno);
end;

procedure TfrmTarefa7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeLibrary(FoHandle);
  if Assigned(Self) then
    FreeAndNil(Self);
end;

procedure TfrmTarefa7.FormCreate(Sender: TObject);
begin
  FoHandle := SafeLoadLibrary ('Bin\Calculadora01.dll');
end;

end.
