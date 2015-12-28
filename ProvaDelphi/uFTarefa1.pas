unit uFTarefa1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, uFila;

type
  TFTarefa1 = class(TForm)
    lblInserirNaFila: TLabel;
    edtInserirFila: TEdit;
    BtnInserirFIla: TBitBtn;
    BtnRemoverUltimaItemFila: TBitBtn;
    BtnTotalItensFila: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnInserirFIlaClick(Sender: TObject);
    procedure BtnRemoverUltimaItemFilaClick(Sender: TObject);
    procedure BtnTotalItensFilaClick(Sender: TObject);
  private
    FoFila: TFila;
    
  public
    { Public declarations }
  end;

var
  FTarefa1: TFTarefa1;

implementation

{$R *.DFM}

procedure TFTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (Assigned(Fofila)) then
    FreeAndNil(FoFila);

  if (Assigned(self)) then
    FreeAndNil(self);
end;

procedure TFTarefa1.FormCreate(Sender: TObject);
begin
  FoFila := TFila.Create;
  edtInserirFila.Clear;
end;

procedure TFTarefa1.BtnInserirFIlaClick(Sender: TObject);
begin
  FoFila.InsereItem(edtInserirFila.Text);
  edtInserirFila.Clear;
  edtInserirFila.SetFocus;
end;

procedure TFTarefa1.BtnRemoverUltimaItemFilaClick(Sender: TObject);
var
  sItemRemovido: string;
begin
  sItemRemovido := FoFila.RemoveItem;
  MessageDlg('Item removido: ' + sItemRemovido, mtinformation, [mbOk], 0);
end;

procedure TFTarefa1.BtnTotalItensFilaClick(Sender: TObject);
var
  iTotalItens: integer;
begin
  iTotalItens := FoFila.TotalItens;
  MessageDlg('Total de itens: ' + (IntToStr(iTotalItens)), mtInformation, [mbOk], 0);
end;

end.
