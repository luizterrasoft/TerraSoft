unit unIncluirMunicipio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls, Mask;

type
  TfrmIncluirMunicipio = class(TfrmCadastros)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    edtCodMunicipio: TEdit;
    edtCodIBGE: TEdit;
    mskCEP: TMaskEdit;
    ChBxCEPUnico: TCheckBox;
    CbxUF: TComboBox;
  private
    { Private declarations }
  public
    procedure incluir; override;
    procedure alterar; override;
  end;

var
  frmIncluirMunicipio: TfrmIncluirMunicipio;

implementation

{$R *.dfm}

{ TfrmIncluirMunicipio }

procedure TfrmIncluirMunicipio.alterar;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE municipios SET nome=:nom,uf=:uf,cepunico=:cepu,cep=:cep,');
      Add('codmunicipio=:codmun,codibge=:codibge');
      Add('WHERE codigo = :cod');
      ParamByName('cod').AsInteger  := StrToInt(edtCodigo.Text);
      ParamByName('nom').AsString   := edtNome.Text;
      ParamByName('uf').AsString    := CbxUF.Text;

      if ChBxCEPUnico.Checked = true then
        ParamByName('cepu').AsString := 'S'
      else
        ParamByName('cepu').AsString := 'N';

      ParamByName('cep').AsString     := mskCEP.Text;
      ParamByName('codmun').AsString  := edtCodMunicipio.Text;
      ParamByName('codibge').AsString := edtCodIBGE.Text;
      ExecSQL();
    end;
end;

procedure TfrmIncluirMunicipio.incluir;
begin
  inherited;
  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('INSERT INTO municipios (nome,uf,cepunico,cep,codmunicipio,codibge)');
      Add('VALUES (:nom,:uf,:cepu,:cep,:codmun,:codibge)');
      ParamByName('nom').AsString := edtNome.Text;
      ParamByName('uf').AsString  := CbxUF.Text;

      if ChBxCEPUnico.Checked then
        ParamByName('cepu').AsString := 'S'
      else
        ParamByName('cepu').AsString := 'N';

      ParamByName('cep').AsString := mskCEP.Text;
      ParamByName('codmun').AsString := edtCodMunicipio.Text;
      ParamByName('codibge').AsString := edtCodIBGE.Text;
      ExecSQL();
    end;
end;

end.
