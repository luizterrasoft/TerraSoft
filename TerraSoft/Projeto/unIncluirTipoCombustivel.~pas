unit unIncluirTipoCombustivel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls;

type
  TfrmIncluirTipoCombustivel = class(TfrmCadastros)
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtDescricao: TEdit;
  private
    { Private declarations }
  public
    procedure limpa; override;
    procedure incluir; override;
    procedure alterar; override;
  end;

var
  frmIncluirTipoCombustivel: TfrmIncluirTipoCombustivel;

implementation

{$R *.dfm}

{ TfrmIncluirTipoCombustivel }

procedure TfrmIncluirTipoCombustivel.alterar;
begin
  inherited;
  qryPadrao.Close;
  qryPadrao.SQL.Clear;
  qryPadrao.SQL.Add('UPDATE tiposcombustiveis SET descricao = :desc');
  qryPadrao.SQL.Add('WHERE codigo = :cod');
  qryPadrao.ParamByName('desc').AsString := edtDescricao.Text;
  qryPadrao.ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
  qryPadrao.ExecSQL();
end;

procedure TfrmIncluirTipoCombustivel.incluir;
begin
  inherited;
  qryPadrao.Close;
  qryPadrao.SQL.Clear;
  qryPadrao.SQL.Add('INSERT INTO tiposcombustiveis (descricao) VALUES (:desc)');
  qryPadrao.ParamByName('desc').AsString := edtDescricao.Text;
  qryPadrao.ExecSQL();
end;

procedure TfrmIncluirTipoCombustivel.limpa;
begin
  inherited;

end;

end.
