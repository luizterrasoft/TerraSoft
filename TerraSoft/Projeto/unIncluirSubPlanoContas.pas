unit unIncluirSubPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls, unFuncoes;

type
  TfrmIncluirSubPlanoContas = class(TfrmCadastros)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblPlanoConta: TLabel;
    edtCodigo: TEdit;
    edtSequencial: TEdit;
    edtDescricao: TEdit;
    edtCodPlanoConta: TEdit;
    BtnBuscaPlanoConta: TBitBtn;
    procedure edtCodPlanoContaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtCodPlanoContaEnter(Sender: TObject);
    procedure BtnBuscaPlanoContaClick(Sender: TObject);
  private
    loFuncoes: TFuncoes;
  public
    procedure limpa; override;
    procedure incluir; override;
    procedure alterar; override;
  end;

var
  frmIncluirSubPlanoContas: TfrmIncluirSubPlanoContas;

implementation

uses unPlanoContas;

{$R *.dfm}

procedure TfrmIncluirSubPlanoContas.alterar;
begin
  inherited;
  qryPadrao.Close;
  qryPadrao.SQL.Clear;
  qryPadrao.SQL.Add('UPDATE subplanocontas SET sequencial =:seq, descricao =:desc');

  if (edtCodPlanoConta.Text <> trim('')) and (edtCodPlanoConta.Text <> trim('0')) then
    qryPadrao.SQL.Add(',codplanoconta = :codpla');

  qryPadrao.SQL.Add('WHERE codigo = :cod');
  qryPadrao.ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
  qryPadrao.ParamByName('seq').AsString  := edtSequencial.Text;
  qryPadrao.ParamByName('desc').AsString := edtDescricao.Text;

  if (edtCodPlanoConta.Text <> trim('')) and (edtCodPlanoConta.Text <> trim('0')) then
    qryPadrao.ParamByName('codpla').AsInteger := StrToInt(edtCodPlanoConta.Text);
    
  qryPadrao.Prepared := True;
  qryPadrao.ExecSQL();
end;

procedure TfrmIncluirSubPlanoContas.edtCodPlanoContaExit(Sender: TObject);
begin
  inherited;
  if edtCodPlanoConta.Text <> trim('') then
    begin
      lblPlanoConta.Caption := loFuncoes.BuscaFk(edtCodPlanoConta.Text,'planocontas','descricao');

      if lblPlanoConta.Caption = trim('') then
        begin
          edtCodPlanoConta.Clear;
          BtnBuscaPlanoConta.SetFocus;
        end
      else
        BtnGravar.SetFocus;
    end;
end;

procedure TfrmIncluirSubPlanoContas.incluir;
begin
  inherited;
  qryPadrao.Close;
  qryPadrao.SQL.Clear;
  qryPadrao.SQL.Add('INSERT INTO subplanocontas (sequencial,descricao');

  if (edtCodPlanoConta.Text <> trim('')) and (edtCodPlanoConta.Text <> trim('0')) then
    qryPadrao.SQL.Add(',codplanoconta)')
  else
    qryPadrao.SQL.Add(')');

  qryPadrao.SQL.Add('VALUES (:seq,:desc');

  if (edtCodPlanoConta.Text <> trim('')) and (edtCodPlanoConta.Text <> trim('0')) then
    qryPadrao.SQL.Add(',:codpla)')
  else
    qryPadrao.SQL.Add(')');

  qryPadrao.ParamByName('seq').AsString  := edtSequencial.Text;
  qryPadrao.ParamByName('desc').AsString := edtDescricao.Text;

  if (edtCodPlanoConta.Text <> trim('')) and (edtCodPlanoConta.Text <> trim('0')) then
    qryPadrao.ParamByName('codpla').AsInteger := StrToInt(edtCodPlanoConta.Text);
    
  qryPadrao.Prepared := True;
  qryPadrao.ExecSQL();
end;

procedure TfrmIncluirSubPlanoContas.limpa;
begin
  inherited;
  lblPlanoConta.Caption := '';
end;

procedure TfrmIncluirSubPlanoContas.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmIncluirSubPlanoContas.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmIncluirSubPlanoContas.edtCodPlanoContaEnter(Sender: TObject);
begin
  inherited;
  lblPlanoConta.Caption := '';
end;

procedure TfrmIncluirSubPlanoContas.BtnBuscaPlanoContaClick(
  Sender: TObject);
begin
  inherited;
  frmPlanoContas := TfrmPlanoContas.Create(self);
  frmPlanoContas.telaChamando := 6;
  frmPlanoContas.ShowModal;
  FreeAndNil(frmPlanoContas);

  if lblPlanoConta.Caption <> trim('') then
    BtnGravar.SetFocus;
end;

end.
