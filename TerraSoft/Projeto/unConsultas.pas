unit unConsultas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, FMTBcd, Provider, DBClient, DB,
  SqlExpr;

type
  TfrmConsultas = class(TForm)
    PnTitulo: TPanel;
    PnConsulta: TPanel;
    PnDados: TPanel;
    PnAcoes: TPanel;
    lblTitulo: TLabel;
    Label1: TLabel;
    BtnIncluir: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnSair: TBitBtn;
    edtConsulta: TEdit;
    qryDados: TSQLQuery;
    dsDados: TDataSource;
    cdsDados: TClientDataSet;
    dspDados: TDataSetProvider;
    Label2: TLabel;
    BtnRelatorios: TBitBtn;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public

    sSQL: string;
    operacao: integer;
    FForm: TForm;

    procedure carregaDados; dynamic; abstract;
    procedure mostraTodos; dynamic;
  end;

var
  frmConsultas: TfrmConsultas;

implementation

uses unDM, unCadastros, unPrincipal;

{$R *.dfm}

procedure TfrmConsultas.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultas.BtnAlterarClick(Sender: TObject);
begin
  frmPrincipal.iOperacao := 2;

  carregaDados;
end;

procedure TfrmConsultas.BtnExcluirClick(Sender: TObject);
begin
  //
end;

procedure TfrmConsultas.BtnIncluirClick(Sender: TObject);
begin
  frmPrincipal.iOperacao := 1;

  mostraTodos;
end;

procedure TfrmConsultas.mostraTodos;
begin
  with qryDados, SQL do
    begin
      Close;
      Clear;
      Add(sSQL);
      Open;
    end;

  cdsDados.Close;
  cdsDados.Open;
  cdsDados.Refresh;
end;

procedure TfrmConsultas.FormShow(Sender: TObject);
begin
  mostraTodos;
end;

procedure TfrmConsultas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
    Self.Close;

  if key = vk_f2 then
    BtnIncluir.Click;

  if key = vk_f3 then
    BtnAlterar.Click;

  if key = VK_F6 then
    edtConsulta.SetFocus;
end;

end.
