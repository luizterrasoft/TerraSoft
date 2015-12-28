unit unHistoricoContaReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, FMTBcd, SqlExpr, Provider, DB,
  DBClient, Grids, DBGrids, ComCtrls;

type
  TfrmHistoricoContaReceber = class(TForm)
    PnConta: TPanel;
    lblCliente: TLabel;
    lblOS: TLabel;
    lblValorTotal: TLabel;
    PnRodape: TPanel;
    BtnEstornar: TBitBtn;
    BtnSair: TBitBtn;
    PnHistorico: TPanel;
    GrdHistorico: TDBGrid;
    dsHistorico: TDataSource;
    cdsHistorico: TClientDataSet;
    dspHistorico: TDataSetProvider;
    qryHistorico: TSQLQuery;
    lblCli: TLabel;
    lblTitOS: TLabel;
    lblVlrTotal: TLabel;
    RchEdtObs: TRichEdit;
    lblOBS: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
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
  frmHistoricoContaReceber: TfrmHistoricoContaReceber;

implementation

uses unDM, unCondicoesPgto, unContasReceber, unPrincipal;

{$R *.dfm}

procedure TfrmHistoricoContaReceber.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmHistoricoContaReceber.BtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmHistoricoContaReceber.mostraHistorico;
begin
  with qryHistorico, SQL do
    begin
      Close;
      Clear;
      Add('SELECT his.*, con.descricao AS Conta');
      Add('FROM historicocontareceber his');
      Add('INNER JOIN contas con');
      Add('ON his.codconta = con.codigo');
      Add('WHERE his.codcontareceber = :cod');
      ParamByName('cod').AsInteger := frmContasReceber.cdsContasReceber.FieldByName('codigo').AsInteger;
      Open;
      cdsHistorico.Close;
      cdsHistorico.Open;
    end;

  TNumericField(cdsHistorico.FieldByName('valor')).DisplayFormat      := ',0.00;-,0.00';
  TNumericField(cdsHistorico.FieldByName('valoratual')).DisplayFormat := ',0.00;-,0.00'; 
end;

procedure TfrmHistoricoContaReceber.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'DATARECEBIMENTO';

  mostraHistorico;
end;

procedure TfrmHistoricoContaReceber.BtnEstornarClick(Sender: TObject);
var
  codContaReceber: integer;
  vlrRecebido: Real;
  caixa: integer;
  CodHistorico: integer;
begin
  codContaReceber := cdsHistorico.FieldByNAme('codcontareceber').AsInteger;
  vlrRecebido     := cdsHistorico.FieldBYName('valor').AsFloat;
  caixa           := cdsHistorico.FieldByName('codlancamentocaixa').AsInteger;
  CodHistorico    := cdsHistorico.FieldByName('codigo').AsInteger;

  if cdsHistorico.FieldByName('codigo').AsInteger > 0 then
    begin
      with qryHistorico, SQL do
        begin
          Close;
          Clear;
          Add('UPDATE contasreceber SET datarecebimento = null, status = :sta, valor = valorrecebido, valorrecebido = null');
          Add('WHERE codigo = :cod');
          ParamByName('cod').AsInteger := codContaReceber;
          ParamByName('sta').AsString  := 'A';
          ExecSQL();
        end;

      with qryHistorico, SQL do
        begin
          Close;
          Clear;
          Add('DELETE FROM historicocontareceber WHERE codigo = :cod');
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
      MessageDlg('Nenhum recebimento selecionado!',mtWarning,[mbOk],0);
      Exit;
    end;
end;

procedure TfrmHistoricoContaReceber.GrdHistoricoCellClick(Column: TColumn);
begin
  RchEdtObs.Text := cdsHistorico.FieldByName('obs').AsString;
end;

procedure TfrmHistoricoContaReceber.GrdHistoricoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  RchEdtObs.Text := cdsHistorico.FieldByName('obs').AsString;
end;

procedure TfrmHistoricoContaReceber.GrdHistoricoKeyPress(Sender: TObject;
  var Key: Char);
begin
  RchEdtObs.Text := cdsHistorico.FieldByName('obs').AsString;
end;

procedure TfrmHistoricoContaReceber.GrdHistoricoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  RchEdtObs.Text := cdsHistorico.FieldByName('obs').AsString;
end;

procedure TfrmHistoricoContaReceber.GrdHistoricoTitleClick(
  Column: TColumn);
begin
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraHistorico;
end;

end.
