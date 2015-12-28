unit unPermissoesUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, FMTBcd, SqlExpr,
  Provider, DB, DBClient, unFuncoes;

type
  TfrmPermissoesUsuarios = class(TForm)
    Bevel1: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    PnBloqueios: TPanel;
    lblForm: TLabel;
    lblTela: TLabel;
    Label7: TLabel;
    lblOpcaoBotao: TLabel;
    edtCodTela: TEdit;
    BtnBuscaTela: TBitBtn;
    edtCodOpcaoBotao: TEdit;
    BtnBuscaOpcaoBotao: TBitBtn;
    BtnBloquear: TBitBtn;
    BtnDesbloquear: TBitBtn;
    GrdPermissoes: TDBGrid;
    Label1: TLabel;
    lblUsuario: TLabel;
    lblSair: TLabel;
    dsPermissoes: TDataSource;
    cdsPermissoes: TClientDataSet;
    dspPermissoes: TDataSetProvider;
    qryPermissoes: TSQLQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnBloquearClick(Sender: TObject);
    procedure BtnDesbloquearClick(Sender: TObject);
    procedure edtCodTelaEnter(Sender: TObject);
    procedure edtCodOpcaoBotaoEnter(Sender: TObject);
    procedure edtCodTelaExit(Sender: TObject);
    procedure edtCodOpcaoBotaoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GrdPermissoesCellClick(Column: TColumn);
    procedure BtnBuscaTelaClick(Sender: TObject);
    procedure BtnBuscaOpcaoBotaoClick(Sender: TObject);
    procedure GrdPermissoesTitleClick(Column: TColumn);
  private

    lofuncoes: TFuncoes;
    procedure carregaDados;
    procedure mostraPermissoes;
  public
    { Public declarations }
  end;

var
  frmPermissoesUsuarios: TfrmPermissoesUsuarios;

implementation

uses unDM, unUsuarios, unTelas, unBotoes, unPrincipal;

{$R *.dfm}

