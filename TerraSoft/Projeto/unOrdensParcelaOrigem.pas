unit unOrdensParcelaOrigem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, SqlExpr, Provider, DB, DBClient, StdCtrls, Grids,
  DBGrids, Buttons;

type
  TfrmOrdensParcelaOrigem = class(TForm)
    Label1: TLabel;
    dsOrdens: TDataSource;
    cdsOrdens: TClientDataSet;
    dspOrdens: TDataSetProvider;
    qryOrdens: TSQLQuery;
    GrdOrdens: TDBGrid;
    BtnSair: TBitBtn;
    BtnVisualizar: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    iCodPrestacao: integer;
  end;

var
  frmOrdensParcelaOrigem: TfrmOrdensParcelaOrigem;

implementation

uses unDM, unIncluirOS;

{$R *.dfm}

procedure TfrmOrdensParcelaOrigem.BtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmOrdensParcelaOrigem.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then
    BtnSairClick(self);
end;

procedure TfrmOrdensParcelaOrigem.FormShow(Sender: TObject);
begin
  qryOrdens.Close;
  qryOrdens.SQL.Clear;
  qryOrdens.SQL.Add('SELECT codos FROM renegociacoescr');
  qryOrdens.SQL.Add('WHERE codnovaconta = :con');
  qryOrdens.ParamByName('con').AsInteger := iCodPrestacao;
  qryOrdens.Open;
  cdsOrdens.Close;
  cdsOrdens.Open;
end;

procedure TfrmOrdensParcelaOrigem.BtnVisualizarClick(Sender: TObject);
begin
  try
    frmIncluirOS := TfrmIncluirOS.Create(self);
    frmIncluirOS.codOS    := cdsOrdens.FieldByName('codos').AsInteger;
    frmIncluirOS.operacao := 3; // visualizar
    frmIncluirOS.ShowModal;
  finally
    FreeAndNil(frmIncluirOS);
  end;
end;

end.
