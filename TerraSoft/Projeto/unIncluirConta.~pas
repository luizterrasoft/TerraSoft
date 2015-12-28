unit unIncluirConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls, unFuncoes;

type
  TfrmIncluirConta = class(TfrmCadastros)
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
  private
    loFuncoes: TFuncoes;
  public
    procedure incluir; override;
    procedure alterar; override;
  end;

var
  frmIncluirConta: TfrmIncluirConta;

implementation

{$R *.dfm}

{ TfrmIncluirConta }

procedure TfrmIncluirConta.alterar;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE contas SET descricao = :desc');
      Add('WHERE codigo = :cod');
      ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
      ParamByName('desc').AsString := edtDescricao.Text;
      ExecSQL();
    end;
end;

procedure TfrmIncluirConta.incluir;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('INSERT INTO contas (descricao) VALUES (:desc)');
      ParamByName('desc').AsString:= edtDescricao.Text;
      ExecSQL();
    end;
end;

end.
