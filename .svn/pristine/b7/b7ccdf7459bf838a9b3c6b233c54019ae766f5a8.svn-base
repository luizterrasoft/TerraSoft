unit ufTarefa6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  EArquivoNaoEncontrado = class(Exception);
  ELinhaDadosVazia = class(Exception);

  TfrmTarefa6 = class(TForm)
    lblArquivoTexto: TLabel;
    edArquivoTexto: TEdit;
    btnProcurarArquivoTexto: TButton;
    btnCalcularArquivo: TButton;
    lblValorTotalCalculado: TLabel;
    edValorCalculado: TEdit;
    opDlgAbrir: TOpenDialog;
    procedure btnProcurarArquivoTextoClick(Sender: TObject);
    procedure btnCalcularArquivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  sARQUIVO_NAO_ENCONTRADO = 'Arquivo não encontrado';
  sLINHA_VAZIA = 'Linha de dados inválida';
  sVALOR_ALFANUMERICO = 'Valor alfanumérico encontrado';

implementation

{$R *.dfm}

procedure TfrmTarefa6.btnProcurarArquivoTextoClick(Sender: TObject);
begin
  if opDlgAbrir.Execute then
    edArquivoTexto.Text := opDlgAbrir.FileName;
end;

procedure TfrmTarefa6.btnCalcularArquivoClick(Sender: TObject);
var
  oLista: TStringList;
  i, j, iTotal: integer;
  sLinha: string;
begin
  oLista := TStringList.Create;
  try
    try
      iTotal := 0;
      oLista.LoadFromFile(edArquivoTexto.Text);
      for i := 0 to oLista.Count - 1 do
      begin
        if (Trim(oLista[i]) = '') then
          raise(ELinhaDadosVazia.Create(sLINHA_VAZIA))
        else
        begin
          sLinha := Trim(oLista[i]);
          for j := 1 to length(sLinha) do
            iTotal := iTotal + StrToInt(sLinha[j]);
        end;
      end;
    except
      on E: ELinhaDadosVazia do
      begin
        raise;
      end;

      on E: EfOpenError do
      begin
        raise(EArquivoNaoEncontrado.Create(sARQUIVO_NAO_ENCONTRADO));
      end;

      on E: EConvertError do
      begin
        raise exception.create(sVALOR_ALFANUMERICO);
      end;

      on E: Exception do
      begin
        raise exception.create('Ocorreu uma falha no Sistema: ' + E.Message +
          #13 + 'Característica: ' + E.ClassName);
      end;
    end;
  finally
    FreeAndNil(oLista);
  end;

  edValorCalculado.Text := IntToStr(iTotal);
end;

end.
