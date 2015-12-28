unit unEntradasCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ACBrBase,
  ACBrDFe, Mask, ACBrNFe;

type
  TfrmEntradasCompras = class(TForm)
    PnCabecalho: TPanel;
    BtnBuscaXML: TBitBtn;
    PgCtrlPrincipal: TPageControl;
    TbShDadosPrincipais: TTabSheet;
    TbShItens: TTabSheet;
    TbShFaturamento: TTabSheet;
    OpDlg: TOpenDialog;
    edtChaveNFe: TEdit;
    lblChaveNFe: TLabel;
    Label1: TLabel;
    TbShTransporte: TTabSheet;
    edtNatureza: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtModelo: TEdit;
    Label4: TLabel;
    edtSerie: TEdit;
    Label5: TLabel;
    edtNumero: TEdit;
    mskDataHoraEmissao: TMaskEdit;
    Label6: TLabel;
    NFe: TACBrNFe;
    procedure BtnBuscaXMLClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private

    sCaminhoXML: String;
  public
    { Public declarations }
  end;

var
  frmEntradasCompras: TfrmEntradasCompras;

implementation

{$R *.dfm}

procedure TfrmEntradasCompras.BtnBuscaXMLClick(Sender: TObject);
begin
  { PROCURA O ARQUIVO XML }
  if (OpDlg.Execute) then
    NFe.NotasFiscais.LoadFromFile(OpDlg.FileName);

    edtChaveNFe.Text := NFe.NotasFiscais.Items[0].NFe.infNFe.ID; // Chave de Acesso

    edtNatureza.Text := Nfe.NotasFiscais.Items[0].NFe.Ide.natOp; // Natureza
    edtModelo.Text   := IntToStr(NFe.NotasFiscais.Items[0].NFe.Ide.modelo);
    edtSerie.Text    := IntToStr(NFe.NotasFiscais.Items[0].NFe.Ide.serie);
    edtNumero.Text   := IntToStr(NFe.NotasFiscais.Items[0].NFe.Ide.nNF);
    mskDataHoraEmissao.Text := DateToStr(NFe.NotasFiscais.Items[0].NFe.Ide.dEmi);
    
    

    Exit;


end;

procedure TfrmEntradasCompras.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
    Self.Close;
end;

end.
