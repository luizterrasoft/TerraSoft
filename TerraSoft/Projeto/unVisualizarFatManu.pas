unit unVisualizarFatManu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, FMTBcd, Provider, DBClient, DB, SqlExpr,
  StdCtrls, Buttons;

type
  TfrmVisualizarFatManu = class(TForm)
    GrdFaturamento: TDBGrid;
    qryFaturamento: TSQLQuery;
    dsFaturamento: TDataSource;
    cdsFaturamento: TClientDataSet;
    dspFaturamento: TDataSetProvider;
    BtnConsultar: TBitBtn;
    procedure GrdFaturamentoTitleClick(Column: TColumn);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
    iCodManutencao: integer;
  end;

var
  frmVisualizarFatManu: TfrmVisualizarFatManu;

implementation

uses unDM, unPrincipal;

{$R *.dfm}

procedure TfrmVisualizarFatManu.GrdFaturamentoTitleClick(Column: TColumn);
begin
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  BtnConsultarClick(self);
end;

procedure TfrmVisualizarFatManu.BtnConsultarClick(Sender: TObject);
begin
  qryFaturamento.Close;
  qryFaturamento.SQL.Clear;
  qryFaturamento.SQL.Add('SELECT vencimento,valor,status,numeroparcela');
  qryFaturamento.SQL.Add('FROM contaspagar');
  qryFaturamento.SQL.Add('WHERE codmanutencao = :cod');
  qryFaturamento.SQL.Add('ORDER BY ' + frmPrincipal.sCampo);
  qryFaturamento.ParamByName('cod').AsInteger := iCodManutencao;
  qryFaturamento.Open;
  cdsFaturamento.Close;
  cdsFaturamento.Open;
end;

procedure TfrmVisualizarFatManu.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'vencimento';
  BtnConsultarClick(self);
end;

end.
