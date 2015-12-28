unit unHistoricoContaPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, SqlExpr, Provider, DB, DBClient, Grids, DBGrids,
  StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TfrmHistoricoContaPagar = class(TForm)
    PnConta: TPanel;
    lblCliente: TLabel;
    lblOS: TLabel;
    lblValorTotal: TLabel;
    lblFor: TLabel;
    lblVlrTotal: TLabel;
    PnRodape: TPanel;
    lblOBS: TLabel;
    BtnEstornar: TBitBtn;
    BtnSair: TBitBtn;
    RchEdtObs: TRichEdit;
    PnHistorico: TPanel;
    GrdHistorico: TDBGrid;
    dsHistorico: TDataSource;
    cdsHistorico: TClientDataSet;
    dspHistorico: TDataSetProvider;
    qryHistorico: TSQLQuery;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnEstornarClick(Sender: TObject);
    procedure GrdHistoricoCellClick(Column: TColumn);
    procedure GrdHistoricoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdHistoricoKeyPress(Sender: TObject; var Key: Char);
    procedure GrdHistoricoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdHistoricoTitleClick(Column: TColumn);
  private
    procedure mostraHistorico;
  public
    { Public declarations }
  end;

var
  frmHistoricoContaPagar: TfrmHistoricoContaPagar;

implementation

uses unContasPagar, unPrincipal;

{$R *.dfm}

procedure TfrmHistoricoContaPagar.BtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmHistoricoContaPagar.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmHistoricoContaPagar.mostraHistorico;
begin
  with qryHistorico, SQL do
    begin
      Close;
      Clear;
      Add('SELECT his.*, con.descricao AS Conta');
      Add('FROM historicocontapagar his');
      Add('INNER JOIN contas con');
      Add('ON his.codconta = con.codigo');
      Add('WHERE his.codcontapagar = :cod');
      ParamByName('cod').AsInteger := frmContasPagar.cdsContasPagar.FieldByName('codigo').AsInteger;
      Open;
      cdsHistorico.Close;
      cdsHistorico.Open;
    end;

  TNumericField(cdsHistorico.FieldByName('valor')).DisplayFormat := ',0.00;-,0.00';
  TNumericField(cdsHistorico.FieldByName('valoratual')).DisplayFormat := ',0.00;-,0.00';
end;

procedure TfrmHistoricoContaPagar.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'DATAPAGAMENTO';

  mostraHistorico;
end;

procedure TfrmHistoricoContaPagar.BtnEstornarClick(Sender: TObject);
var
  codContaPagar: integer;
  vlrPago: Real;
  caixa: integer;
  CodHistorico: integer;
begin
  codContaPagar   := cdsHistorico.FieldByNAme('codcontaPagar').AsInteger;
  vlrPago         := cdsHistorico.FieldBYName('valor').AsFloat;
  caixa           := cdsHistorico.FieldByName('codlancamentocaixa').AsInteger;
  CodHistorico    := cdsHistorico.FieldByName('codigo').AsInteger;

  if cdsHistorico.FieldByName('codigo').AsInteger > 0 then
    begin
      with qryHistorico, SQL do
        begin
          Close;
          Clear;
          Add('UPDATE contaspagar SET datapagamento = null, status = :sta, valor = valorpago, valorpago = null');

          Add('WHERE codigo = :cod');
          ParamByName('cod').AsInteger := codContaPagar;
          ParamByName('sta').AsString  := 'A';
          //ParamByName('descontar').AsFloat := vlrPago;
          ExecSQL();
        end;

      with qryHistorico, SQL do
        begin
          Close;
          Clear;
          Add('DELETE FROM historicocontapagar WHERE codigo = :cod');
          ParamByName('cod').AsInteger := CodHistorico;
          ExecSQL();
        end;

      with qryHistorico, SQL do
        begin
          Close;
          Clear;
          Add('DELETE FROM caixa WHERE codigo = :cod');
          ParamByName('cod').AsInteger := caixa;
          ExecSQL();
        end;        

      mostraHistorico;
    end
  else
    begin
      MessageDlg('Nenhum pagamento selecionado!',mtWarning,[mbOk],0);
      Exit;
    end;
end;

procedure TfrmHistoricoContaPagar.GrdHistoricoCellClick(Column: TColumn);
begin
  RchEdtObs.Text := cdsHistorico.FieldByName('obs').AsString;
end;

procedure TfrmHistoricoContaPagar.GrdHistoricoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  RchEdtObs.Text := cdsHistorico.FieldByName('obs').AsString;
end;

procedure TfrmHistoricoContaPagar.GrdHistoricoKeyPress(Sender: TObject;
  var Key: Char);
begin
  RchEdtObs.Text := cdsHistorico.FieldByName('obs').AsString;
end;

procedure TfrmHistoricoContaPagar.GrdHistoricoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  RchEdtObs.Text := cdsHistorico.FieldByName('obs').AsString;
end;

procedure TfrmHistoricoContaPagar.GrdHistoricoTitleClick(Column: TColumn);
begin
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraHistorico;
end;

end.
