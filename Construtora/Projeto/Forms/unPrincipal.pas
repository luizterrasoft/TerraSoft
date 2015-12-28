unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFuncoes;

type
  TfrmPrincipal = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    loFuncoes: TFuncoes;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  try
    if not(loFuncoes.AlimentaVariaveisConfig) then
      begin
        MessageDlg('O sistema não conseguiu carregar suas configurações iniciais!',mtWarning,[mbOk],0);
        Application.Terminate;
      end;
  finally
    loFuncoes.Free;
  end;
end;

end.
