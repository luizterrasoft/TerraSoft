unit unIncluirRegioes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls;

type
  TfrmIncluirRegioes = class(TfrmCadastros)
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
  private
    procedure incluir; override;
    procedure alterar; override;
  public
    { Public declarations }
  end;

var
  frmIncluirRegioes: TfrmIncluirRegioes;

implementation

{$R *.dfm}

{ TfrmIncluirRegioes }

procedure TfrmIncluirRegioes.alterar;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE regioes SET descricao=:desc WHERE codigo = :cod');
      ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
      ParamByName('desc').AsString := edtDescricao.Text;
      ExecSQL();
    end;
end;

procedure TfrmIncluirRegioes.incluir;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('INSERT INTO regioes (descricao) VALUES (:desc)');
      ParamByName('desc').AsString := edtDescricao.Text;
      ExecSQL();
    end;
end;

end.
