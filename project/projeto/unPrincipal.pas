unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Menus, jpeg, StdCtrls, Buttons;

type
  TfrmPrincipal = class(TForm)
    StBarPrincipal: TStatusBar;
    PnBotoes: TPanel;
    MnuPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Movimentaes1: TMenuItem;
    Financeiro1: TMenuItem;
    Relatrios1: TMenuItem;
    Utilitrios1: TMenuItem;
    Configuraes1: TMenuItem;
    Ajuda1: TMenuItem;
    Image1: TImage;
    SpBtnPessoas: TSpeedButton;
    procedure SpBtnPessoasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses unConsulta, unConPessoas;

{$R *.dfm}

procedure TfrmPrincipal.SpBtnPessoasClick(Sender: TObject);
begin
  try
    frmConPessoas := TfrmConPessoas.Create(self);
    frmConPessoas.ShowModal;
  finally
    FreeAndNil(frmConPessoas);
  end;
end;

end.