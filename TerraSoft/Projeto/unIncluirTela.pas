unit unIncluirTela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls, unFuncoes;

type
  TfrmIncluirTela = class(TfrmCadastros)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtCaption: TEdit;
  private
    loFuncoes: TFuncoes;

  public

    procedure limpa; override;
    procedure incluir; override;
    procedure alterar; override;
  end;

var
  frmIncluirTela: TfrmIncluirTela;

implementation

{$R *.dfm}

{ TfrmIncluirTela }

procedure TfrmIncluirTela.alterar;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE formularios SET descricao=:desc,caption=:cap');
      Add('WHERE codigo = :cod');
      ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
      ParamByName('desc').AsString := edtDescricao.Text;
      ParamByName('cap').AsString := edtCaption.Text;
      ExecSQL();
    end;
end;

procedure TfrmIncluirTela.incluir;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('INSERT INTO formularios (descricao,caption)');
      Add('VALUES (:desc,:cap)');
      ParamByName('desc').AsString := edtDescricao.Text;
      ParamByName('cap').AsString := edtCaption.Text;
      ExecSQL();
    end;
end;

procedure TfrmIncluirTela.limpa;
begin
  inherited;

end;

end.
