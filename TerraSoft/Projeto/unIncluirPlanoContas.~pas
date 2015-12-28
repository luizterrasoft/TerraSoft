unit unIncluirPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls, unFuncoes;

type
  TfrmIncluirPlanoContas = class(TfrmCadastros)
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    Label3: TLabel;
    edtSequencial: TEdit;
  private
    loFuncoes: TFuncoes;
  public
    procedure incluir; override;
    procedure alterar; override;
  end;

var
  frmIncluirPlanoContas: TfrmIncluirPlanoContas;

implementation

{$R *.dfm}

{ TfrmIncluirPlanoContas }

procedure TfrmIncluirPlanoContas.alterar;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE planocontas SET sequencial=:seq, descricao = :desc');
      Add('WHERE codigo = :cod');
      ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
      ParamByName('seq').AsString  := edtSequencial.Text;
      ParamByName('desc').AsString := edtDescricao.Text;
      ExecSQL();
    end;
end;

procedure TfrmIncluirPlanoContas.incluir;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('INSERT INTO planocontas (sequencial,descricao) VALUES (:seq,:desc)');
      ParamByName('seq').AsString := edtSequencial.Text;
      ParamByName('desc').AsString:= edtDescricao.Text;
      ExecSQL();
    end;
end;

end.
