unit unIncluirCondicaoPgto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls;

type
  TfrmIncluirCondicaoPgto = class(TfrmCadastros)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtQtdParcelas: TEdit;
    edtDiasEntrePrestacoes: TEdit;
    edtDias1Vcto: TEdit;
    ChBxAvista: TCheckBox;
  private
    { Private declarations }
  public
    procedure incluir; override;
    procedure alterar; override;
  end;

var
  frmIncluirCondicaoPgto: TfrmIncluirCondicaoPgto;

implementation

{$R *.dfm}

{ TfrmIncluirCondicaoPgto }

procedure TfrmIncluirCondicaoPgto.alterar;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE condicoespgto SET descricao=:desc,qtdparcelas=:parc,diasentreprestacoes=:dias,');
      Add('ndiasprimeirovcto=:vcto');
      Add('WHERE codigo = :cod');
      ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
      ParamByName('desc').AsString := edtDescricao.Text;
      ParamByName('parc').AsInteger:= StrToInt(edtQtdParcelas.Text);
      ParamByName('dias').AsInteger:= StrToInt(edtDiasEntrePrestacoes.Text);
      ParamByName('vcto').AsInteger:= StrToInt(edtDias1Vcto.Text);
      ExecSQL();
    end;
end;

procedure TfrmIncluirCondicaoPgto.incluir;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('INSERT INTO condicoespgto (descricao,qtdparcelas,diasentreprestacoes,ndiasprimeirovcto,avista)');
      Add('VALUES (:desc,:parc,:dias,:vcto,:avista)');
      ParamByName('desc').AsString := edtDescricao.Text;
      ParamByName('parc').AsInteger:= StrToInt(edtQtdParcelas.Text);
      ParamByName('dias').AsInteger:= StrToInt(edtDiasEntrePrestacoes.Text);
      ParamByName('vcto').AsInteger:= StrToInt(edtDias1Vcto.Text);

      if ChBxAvista.Checked = true then
        ParamByName('avista').AsString := 'S'
      else
        ParamByName('avista').AsString := 'N';

      ExecSQL();      
    end;
end;

end.
