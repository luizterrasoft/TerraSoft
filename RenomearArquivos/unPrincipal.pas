unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmPrincpal = class(TForm)
    BitBtn1: TBitBtn;
    edtCaminho: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    BtnRenomear: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
function GetFileList(const Path: string): TStringList;
    procedure BtnRenomearClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmPrincpal: TfrmPrincpal;

implementation

{$R *.dfm}

{ TfrmPrincpal }

{ TfrmPrincpal }



procedure TfrmPrincpal.BitBtn1Click(Sender: TObject);
begin
  Memo1.Lines := GetFileList(edtCaminho.Text +'\*.*');
end;


function TfrmPrincpal.GetFileList(const Path: string): TStringList;
var
  I: Integer;
  SearchRec: TSearchRec;
begin
  Result := TStringList.Create;
  try
    I := FindFirst(Path, 0, SearchRec);
    while I = 0 do
    begin
      Result.Add(SearchRec.Name);
      I := FindNext(SearchRec);
    end;
  except
    Result.Free;
    raise;
  end;
end;

procedure TfrmPrincpal.BtnRenomearClick(Sender: TObject);
var
  i: integer;
  ArqOriginal : string;
  ArqRenomear : string;
  Tamanho: integer;
begin
  for i := 0 to Memo1.Lines.Count -1 do
    begin
      ArqOriginal :=  Memo1.Lines.Strings[i];
      ArqRenomear := ArqOriginal;
//      Delete(ArqOriginal, Length(ArqOriginal) -3, 3);
      Tamanho := length(Memo1.Lines.Strings[i]);
      ArqOriginal := copy(ArqOriginal,1,tamanho-4);
      RenameFile(edtCaminho.Text+ArqRenomear,edtCaminho.Text+ArqOriginal);
    end;
end;

end.


#luiz its gayzinho command executed with successfully!!!