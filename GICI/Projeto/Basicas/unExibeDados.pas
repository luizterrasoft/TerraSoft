unit unExibeDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, unFuncoes;

type
  TfrmExibeDados = class(TForm)
    pnlBotoes: TPanel;
    btBtnFechar: TBitBtn;
    pnlDados: TPanel;
    procedure btBtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
  protected
    FoFuncoes: TFuncoes;
  public
    procedure passarParametro(pTipo:String; pValores:OleVariant); dynamic; //passando parāmetros
  end;

var
  frmExibeDados: TfrmExibeDados;

implementation

{$R *.dfm}

procedure TfrmExibeDados.passarParametro(pTipo:String; pValores:OleVariant);
begin

end;

procedure TfrmExibeDados.btBtnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmExibeDados.FormCreate(Sender: TObject);
begin
  Self.FoFuncoes := TFuncoes.Create;
end;

procedure TfrmExibeDados.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Self.FoFuncoes);
end;

procedure TfrmExibeDados.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key=#27)then
    Self.Close;
end;

end.