procedure TfrmPermissoesUsuarios.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmPermissoesUsuarios.mostraPermissoes;
begin
  try
    qryPermissoes.Close;
    qryPermissoes.SQL.Clear;
    qryPermissoes.SQL.Add('SELECT per.codform, per.codbotao, form.caption AS Form, bot.caption AS Botao');
    qryPermissoes.SQL.Add('FROM permissoes per');
    qryPermissoes.SQL.Add('INNER JOIN formularios form');
    qryPermissoes.SQL.Add('ON form.codigo = per.codform');
    qryPermissoes.SQL.Add('INNER JOIN botoes bot');
    qryPermissoes.SQL.Add('ON bot.codigo = per.codbotao');
    qryPermissoes.SQL.Add('WHERE codusuario = :usu');
    qryPermissoes.ParamByName('usu').AsInteger := frmUsuarios.cdsDados.FieldByName('codigo').AsInteger;
    qryPermissoes.Open;
    cdsPermissoes.Close;
    cdsPermissoes.Open;
    edtCodTela.Clear;
    edtCodOpcaoBotao.Clear;
    lblTela.Caption := '';
    lblOpcaoBotao.Caption := '';
  except
    on e: Exception do
    raise Exception.Create('Não foi possível buscar os bloqueios para esse usuário!' + #13 + e.Message);
  end;
end;

procedure TfrmPermissoesUsuarios.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'FORM';

  mostraPermissoes;
end;

procedure TfrmPermissoesUsuarios.BtnBloquearClick(Sender: TObject);
begin
  try
    if (edtCodTela.Text = trim('')) or (edtCodTela.Text = '0') then
      begin
        MessageDlg('É extremamente necessário informar a tela para bloqueio!',mtWarning,[mbOk],0);
        edtCodTela.SetFocus;
        Exit;
      end;

    qryPermissoes.Close;
    qryPermissoes.SQL.Clear;
    qryPermissoes.SQL.Add('INSERT INTO permissoes (codform,codusuario');

    if (edtCodOpcaoBotao.Text <> trim('')) and (edtCodOpcaoBotao.Text <> '0') then
      qryPermissoes.SQL.Add(',codbotao')
    else
      qryPermissoes.SQL.Add(',telainteira');

    qryPermissoes.SQL.Add(')');

    qryPermissoes.SQL.Add('VALUES (:form,:usu');

    if (edtCodOpcaoBotao.Text <> trim('')) and (edtCodOpcaoBotao.Text <> '0') then
      qryPermissoes.SQL.Add(',:botao')
    else
      qryPermissoes.SQL.Add(',:tein');

    qryPermissoes.SQL.Add(')');

    qryPermissoes.ParamByName('form').AsInteger := StrToInt(edtCodTela.Text);

    if (edtCodOpcaoBotao.Text <> trim('')) and (edtCodOpcaoBotao.Text <> '0') then
      qryPermissoes.ParamByName('botao').AsInteger:= StrToInt(edtCodOpcaoBotao.Text)
    else
      qryPermissoes.ParamByName('tein').AsString := 'S';

    qryPermissoes.ParamByName('usu').AsInteger  := frmUsuarios.cdsDados.FieldByName('codigo').AsInteger;
    qryPermissoes.ExecSQL();
  except
    on e: Exception do
    raise Exception.Create('Não foi possível efetuar o bloqueio!' + #13 + e.Message);
  end;

  mostraPermissoes;
end;

procedure TfrmPermissoesUsuarios.BtnDesbloquearClick(Sender: TObject);
begin
  try
    if (edtCodTela.Text = trim('')) or (edtCodTela.Text = '0') then
      begin
        MessageDlg('Dados inconsistentes para desbloqueio!',mtWarning,[mbOk],0);
        Exit;
      end;

    qryPermissoes.Close;
    qryPermissoes.SQL.Clear;
    qryPermissoes.SQL.Add('DELETE FROM permissoes');
    qryPermissoes.SQL.Add('WHERE codform = :form');
    qryPermissoes.SQL.Add('AND codusuario = :usu');

    if (edtCodOpcaoBotao.Text <> trim('')) and (edtCodOpcaoBotao.Text <> '0') then
      qryPermissoes.SQL.Add('AND codbotao = :botao');

    if (edtCodOpcaoBotao.Text <> trim('')) and (edtCodOpcaoBotao.Text <> '0') then
      qryPermissoes.ParamByName('botao').AsInteger := StrToInt(edtCodOpcaoBotao.Text);

    qryPermissoes.ParamByName('form').AsInteger := StrToInt(edtCodTela.Text);
    qryPermissoes.ParamByName('usu').AsInteger  := frmUsuarios.cdsDados.FieldByName('codigo').AsInteger;
    qryPermissoes.ExecSQL();
  except
    on e: Exception do
    raise Exception.Create('Não foi possível efetuar o desbloqueio!' + #13 + e.Message);
  end;

  mostraPermissoes;
end;

procedure TfrmPermissoesUsuarios.edtCodTelaEnter(Sender: TObject);
begin
  lblTela.Caption := '';
end;

procedure TfrmPermissoesUsuarios.edtCodOpcaoBotaoEnter(Sender: TObject);
begin
  lblOpcaoBotao.Caption := '';
end;

procedure TfrmPermissoesUsuarios.edtCodTelaExit(Sender: TObject);
begin
  if edtCodTela.Text <> trim('') then
    begin
      lblTela.Caption := loFuncoes.BuscaFk(edtCodTela.Text,'formularios','caption');

      if lblTela.Caption = trim('') then
        begin
          edtCodTela.Clear;
          BtnBuscaTela.SetFocus;
        end
      else
        edtCodOpcaoBotao.SetFocus;
    end;
end;

procedure TfrmPermissoesUsuarios.edtCodOpcaoBotaoExit(Sender: TObject);
begin
  if edtCodOpcaoBotao.Text <> trim('') then
    begin
      lblOpcaoBotao.Caption := loFuncoes.BuscaFk(edtCodOpcaoBotao.Text,'botoes','caption');

      if lblOpcaoBotao.Caption = trim('') then
        begin
          edtCodOpcaoBotao.Clear;
          BtnBuscaOpcaoBotao.SetFocus;
        end
      else
        BtnBloquear.SetFocus;
    end;
end;

procedure TfrmPermissoesUsuarios.carregaDados;
begin
  edtCodTela.Text       := cdsPermissoes.FieldByName('codform').AsString;
  edtCodOpcaoBotao.Text := cdsPermissoes.FieldByName('codbotao').AsString;

  lblTela.Caption := loFuncoes.BuscaFk(edtCodTela.Text,'formularios','caption');
  lblOpcaoBotao.Caption := loFuncoes.BuscaFk(edtCodOpcaoBotao.Text,'botoes','caption');    
end;

procedure TfrmPermissoesUsuarios.FormCreate(Sender: TObject);
begin
  lofuncoes := TFuncoes.Create;
end;

procedure TfrmPermissoesUsuarios.FormDestroy(Sender: TObject);
begin
  lofuncoes.Free;
end;

procedure TfrmPermissoesUsuarios.GrdPermissoesCellClick(Column: TColumn);
begin
  carregaDados;
end;

procedure TfrmPermissoesUsuarios.BtnBuscaTelaClick(Sender: TObject);
begin
  frmTelas := TfrmTelas.Create(self);
  frmTelas.telaChamando := 2;
  frmTelas.ShowModal;
  FreeAndNil(frmTelas);

  if lblTela.Caption <> trim('') then
    edtCodOpcaoBotao.SetFocus;
end;

procedure TfrmPermissoesUsuarios.BtnBuscaOpcaoBotaoClick(Sender: TObject);
begin
  frmBotoes := TfrmBotoes.Create(self);
  frmBotoes.telaChamando := 1;
  frmBotoes.ShowModal;
  FreeAndNil(frmBotoes);

  if lblOpcaoBotao.Caption <> trim('') then
    BtnBloquear.SetFocus;
end;

procedure TfrmPermissoesUsuarios.GrdPermissoesTitleClick(Column: TColumn);
begin
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraPermissoes;
end;

end.
