unit unCadastroLeitores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB, SqlExpr, Mask;

type
  TfrmCadastroLeitores = class(TForm)
    PnDados: TPanel;
    PnOpcoes: TPanel;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    Label1: TLabel;
    edtIDLeitor: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtRG: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtNumero: TEdit;
    Label7: TLabel;
    edtBairro: TEdit;
    Label8: TLabel;
    edtEndereco: TEdit;
    qryCadLeitor: TSQLQuery;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    mskCPF: TMaskEdit;
    mskFone: TMaskEdit;
    edtCidade: TEdit;
    CbxEstado: TComboBox;
    edtPais: TEdit;
    mskCEP: TMaskEdit;
    edtEmail: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure limparCampos;

  public
    iOperacao: integer; // 1 = Inclusao ||| 2 = Alteração
  end;

var
  frmCadastroLeitores: TfrmCadastroLeitores;

implementation

uses unDM;

{$R *.dfm}

{ TfrmCadastroLivros }

procedure TfrmCadastroLeitores.limparCampos;
begin
  edtIDLeitor.Clear;
  edtNome.Clear;
  edtRG.Clear;
  mskCPF.Clear;
  mskFone.Clear;
  edtNumero.Clear;
  edtEndereco.Clear;
  edtBairro.Clear;
  edtCidade.Clear;
  edtPais.Clear;
  mskCEP.Clear;
  edtEmail.Clear;
  CbxEstado.ItemIndex := 23;
end;

procedure TfrmCadastroLeitores.FormShow(Sender: TObject);
begin
  if iOperacao = 1 then
    limparCampos;
end;

procedure TfrmCadastroLeitores.BtnGravarClick(Sender: TObject);
begin
  case iOperacao of

    1:  // Inclusão
      begin

        if (edtNome.Text = trim('')) then // Verifica se o campo título está vazio
          begin
            MessageDlg('Campo nome é de preenchimento obrigatório, por favor confira!',mtWarning,[mbOk],0);
            edtNome.SetFocus; // Foco vai para o campo nome
            Exit; // Para por aqui
          end;

        try
          qryCadLeitor.Close;
          qryCadLeitor.SQL.Clear;
          qryCadLeitor.SQL.Add('INSERT INTO leitor');
          qryCadLeitor.SQL.Add('(nome,cpf,rg,telefone,numero,endereco,bairro,cidade,estado,pais,cep,email)');
          qryCadLeitor.SQL.Add('VALUES (:nom,:cpf,:rg,:tel,:num,:end,:bai,:cid,:est,:pai,:cep,:ema)');

          qryCadLeitor.ParamByName('nom').AsString := edtNome.Text;
          qryCadLeitor.ParamByName('cpf').AsString := mskCPF.Text;
          qryCadLeitor.ParamByName('rg').AsString := edtRG.Text;
          qryCadLeitor.ParamByName('tel').AsString := mskFone.Text;
          qryCadLeitor.ParamByName('num').AsString := edtNumero.Text;
          qryCadLeitor.ParamByName('end').AsString := edtEndereco.Text;
          qryCadLeitor.ParamByName('bai').AsString := edtBairro.Text;
          qryCadLeitor.ParamByName('cid').AsString := edtCidade.Text;
          qryCadLeitor.ParamByName('est').AsString := CbxEstado.Text;
          qryCadLeitor.ParamByName('pai').AsString := edtPais.Text;
          qryCadLeitor.ParamByName('cep').AsString := mskCEP.Text;
          qryCadLeitor.ParamByName('ema').AsString := edtEmail.Text;
          qryCadLeitor.Prepared := True;
          qryCadLeitor.ExecSQL();
          Close;
        except
          MessageDlg('Erro ao incluir o novo leitor!',mtError,[mbOk],0);
        end;
      end;

    2: // Alteração
      begin
        try
          if (edtNome.Text = trim('')) then // Verifica se o campo nome esta vazio
            begin
              MessageDlg('Campo nome é de preenchimento obrigatório, por favor confira!',mtWarning,[mbOk],0);
              edtNome.SetFocus; // Foco vai para o campo nome
              Exit; // Para por aqui
            end;

          qryCadLeitor.Close;
          qryCadLeitor.SQL.Clear;
          qryCadLeitor.SQL.Add('UPDATE leitor SET nome = :nom, cpf = :cpf, rg = :rg, telefone = :tel,');
          qryCadLeitor.SQL.Add('numero = :num, endereco = :end, bairro = :bai, cidade = :cid, estado = :est,');
          qryCadLeitor.SQL.Add('pais = :pai, cep = :cep, email = :ema');
          qryCadLeitor.SQL.Add('WHERE id_leitor = :id');

          qryCadLeitor.ParamByName('id').AsInteger := StrToInt(edtIDLeitor.Text);
          qryCadLeitor.ParamByName('nom').AsString := edtNome.Text;
          qryCadLeitor.ParamByName('cpf').AsString := mskCPF.Text;
          qryCadLeitor.ParamByName('rg').AsString := edtRG.Text;
          qryCadLeitor.ParamByName('tel').AsString := mskFone.Text;
          qryCadLeitor.ParamByName('num').AsString := edtNumero.Text;
          qryCadLeitor.ParamByName('end').AsString := edtEndereco.Text;
          qryCadLeitor.ParamByName('bai').AsString := edtBairro.Text;
          qryCadLeitor.ParamByName('cid').AsString := edtCidade.Text;
          qryCadLeitor.ParamByName('est').AsString := CbxEstado.Text;
          qryCadLeitor.ParamByName('pai').AsString := edtPais.Text;
          qryCadLeitor.ParamByName('cep').AsString := mskCEP.Text;
          qryCadLeitor.ParamByName('ema').AsString := edtEmail.Text;

          qryCadLeitor.Prepared := True;
          qryCadLeitor.ExecSQL();
          Close;
        except
          MessageDlg('Não foi possível alterar os dados do leitor!',mtWarning,[mbOk],0);
        end;
      end;
  end;
end;

procedure TfrmCadastroLeitores.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroLeitores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
