unit unCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids, FMTBcd,
  SqlExpr, Provider, DB, DBClient, DateUtils, unFuncoes;

type
  TfrmCompras = class(TForm)
    PnConsulta: TPanel;
    PnOpcoes: TPanel;
    PnDados: TPanel;
    Label1: TLabel;
    mskInicial: TMaskEdit;
    Label2: TLabel;
    mskFinal: TMaskEdit;
    Label3: TLabel;
    edtCodFornecedor: TEdit;
    BtnBuscaFornecedor: TBitBtn;
    lblFornecedor: TLabel;
    BtnConsultar: TBitBtn;
    Label4: TLabel;
    edtNF: TEdit;
    GrdCompras: TDBGrid;
    BtnLancar: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnVisualizar: TBitBtn;
    BtnRelatorios: TBitBtn;
    BtnSair: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    dsCompras: TDataSource;
    cdsCompras: TClientDataSet;
    dspCompras: TDataSetProvider;
    qryCompras: TSQLQuery;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure edtCodFornecedorExit(Sender: TObject);
    procedure edtCodFornecedorEnter(Sender: TObject);
    procedure BtnBuscaFornecedorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdComprasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdComprasTitleClick(Column: TColumn);
    procedure BtnLancarClick(Sender: TObject);
  private
    loFuncoes: TFuncoes;
    procedure mostraCompras;
  public
    { Public declarations }
  end;

var
  frmCompras: TfrmCompras;

implementation

uses unDM, unFornecedores, unPrincipal, unIncluirCompra;

{$R *.dfm}

procedure TfrmCompras.BtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmCompras.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TfrmCompras.mostraCompras;
begin
  try
    qryCompras.Close;
    qryCompras.SQL.Clear;
    qryCompras.SQL.Add('SELECT c.*, f.razaosocial AS Fornecedor');
    qryCompras.SQL.Add('FROM compras c');
    qryCompras.SQL.Add('INNER JOIN fornecedores f');
    qryCompras.SQL.Add('ON f.codigo = c.codfornecedor');
    qryCompras.SQL.Add('WHERE dataemissao BETWEEN :dtini AND :dtfin');

    if (edtNF.Text <> trim('')) and (edtNF.Text <> '0') then
      qryCompras.SQL.Add('AND numeronf = :nf');

    if (edtCodFornecedor.Text <> trim('')) and (edtCodFornecedor.Text <> trim('')) then
      qryCompras.SQL.Add('AND codfornecedor = :forn');

    qryCompras.SQL.Add('ORDER BY '+ frmPrincipal.sCampo);

    qryCompras.ParamByName('dtini').AsDate := StrToDate(mskInicial.Text);
    qryCompras.ParamByName('dtfin').AsDate := StrToDate(mskFinal.Text);

    if (edtNF.Text <> trim('')) and (edtNF.Text <> '0') then
      qryCompras.ParamByName('nf').AsInteger := StrToInt(edtNF.Text);

    if (edtCodFornecedor.Text <> trim('')) and (edtCodFornecedor.Text <> trim('')) then
      qryCompras.ParamByName('forn').AsInteger := StrToInt(edtCodFornecedor.Text);

    qryCompras.Open;
    cdsCompras.Close;
    cdsCompras.Open;

  TNumericField(cdsCompras.FieldByName('valortotal')).DisplayFormat := ',0.00';

  except
    on e: Exception do
    raise Exception.Create('Não foi possível realizar a consulta!' + #13 + e.Message);
  end;
end;

procedure TfrmCompras.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'NUMERONF';

  mskInicial.Text := DateToStr(StartOfTheMonth(Now));
  mskFinal.Text   := DateToStr(EndOfTheMonth(Now));

  mostraCompras;
end;

procedure TfrmCompras.BtnConsultarClick(Sender: TObject);
begin
  mostraCompras;
end;

procedure TfrmCompras.edtCodFornecedorExit(Sender: TObject);
begin
  if edtCodFornecedor.Text <> trim('') then
    begin
      lblFornecedor.Caption := loFuncoes.BuscaFk(edtCodFornecedor.Text,'fornecedores','razaosocial');

      if lblFornecedor.Caption = trim('') then
        begin
          edtCodFornecedor.Clear;
          BtnBuscaFornecedor.SetFocus;
        end
      else
        BtnConsultar.SetFocus;
    end;
end;

procedure TfrmCompras.edtCodFornecedorEnter(Sender: TObject);
begin
  lblFornecedor.Caption := '';
end;

procedure TfrmCompras.BtnBuscaFornecedorClick(Sender: TObject);
begin
  frmFornecedores := TfrmFornecedores.Create(self);
  frmFornecedores.telaChamando := 11;
  frmFornecedores.ShowModal;
  FreeAndNil(frmFornecedores);

  if lblFornecedor.Caption <> trim('') then
    edtCodFornecedor.SetFocus;
end;

procedure TfrmCompras.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmCompras.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmCompras.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmCompras.GrdComprasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if State = [] then
  begin
    if cdsCompras.RecNo mod 2 = 1 then
      GrdCompras.Canvas.Brush.Color := clMoneyGreen
    else
      GrdCompras.Canvas.Brush.Color := clWhite;
  end;
  GrdCompras.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmCompras.GrdComprasTitleClick(Column: TColumn);
begin
  frmPrincipal.sCampo := Column.FieldName;

  mostraCompras;
end;

procedure TfrmCompras.BtnLancarClick(Sender: TObject);
begin
  try
    frmIncluirCompra := TfrmIncluirCompra.Create(self);
    frmIncluirCompra.OpcSal := 1;
    frmIncluirCompra.ShowModal;
    mostraCompras;
  finally
    FreeAndNil(frmIncluirCompra);
  end;
end;

end.
