unit unIncluirFormaPgto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls;

type
  TfrmIncluirFormaPgto = class(TfrmCadastros)
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
  private
    { Private declarations }
  public
    procedure incluir; override;
    procedure alterar; override;
  end;

var
  frmIncluirFormaPgto: TfrmIncluirFormaPgto;

implementation

{$R *.dfm}

{ TfrmIncluirFormaPgto }

procedure TfrmIncluirFormaPgto.alterar;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE formaspgto SET descricao = :desc');
      Add('WHERE codigo = :cod');
      ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
      ParamByName('desc').AsString := edtDescricao.Text;
      ExecSQL();
    end;
end;

procedure TfrmIncluirFormaPgto.incluir;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('INSERT INTO formaspgto (descricao) VALUES (:desc)');
      ParamByName('desc').AsString := edtDescricao.Text;
      ExecSQL();
    end;
end;

end.
