unit ufTarefa1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uFila;

type
  TfrmTarefa1 = class(TForm)
    edInserirFila: TEdit;
    lblInserirNaFila: TLabel;
    btnInserirNaFila: TButton;
    btnRemoverUltimoDaFila: TButton;
    btnTotalItensNaFila: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirNaFilaClick(Sender: TObject);
    procedure btnRemoverUltimoDaFilaClick(Sender: TObject);
    procedure btnTotalItensNaFilaClick(Sender: TObject);
  private
    FoFila: TFila;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FoFila) then
    FreeAndNil(FoFila);

  if Assigned(Self) then
    FreeAndNil(Self);
end;

procedure TfrmTarefa1.FormCreate(Sender: TObject);
begin
  FoFila:= TFila.Create;
  edInserirFila.Clear;
end;

procedure TfrmTarefa1.btnInserirNaFilaClick(Sender: TObject);
begin
  FoFila.InsereItem(edInserirFila.Text);
  edInserirFila.Clear;
  edInserirFila.SetFocus;
end;

procedure TfrmTarefa1.btnRemoverUltimoDaFilaClick(Sender: TObject);
var
  sItemRemovido: String;
begin
  sItemRemovido := FoFila.RemoveItem;
  MessageDlg('Item removido: ' + sItemRemovido, mtInformation, [mbOK], 0);
end;

procedure TfrmTarefa1.btnTotalItensNaFilaClick(Sender: TObject);
var
  nTotalItens: Integer;
begin
  nTotalItens := FoFila.TotalItens;
  MessageDlg('Total de itens: ' + IntToStr(nTotalItens), mtInformation, [mbOK], 0);
end;

end.
