unit unSelRelServicosEquipamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, unFuncoes, FMTBcd, Provider,
  DBClient, DB, SqlExpr;

type
  TfrmSelRelServicosEquipamentos = class(TForm)
    PnTopo: TPanel;
    PnBotoes: TPanel;
    Label1: TLabel;
    edtCodEquipamento: TEdit;
    BtnBuscaEquipamento: TBitBtn;
    lblEquipamento: TLabel;
    Label2: TLabel;
    mskInicial: TMaskEdit;
    mskFinal: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    CbxStatus: TComboBox;
    BtnGerar: TBitBtn;
    BtnSair: TBitBtn;
    qryRel: TSQLQuery;
    dsRel: TDataSource;
    cdsRel: TClientDataSet;
    dspRel: TDataSetProvider;
    procedure edtCodEquipamentoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnBuscaEquipamentoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnGerarClick(Sender: TObject);
  private
    loFuncoes: TFuncoes;
  public
    { Public declarations }
  end;

var
  frmSelRelServicosEquipamentos: TfrmSelRelServicosEquipamentos;

implementation

uses unDM, unEquipamentos, unRelServicosRealizadosPorEquipamento;

{$R *.dfm}

procedure TfrmSelRelServicosEquipamentos.edtCodEquipamentoExit(
  Sender: TObject);
begin
  if edtCodEquipamento.Text <> trim('') then
    begin
      lblEquipamento.Caption := loFuncoes.BuscaFk(edtCodEquipamento.Text,'equipamentos','descricao');

      if lblEquipamento.Caption = trim('') then
        begin
          edtCodEquipamento.Clear;
          BtnBuscaEquipamento.SetFocus;
        end
      else
        mskInicial.SetFocus;
    end;
end;

procedure TfrmSelRelServicosEquipamentos.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmSelRelServicosEquipamentos.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmSelRelServicosEquipamentos.BtnBuscaEquipamentoClick(
  Sender: TObject);
begin
  frmEquipamentos := TfrmEquipamentos.Create(self);
  frmEquipamentos.telaChamando := 10;
  frmEquipamentos.ShowModal;
  FreeAndNil(frmEquipamentos);

  if lblEquipamento.Caption <> trim('') then
    mskInicial.SetFocus;
end;

procedure TfrmSelRelServicosEquipamentos.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmSelRelServicosEquipamentos.BtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmSelRelServicosEquipamentos.BtnGerarClick(Sender: TObject);
begin
  if (edtCodEquipamento.Text = trim('')) or (edtCodEquipamento.Text = trim('0')) then
    begin
      MessageDlg('Por favor, selecione um equipamento!',mtWarning,[mbOk],0);
      edtCodEquipamento.SetFocus;
      Exit;
    end;

  if (mskInicial.Text = '  /  /    ') or (mskFinal.Text = '  /  /    ') then
    begin
      MessageDlg('Por favor, digite o per�odo corretamente!',mtWarning,[mbOk],0);
      mskInicial.SetFocus;
      Exit;
    end;

  try
    qryRel.Close;
    qryRel.SQL.Clear;
    qryRel.SQL.Add('SELECT fun.nome AS FUNC, cli.nome, ordem.status, io.horainicial, io.horafinal,');
    qryRel.SQL.Add('io.qtdhoras, io.valorhora, io.total, io.datacad, io.obs, ordem.osbloco');  
    qryRel.SQL.Add('FROM itensos io');
    qryRel.SQL.Add('INNER JOIN os ordem');
    qryRel.SQL.Add('ON io.codos = ordem.codigo');
    qryRel.SQL.Add('INNER JOIN funcionarios fun');
    qryRel.SQL.Add('ON io.codfuncionario = fun.codigo');
    qryRel.SQL.Add('INNER JOIN clientes cli');
    qryRel.SQL.Add('ON cli.codigo = ordem.codcliente');
    qryRel.SQL.Add('WHERE io.codequipamento = :equip');
    qryRel.SQL.Add('AND io.datacad BETWEEN :dtini AND :dtfin');

    if (CbxStatus.ItemIndex <> 2) and (CbxStatus.ItemIndex <> 3) then
      qryRel.SQL.Add('AND ordem.status = :sta');

    qryRel.ParamByName('equip').AsInteger := StrToInt(edtCodEquipamento.Text);

    if CbxStatus.ItemIndex <> 2 then
      begin
        if CbxStatus.ItemIndex = 0 then
          qryRel.ParamByName('sta').AsString := 'A';

        if CbxStatus.ItemIndex = 1 then
          qryRel.ParamByName('sta').AsString := 'F';
      end;

    qryRel.ParamByName('dtini').AsDate := StrToDate(mskInicial.Text);
    qryRel.ParamByName('dtfin').AsDate := StrToDate(mskFinal.Text);

    qryRel.Open;
    cdsRel.Close;
    cdsRel.Open;

    try
      frmRelServicosRealizadosPorEquipamento := TfrmRelServicosRealizadosPorEquipamento.Create(self);
      frmRelServicosRealizadosPorEquipamento.lblStatus.Caption := CbxStatus.Text;
      frmRelServicosRealizadosPorEquipamento.lblPeriodoInicial.Caption := mskInicial.Text;
      frmRelServicosRealizadosPorEquipamento.lblPeriodoFinal.Caption   := mskFinal.Text;
      frmRelServicosRealizadosPorEquipamento.lblEquipamento.Caption    := lblEquipamento.Caption;
      frmRelServicosRealizadosPorEquipamento.RlRptRelatorio.Preview();
    finally
      FreeAndNil(frmRelServicosRealizadosPorEquipamento);
    end;

  except
    MessageDlg('Erro ao gerar Relat�rio de Servi�os Realizados!',mtError,[mbOk],0);
  end;
end;

end.