unit unCreditosCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, Provider, DBClient, DB, SqlExpr, Grids, DBGrids,
  StdCtrls, Buttons;

type
  TfrmCreditosCliente = class(TForm)
    GrdCreditos: TDBGrid;
    dsCreditos: TDataSource;
    QryCreditos: TSQLQuery;
    cdsCreditos: TClientDataSet;
    dspCreditos: TDataSetProvider;
    BtnIncluir: TBitBtn;
    BtnSair: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    lblCliente: TLabel;
    lblSaldo: TLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
  private
    procedure mostraCreditos;
  public
    iCodCliente: integer;
  end;

var
  frmCreditosCliente: TfrmCreditosCliente;

implementation

uses unDM, unIncluirCreditosCliente;

{$R *.dfm}

procedure TfrmCreditosCliente.BtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmCreditosCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmCreditosCliente.mostraCreditos;
begin
  try
    QryCreditos.Close;
    QryCreditos.SQL.Clear;
    QryCreditos.SQL.Add('SELECT cli.nome, cred.codigo, cred.descricao, cred.entrada,');
    QryCreditos.SQL.Add('cred.saida, cred.saldo');
    QryCreditos.SQL.Add('FROM creditoscliente cred');
    QryCreditos.SQL.Add('INNER JOIN clientes cli');
    QryCreditos.SQL.Add('ON cli.codigo = cred.codcliente');
    QryCreditos.SQL.Add('WHERE cred.codcliente = :cli');
    QryCreditos.ParamByName('cli').AsInteger := iCodCliente;

    QryCreditos.Open;

    cdsCreditos.Close;
    cdsCreditos.Open;
    cdsCreditos.Last;

    lblSaldo.Caption := FormatFloat('##,###,##0.00',cdsCreditos.FieldByName('saldo').AsFloat);

    TNumericField(cdsCreditos.FieldByName('entrada')).DisplayFormat := ',0.00';
    TNumericField(cdsCreditos.FieldByName('saida')).DisplayFormat := ',0.00';
    TNumericField(cdsCreditos.FieldByName('saldo')).DisplayFormat := ',0.00';
  except

  end;
end;

procedure TfrmCreditosCliente.FormShow(Sender: TObject);
begin
  mostraCreditos;
end;

procedure TfrmCreditosCliente.BtnIncluirClick(Sender: TObject);
begin
  try
    frmIncluirCreditosCliente := TfrmIncluirCreditosCliente.Create(self);
    
      try
        frmIncluirCreditosCliente.cSaldoAtual := StrToFloat(lblSaldo.Caption);
        frmIncluirCreditosCliente.iCodCliente := iCodCliente;
      except

      end;

    frmIncluirCreditosCliente.ShowModal;
  finally
    FreeAndNil(frmIncluirCreditosCliente);
  end;
end;

end.
