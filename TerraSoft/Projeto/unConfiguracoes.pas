unit unConfiguracoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, FMTBcd, SqlExpr, Provider, DB,
  DBClient, ExtDlgs;

type
  TfrmConfiguracoes = class(TForm)
    PnTopo: TPanel;
    PnConfigs: TPanel;
    PnRodape: TPanel;
    lblTitulo: TLabel;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    CbxExigeLogin: TComboBox;
    Label3: TLabel;
    CbxRamo: TComboBox;
    dsConfiguracoes: TDataSource;
    cdsConfiguracoes: TClientDataSet;
    dspConfiguracoes: TDataSetProvider;
    qryConfiguracoes: TSQLQuery;
    Label4: TLabel;
    CbxTipoCaixa: TComboBox;
    Label5: TLabel;
    edtCaminhoLogo: TEdit;
    BtnBuscaLogo: TBitBtn;
    OpPicDlgLogo: TOpenPictureDialog;
    ImgLogo: TImage;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnBuscaLogoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure atualiza;
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

uses unDM;

{$R *.dfm}

procedure TfrmConfiguracoes.BtnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmConfiguracoes.BtnGravarClick(Sender: TObject);
begin
  try
    qryConfiguracoes.Close;
    qryConfiguracoes.SQL.Clear;
    qryConfiguracoes.SQL.Add('UPDATE configuracoes SET ');


    { EXIGE LOGIN }
    if CbxExigeLogin.ItemIndex > 0 then
      qryConfiguracoes.SQL.Add('exigelogin=:vu')
    else
      qryConfiguracoes.SQL.Add('exigelogin=null');

    { RAMO DE ATIVIDADE }
    if CbxRamo.ItemIndex > 0 then
      qryConfiguracoes.SQL.Add(',ramo=:ra')
    else
      qryConfiguracoes.SQL.Add(',ramo=null');

    { TIPO DE CAIXA }
    if CbxTipoCaixa.ItemIndex > 0 then
      qryConfiguracoes.SQL.Add(',tipocaixa=:tpcx');

    { LOGO }
    qryConfiguracoes.SQL.Add(',caminhologo=:cl');


    qryConfiguracoes.SQL.Add('WHERE codigo = :cod');

    qryConfiguracoes.ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);

    if CbxExigeLogin.ItemIndex > 0 then
      qryConfiguracoes.ParamByName('vu').AsInteger := CbxExigeLogin.ItemIndex;

    if CbxRamo.ItemIndex > 0 then
      qryConfiguracoes.ParamByName('ra').AsInteger := CbxRamo.ItemIndex;

    if CbxTipoCaixa.ItemIndex > 0 then
      qryConfiguracoes.ParamByName('tpcx').AsInteger := CbxTipoCaixa.ItemIndex;

    qryConfiguracoes.ParamByName('cl').AsString := edtCaminhoLogo.Text;

    qryConfiguracoes.Prepared := True;
    qryConfiguracoes.ExecSQL();       
  except
    MessageDlg('Erro ao gravar as configurações do sistema!',mtError,[mbOk],0);
  end;

  Self.Close;
end;

procedure TfrmConfiguracoes.atualiza;
begin
  try
    qryConfiguracoes.Close;
    qryConfiguracoes.SQL.Clear;
    qryConfiguracoes.SQL.Add('SELECT * FROM configuracoes');
    qryConfiguracoes.Open;
    cdsConfiguracoes.Open;
    cdsConfiguracoes.Refresh;

    edtCodigo.Text              := cdsConfiguracoes.FieldByName('codigo').AsString;
    CbxExigeLogin.ItemIndex     := cdsConfiguracoes.FieldByName('exigelogin').AsInteger;
    CbxRamo.ItemIndex           := cdsConfiguracoes.FieldByName('ramo').AsInteger;
    CbxTipoCaixa.ItemIndex      := cdsConfiguracoes.FieldByName('tipocaixa').AsInteger;
    edtCaminhoLogo.Text         := cdsConfiguracoes.FieldByName('caminhologo').AsString;
    ImgLogo.Picture.LoadFromFile(edtCaminhoLogo.Text);
  except
    MessageDlg('Erro ao carregar configurações!',mtError,[mbOk],0);
  end;
end;

procedure TfrmConfiguracoes.FormShow(Sender: TObject);
begin
  atualiza;
end;

procedure TfrmConfiguracoes.BtnBuscaLogoClick(Sender: TObject);
begin
  if OpPicDlgLogo.Execute then
    edtCaminhoLogo.Text := OpPicDlgLogo.FileName;

  ImgLogo.Picture.LoadFromFile(edtCaminhoLogo.Text);
end;

procedure TfrmConfiguracoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.Close;
end;

end.
