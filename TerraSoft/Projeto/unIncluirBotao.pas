unit unIncluirBotao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastros, FMTBcd, SqlExpr, DB, Provider, DBClient, StdCtrls,
  Buttons, ExtCtrls, unFuncoes;

type
  TfrmIncluirBotao = class(TfrmCadastros)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtcaption: TEdit;
    edtCodtela: TEdit;
    BtnBuscaTela: TBitBtn;
    lblTela: TLabel;
    procedure BtnBuscaTelaClick(Sender: TObject);
    procedure edtCodtelaExit(Sender: TObject);
  private
    loFuncoes: TFuncoes;

  public

    procedure limpa; override;
    procedure incluir; override;
    procedure alterar; override;
  end;

var
  frmIncluirBotao: TfrmIncluirBotao;

implementation

uses unTelas;

{$R *.dfm}

{ TfrmIncluirBotao }

procedure TfrmIncluirBotao.alterar;
begin
  inherited;

  if (edtCodtela.Text = trim('')) or (edtCodtela.Text = '0') then
    begin
      MessageDlg('N�o � poss�vel prosseguir sem informar a tela que essa fun��o/bot�o pertence!',mtWarning,[mbOk],0);
      edtCodtela.SetFocus;
      Exit;
    end;

  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('UPDATE botoes SET descricao=:desc,caption=:cap,codform=:form');
      Add('WHERE codigo = :cod');
      ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
      ParamByName('desc').AsString := edtDescricao.Text;
      ParamByName('cap').AsString  := edtCaption.Text;
      ParamByName('form').AsInteger:= StrToInt(edtCodtela.Text);
      ExecSQL();
    end;
end;

procedure TfrmIncluirBotao.incluir;
begin
  inherited;

  if (edtCodtela.Text = trim('')) or (edtCodtela.Text = '0') then
    begin
      MessageDlg('N�o � poss�vel prosseguir sem informar a tela que essa fun��o/bot�o pertence!',mtWarning,[mbOk],0);
      edtCodtela.SetFocus;
      bFecharTela := True; // n�o fechar tela
      Exit;
    end;

  with qryPadrao, SQL do
    begin
      Close;
      Clear;
      Add('INSERT INTO botoes (descricao,caption,codform)');
      Add('VALUES (:desc,:cap,:form)');
      ParamByName('desc').AsString := edtDescricao.Text;
      ParamByName('cap').AsString  := edtCaption.Text;
      ParamByName('form').AsInteger:= StrToInt(edtCodtela.Text);
      ExecSQL();
    end;
end;

procedure TfrmIncluirBotao.limpa;
begin
  inherited;
  lblTela.Caption := '';
end;

procedure TfrmIncluirBotao.BtnBuscaTelaClick(Sender: TObject);
begin
  inherited;
  frmTelas := TfrmTelas.Create(self);
  frmTelas.telaChamando := 1;
  frmTelas.ShowModal;
  FreeAndNil(frmTelas);

  if lblTela.Caption <> trim('') then
    BtnGravar.SetFocus;
end;

procedure TfrmIncluirBotao.edtCodtelaExit(Sender: TObject);
begin
  inherited;
  if edtCodtela.Text <> trim('') then
    begin
      lblTela.Caption := loFuncoes.BuscaFk(edtCodtela.Text,'formularios','caption');

      if lblTela.Caption = trim('') then
        begin
          edtCodtela.Clear;
          BtnBuscaTela.SetFocus;
        end
      else
        BtnGravar.SetFocus;
    end;
end;

end.