unit unIncluirAgendamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, FMTBcd, Provider, DBClient, DB,
  SqlExpr, unFuncoes, Mask;

type
  TfrmIncluirAgendamento = class(TForm)
    PnTopo: TPanel;
    PnRdape: TPanel;
    PnDados: TPanel;
    lblTitulo: TLabel;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtDescricao: TEdit;
    Label4: TLabel;
    edtCodEquipamento: TEdit;
    lblEquipamento: TLabel;
    BtnBuscaEquipamento: TBitBtn;
    Label5: TLabel;
    CbxStatus: TComboBox;
    qryAgenda: TSQLQuery;
    qryAux: TSQLQuery;
    dsAgenda: TDataSource;
    dsAux: TDataSource;
    cdsAgenda: TClientDataSet;
    cdsAux: TClientDataSet;
    dspAgenda: TDataSetProvider;
    dspAux: TDataSetProvider;
    Label8: TLabel;
    CbxTipoControl: TComboBox;
    GrBxPorHoraKM: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtQtdHoras: TEdit;
    edtAvisar: TEdit;
    GrBxControlePorData: TGroupBox;
    Label9: TLabel;
    mskData: TMaskEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnGravarClick(Sender: TObject);
    procedure edtCodEquipamentoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtCodEquipamentoEnter(Sender: TObject);
    procedure BtnBuscaEquipamentoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnBuscaManutencaoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    loFuncoes: TFuncoes;
  public
    opcSal: integer; 
  end;

var
  frmIncluirAgendamento: TfrmIncluirAgendamento;

implementation

uses unDM, unEquipamentos, unManutencoes, unAgendaManu;

{$R *.dfm}

procedure TfrmIncluirAgendamento.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmIncluirAgendamento.BtnGravarClick(Sender: TObject);
begin
  if opcSal = 1 then
    begin
      with qryAgenda, SQL do
        begin
          Close;
          Clear;
          Add('INSERT INTO agendamanu');
          Add('(qtdhoras,descricao,codequipamento,aviso');

          Add(')');

          Add('VALUES (:qtd,:des,:equi,:avi');

          Add(')');

          ParamByName('qtd').AsFloat := StrToFloat(edtQtdHoras.Text);
          ParamByName('des').AsString:= edtDescricao.Text;
          ParamByName('equi').AsInteger := StrToInt(edtCodEquipamento.Text);
          ParamByName('avi').AsFloat    := StrToFloat(edtAvisar.Text);
          ExecSQL();
        end;
    end;

  if opcSal = 2 then
    begin
      with qryAgenda, SQL do
        begin
          Close;
          Clear;
          Add('UPDATE agendamanu SET qtdhoras = :qtd, descricao = :des, codequipamento = :equip,');
          Add('aviso = :avi');
          ParamByName('qtd').AsFloat := StrToFloat(edtQtdHoras.Text);
          ParamByName('des').AsString:= edtDescricao.Text;
          ParamByName('equip').AsInteger := StrToInt(edtCodEquipamento.Text);
          ParamByName('avi').AsFloat     := StrToFloat(edtAvisar.Text);
          ExecSQL();
        end;
    end;

  Self.Close;
end;

procedure TfrmIncluirAgendamento.edtCodEquipamentoExit(Sender: TObject);
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
        edtAvisar.SetFocus;
    end;
end;

procedure TfrmIncluirAgendamento.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmIncluirAgendamento.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmIncluirAgendamento.edtCodEquipamentoEnter(Sender: TObject);
begin
  lblEquipamento.Caption := '';
end;

procedure TfrmIncluirAgendamento.BtnBuscaEquipamentoClick(Sender: TObject);
begin
  frmEquipamentos := TfrmEquipamentos.Create(self);
  frmEquipamentos.telaChamando := 3;
  frmEquipamentos.ShowModal;
  FreeAndNil(frmEquipamentos);

  if lblEquipamento.Caption <> trim('') then
    edtAvisar.SetFocus;
end;

procedure TfrmIncluirAgendamento.BtnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmIncluirAgendamento.BtnBuscaManutencaoClick(Sender: TObject);
begin
  {frmManutencoes := TfrmManutencoes.Create(self);
  frmManutencoes.telaChamando := 3;
  frmManutencoes.ShowModal;
  FreeAndNil(frmManutencoes);

  if lblManutencao.Caption <> trim('') then
    BtnGravar.SetFocus;}
end;

procedure TfrmIncluirAgendamento.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

end.
