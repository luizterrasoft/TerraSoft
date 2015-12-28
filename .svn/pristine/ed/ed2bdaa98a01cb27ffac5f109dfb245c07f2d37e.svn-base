unit unManutencaoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, ExtCtrls, Buttons, FMTBcd, DBClient,
  Provider, DB, SqlExpr;

type
  TfrmManutencaoCliente = class(TForm)
    PnDadosPrincipais: TPanel;
    lblCodigo: TLabel;
    lblNome: TLabel;
    lblNascimento: TLabel;
    lblDataCadastro: TLabel;
    lblEndereco: TLabel;
    lblNumero: TLabel;
    lblMunicipio: TLabel;
    lblUF: TLabel;
    lblFone: TLabel;
    lblCelular: TLabel;
    lblCPF: TLabel;
    lblRG: TLabel;
    lblEstadoCivil: TLabel;
    lblConjuge: TLabel;
    lblEmpresaTrabalha: TLabel;
    lblProfissao: TLabel;
    lblPai: TLabel;
    lblMae: TLabel;
    lblOutroDoc: TLabel;
    lblValorAluguel: TLabel;
    lblReferencia: TLabel;
    lblFoneAluguel: TLabel;
    lblEmpresasPrazo: TLabel;
    LblUltimaCompraPrazo: TLabel;
    lblEmpresaUltimaCompra: TLabel;
    lblValorCompra: TLabel;
    lblValorPrestacao: TLabel;
    lblTipoPagamento: TLabel;
    lblObs: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    mskNascimento: TMaskEdit;
    mskDataCadastro: TMaskEdit;
    edtEndereco: TEdit;
    edtNumero: TEdit;
    edtMunicipio: TEdit;
    CbxUF: TComboBox;
    mskFone: TMaskEdit;
    mskCelular: TMaskEdit;
    mskCPF: TMaskEdit;
    edtRG: TEdit;
    CbxEstadoCivil: TComboBox;
    edtConjuge: TEdit;
    edtEmpresa: TEdit;
    edtprofissao: TEdit;
    edtPai: TEdit;
    edtMae: TEdit;
    edtOutroDocumento: TEdit;
    edtValorAluguel: TEdit;
    edtReferencia: TEdit;
    mskFoneRespAluguel: TMaskEdit;
    RchEdtEmpresas: TRichEdit;
    mskUltimaCompraPrazo: TMaskEdit;
    edtUltimaEmpresaComprou: TEdit;
    edtValorCompra: TEdit;
    edtValorPrestacao: TEdit;
    CbxTipoPgto: TComboBox;
    RchEdtObs: TRichEdit;
    PnBotoes: TPanel;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    qryCliente: TSQLQuery;
    dsCliente: TDataSource;
    dspCliente: TDataSetProvider;
    cdsCliente: TClientDataSet;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnGravarClick(Sender: TObject);
    procedure edtValorAluguelExit(Sender: TObject);
    procedure edtValorCompraExit(Sender: TObject);
    procedure edtValorPrestacaoExit(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function TrataReal(Valor: string): string;
    procedure TrataReais;

  public
    iOpcsal: integer;

  end;

var
  frmManutencaoCliente: TfrmManutencaoCliente;

implementation

uses unPrincipal;

{$R *.dfm}

procedure TfrmManutencaoCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmManutencaoCliente.BtnGravarClick(Sender: TObject);
begin
  if iOpcsal = 1 then // Incluir
    begin
      try
        qryCliente.Close;
        qryCliente.SQL.Clear;
        qryCliente.SQL.Add('INSERT INTO clientes (');
        qryCliente.SQL.Add('nome,fone,conjuge,endereco,empresatrabalha,profissaocargo,');
        qryCliente.SQL.Add('pai,mae,rg,cpf,outrodoc,referencia,foneresponsavelaluguel,');
        qryCliente.SQL.Add('empresasprazo,empresaultimacompra,');
        qryCliente.SQL.Add('observacoes,numero,municipio,uf,celular,estadocivil,tipopagamento,datacadastro');

        if (edtValorAluguel.Text <> '0.00') and (edtValorAluguel.Text <> trim('')) then
          begin
            qryCliente.SQL.Add(',valoraluguel');
            qryCliente.SQL.Add(',pagaaluguel');
          end;

        if (edtValorCompra.Text <> '0.00') and (edtValorCompra.Text <> trim('')) then
          qryCliente.SQL.Add(',valor');

        if (edtValorPrestacao.Text <> '0.00') and (edtValorPrestacao.Text <> trim('')) then
          qryCliente.SQL.Add(',valorprestacao');

        if mskNascimento.Text <> '  /  /    ' then
          qryCliente.SQL.Add(',nascimento');

        if mskUltimaCompraPrazo.Text <> '  /  /    ' then
          qryCliente.SQL.Add(',ultimacompraprazo');

        qryCliente.SQL.Add(')');

        qryCliente.SQL.Add(' VALUES (');

        qryCliente.SQL.Add(':nome,:fone,:conj,:ende,:emptra,:prof,:pai,:mae,:rg,:cpf,:outro,');
        qryCliente.SQL.Add(':ref,:fnresp,:emppraz,:empult,:obs,');
        qryCliente.SQL.Add(':num,:muni,:uf,:cel,:estc,:tppg,:dtcad');

        if (edtValorAluguel.Text <> '0.00') and (edtValorAluguel.Text <> trim('')) then
          begin
            qryCliente.SQL.Add(',:vlralug');
            qryCliente.SQL.Add(',:pgalug');
          end;

        if (edtValorCompra.Text <> '0.00') and (edtValorCompra.Text <> trim('')) then
          qryCliente.SQL.Add(',:vlrcomp');

        if (edtValorPrestacao.Text <> '0.00') and (edtValorPrestacao.Text <> trim('')) then
          qryCliente.SQL.Add(',:vlrprest');

        if mskNascimento.Text <> '  /  /    ' then
          qryCliente.SQL.Add(',:nasc');

        if mskUltimaCompraPrazo.Text <> '  /  /    ' then
          qryCliente.SQL.Add(',:ultcomp');

        qryCliente.SQL.Add(')');

        qryCliente.ParamByName('nome').AsString := edtNome.Text;
        qryCliente.ParamByName('fone').AsString := mskFone.Text;
        qryCliente.ParamByName('conj').AsString := edtConjuge.Text;
        qryCliente.ParamByName('ende').AsString := edtEndereco.Text;
        qryCliente.ParamByName('emptra').AsString := edtEmpresa.Text;
        qryCliente.ParamByName('prof').AsString   := edtprofissao.Text;
        qryCliente.ParamByName('pai').AsString    := edtPai.Text;
        qryCliente.ParamByName('mae').AsString    := edtMae.Text;
        qryCliente.ParamByName('rg').AsString     := edtRG.Text;
        qryCliente.ParamByName('cpf').AsString    := mskCPF.Text;
        qryCliente.ParamByName('outro').AsString  := edtOutroDocumento.Text;
        qryCliente.ParamByName('ref').AsString    := edtReferencia.Text;
        qryCliente.ParamByName('fnresp').AsString := mskFoneRespAluguel.Text;
        qryCliente.ParamByName('emppraz').AsString:= RchEdtEmpresas.text;
        qryCliente.ParamByName('empult').AsString := edtUltimaEmpresaComprou.Text;
        qryCliente.ParamByName('obs').AsString    := RchEdtObs.Text;
        qryCliente.ParamByName('num').AsString    := edtNumero.Text;
        qryCliente.ParamByName('muni').AsString   := edtMunicipio.Text;
        qryCliente.ParamByName('uf').AsInteger    := CbxUF.ItemIndex;
        qryCliente.ParamByName('cel').AsString    := mskCelular.Text;
        qryCliente.ParamByName('estc').AsInteger  := CbxEstadoCivil.ItemIndex;
        qryCliente.ParamByName('tppg').AsInteger  := CbxTipoPgto.ItemIndex;
        qryCliente.ParamByName('dtcad').AsDate    := Date;

        if (edtValorAluguel.Text <> '0.00') and (edtValorAluguel.Text <> trim('')) then
          begin
            qryCliente.ParamByName('vlralug').AsFloat := StrToFloat(edtValorAluguel.Text);
            qryCliente.ParamByName('pgalug').AsInteger := 1; // 1 = paga aluguel
          end;

        if (edtValorCompra.Text <> '0.00') and (edtValorCompra.Text <> trim('')) then
          qryCliente.ParamByName('vlrcomp').AsFloat := StrToFloat(edtValorCompra.Text);

        if (edtValorPrestacao.Text <> '0.00') and (edtValorPrestacao.Text <> trim('')) then
          qryCliente.ParamByName('vlrprest').AsFloat := StrToFloat(edtValorPrestacao.Text);

        if mskNascimento.Text <> '  /  /    ' then
          qryCliente.ParamByName('nasc').AsDate := StrToDate(mskNascimento.Text);

        if mskUltimaCompraPrazo.Text <> '  /  /    ' then
          qryCliente.ParamByName('ultcomp').AsDate := StrToDate(mskUltimaCompraPrazo.Text);

        qryCliente.Prepared := True;
        qryCliente.ExecSQL();
        Self.Close;
      except
        on e: Exception do
        raise Exception.Create('Não foi possível incluir o cliente!' + #13 + e.Message);
      end;

    end;

  if iOpcsal = 2 then // Alterar
    begin
      try
        qryCliente.Close;
        qryCliente.SQL.Clear;
        qryCliente.SQL.Add('UPDATE clientes SET ');
        qryCliente.SQL.Add('nome=:nome,fone=:fone,conjuge=:conj,endereco=:ende,empresatrabalha=:emptra,');
        qryCliente.SQL.Add('profissaocargo=:prof,pai=:pai,mae=:mae,rg=:rg,cpf=:cpf,outrodoc=:outro,');
        qryCliente.SQL.Add('referencia=:ref,foneresponsavelaluguel=:fnresp,empresasprazo=:emppraz,');
        qryCliente.SQL.Add('empresaultimacompra=:empult,observacoes=:obs,');
        qryCliente.SQL.Add('numero=:num,municipio=:muni,uf=:uf,celular=:cel,estadocivil=:estc,tipopagamento=:tppg');

        if (edtValorAluguel.Text <> '0.00') and (edtValorAluguel.Text <> trim('')) then
          begin
            qryCliente.SQL.Add(',valoraluguel=:vlralug');
            qryCliente.SQL.Add(',pagaaluguel=:pgalug');
          end;

        if (edtValorCompra.Text <> '0.00') and (edtValorCompra.Text <> trim('')) then
          qryCliente.SQL.Add(',valor=:vlrcomp');

        if (edtValorPrestacao.Text <> '0.00') and (edtValorPrestacao.Text <> trim('')) then
          qryCliente.SQL.Add(',valorprestacao=:vlrprest');

        if mskNascimento.Text <> '  /  /    ' then
          qryCliente.SQL.Add(',nascimento=:nasc');

        if mskUltimaCompraPrazo.Text <> '  /  /    ' then
          qryCliente.SQL.Add(',ultimacompraprazo=:ultcomp');

        qryCliente.SQL.Add('WHERE codigo = :cod');

        qryCliente.ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
        qryCliente.ParamByName('nome').AsString := edtNome.Text;
        qryCliente.ParamByName('fone').AsString := mskFone.Text;
        qryCliente.ParamByName('conj').AsString := edtConjuge.Text;
        qryCliente.ParamByName('ende').AsString := edtEndereco.Text;
        qryCliente.ParamByName('emptra').AsString := edtEmpresa.Text;
        qryCliente.ParamByName('prof').AsString   := edtprofissao.Text;
        qryCliente.ParamByName('pai').AsString    := edtPai.Text;
        qryCliente.ParamByName('mae').AsString    := edtMae.Text;
        qryCliente.ParamByName('rg').AsString     := edtRG.Text;
        qryCliente.ParamByName('cpf').AsString    := mskCPF.Text;
        qryCliente.ParamByName('outro').AsString  := edtOutroDocumento.Text;
        qryCliente.ParamByName('ref').AsString    := edtReferencia.Text;
        qryCliente.ParamByName('fnresp').AsString := mskFoneRespAluguel.Text;
        qryCliente.ParamByName('emppraz').AsString:= RchEdtEmpresas.text;
        qryCliente.ParamByName('empult').AsString := edtUltimaEmpresaComprou.Text;
        qryCliente.ParamByName('obs').AsString    := RchEdtObs.Text;
        qryCliente.ParamByName('num').AsString    := edtNumero.Text;
        qryCliente.ParamByName('muni').AsString   := edtMunicipio.Text;
        qryCliente.ParamByName('uf').AsInteger    := CbxUF.ItemIndex;
        qryCliente.ParamByName('cel').AsString    := mskCelular.Text;
        qryCliente.ParamByName('estc').AsInteger  := CbxEstadoCivil.ItemIndex;
        qryCliente.ParamByName('tppg').AsInteger  := CbxTipoPgto.ItemIndex;

        if (edtValorAluguel.Text <> '0.00') and (edtValorAluguel.Text <> trim('')) then
          begin
            qryCliente.ParamByName('vlralug').AsFloat := StrToFloat(edtValorAluguel.Text);
            qryCliente.ParamByName('pgalug').AsInteger := 1; // 1 = paga aluguel
          end;

        if (edtValorCompra.Text <> '0.00') and (edtValorCompra.Text <> trim('')) then
          qryCliente.ParamByName('vlrcomp').AsFloat := StrToFloat(edtValorCompra.Text);

        if (edtValorPrestacao.Text <> '0.00') and (edtValorPrestacao.Text <> trim('')) then
          qryCliente.ParamByName('vlrprest').AsFloat := StrToFloat(edtValorPrestacao.Text);

        if mskNascimento.Text <> '  /  /    ' then
          qryCliente.ParamByName('nasc').AsDate := StrToDate(mskNascimento.Text);

        if mskUltimaCompraPrazo.Text <> '  /  /    ' then
          qryCliente.ParamByName('ultcomp').AsDate := StrToDate(mskUltimaCompraPrazo.Text);

        qryCliente.Prepared := True;
        qryCliente.ExecSQL();
        Self.Close;
      except
        on e: Exception do
        raise Exception.Create('Não foi possível alterar o cliente!' + #13 + e.Message);
      end;
    end;
end;

function TfrmManutencaoCliente.TrataReal(Valor: string): string;
begin
  try
    if Valor <> '' then
      begin
        Valor := FormatFloat('#0.00',StrToFloat(Valor));

        Result := Valor;
      end
    else
      begin
        Valor := '0,00';
        Valor := StringReplace(Valor,',','.',[rfReplaceAll]);
        Result := Valor;
      end;
  except
    MessageDlg('Erro ao formatar o valor!',mtError,[mbOk],0);
  end;
end;

procedure TfrmManutencaoCliente.edtValorAluguelExit(Sender: TObject);
begin
  edtValorAluguel.Text := TrataReal(edtValorAluguel.Text);
end;

procedure TfrmManutencaoCliente.edtValorCompraExit(Sender: TObject);
begin
  edtValorCompra.Text := TrataReal(edtValorCompra.Text);
end;

procedure TfrmManutencaoCliente.edtValorPrestacaoExit(Sender: TObject);
begin
  edtValorPrestacao.Text := TrataReal(edtValorPrestacao.Text);
end;

procedure TfrmManutencaoCliente.TrataReais;
begin
  edtValorAluguel.Text := TrataReal(edtValorAluguel.Text);
  edtValorCompra.Text  := TrataReal(edtValorCompra.Text);
  edtValorPrestacao.Text := TrataReal(edtValorPrestacao.Text);
end;

procedure TfrmManutencaoCliente.BtnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmManutencaoCliente.FormShow(Sender: TObject);
begin
  edtValorAluguel.Text := TrataReal(edtValorAluguel.Text);
  edtValorCompra.Text  := TrataReal(edtValorCompra.Text);
  edtValorPrestacao.Text := TrataReal(edtValorPrestacao.Text);
end;

end.
