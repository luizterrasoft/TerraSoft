unit unIncluirServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls, unFuncoes;

type
  TfrmIncluirServico = class(TfrmCadastros)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtUnidade: TEdit;
    edtValor: TEdit;
    procedure edtValorExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

    loFuncoes: TFuncoes;
    procedure incluir; override;
    procedure alterar; override;
  public
    { Public declarations }
  end;

var
  frmIncluirServico: TfrmIncluirServico;

implementation

{$R *.dfm}

procedure TfrmIncluirServico.alterar;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE servicos SET descricao=:desc,unidade=:unid,valor=:valo');
      Add('WHERE codigo = :cod');
      ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
      ParamByName('desc').AsString := edtDescricao.Text;
      ParamByName('unid').AsString := edtUnidade.Text;
      ParamByName('valo').AsFloat  := StrToFloat(edtValor.Text);
      ExecSQL();
    end;
end;

procedure TfrmIncluirServico.edtValorExit(Sender: TObject);
begin
  inherited;
  if (edtValor.Text <> trim('')) and (edtValor.Text <> trim('0')) then
    edtValor.Text := loFuncoes.TrataReal(edtValor.Text);
end;

procedure TfrmIncluirServico.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmIncluirServico.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmIncluirServico.incluir;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('INSERT INTO servicos (descricao,unidade,valor)');
      Add('VALUES (:desc,:unid,:valo)');
      ParamByName('desc').AsString := edtDescricao.Text;
      ParamByName('unid').AsString := edtUnidade.Text;
      ParamByName('valo').AsFloat  := StrToFloat(edtValor.Text);
      ExecSQL();
    end;
end;

end.
