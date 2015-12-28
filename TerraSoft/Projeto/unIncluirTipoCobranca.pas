unit unIncluirTipoCobranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls;

type
  TfrmIncluirTipoCobranca = class(TfrmCadastros)
    lblcodigo: TLabel;
    lblDescricao: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
  private
    { Private declarations }
  public
    procedure limpa; override;
    procedure incluir; override;
    procedure alterar; override;
  end;

var
  frmIncluirTipoCobranca: TfrmIncluirTipoCobranca;

implementation

{$R *.dfm}

{ TfrmIncluirTipoCobranca }

procedure TfrmIncluirTipoCobranca.alterar;
begin
  inherited;
  qryPadrao.Close;
  qryPadrao.SQL.Clear;
  qryPadrao.SQL.Add('UPDATE tipocobranca SET descricao = :desc');
  qryPadrao.SQL.Add('WHERE codigo = :cod');
  qryPadrao.ParamByName('desc').AsString := edtDescricao.Text;
  qryPadrao.ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
  qryPadrao.ExecSQL();
end;

procedure TfrmIncluirTipoCobranca.incluir;
begin
  inherited;  
  qryPadrao.Close;
  qryPadrao.SQL.Clear;
  qryPadrao.SQL.Add('INSERT INTO tipocobranca (descricao) VALUES (:desc)');
  qryPadrao.ParamByName('desc').AsString := edtDescricao.Text;
  qryPadrao.ExecSQL();
end;

procedure TfrmIncluirTipoCobranca.limpa;
begin
  inherited;

end;

end.
