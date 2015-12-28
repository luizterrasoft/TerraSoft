unit unQuitarContaPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, SqlExpr, Provider, DB, DBClient, StdCtrls, ComCtrls,
  Buttons, Mask, ExtCtrls, unFuncoes;

type
  TfrmQuitarContaPagar = class(TForm)
    PnTopo: TPanel;
    Label1: TLabel;
    PnDados: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblFormaPgto: TLabel;
    Label7: TLabel;
    lblConta: TLabel;
    lblRestante: TLabel;
    mskData: TMaskEdit;
    edtValor: TEdit;
    edtCodFormaPgto: TEdit;
    BtnBuscaFormaPgto: TBitBtn;
    RchEdtObs: TRichEdit;
    edtCodConta: TEdit;
    BtnBuscaConta: TBitBtn;
    PnRodape: TPanel;
    BtnConfirmar: TBitBtn;
    BtnCancelar: TBitBtn;
    dsQuitar: TDataSource;
    cdsQuitar: TClientDataSet;
    dspQuitar: TDataSetProvider;
    qryQuitar: TSQLQuery;
    dsAux: TDataSource;
    cdsAux: TClientDataSet;
    dspAux: TDataSetProvider;
    qryAux: TSQLQuery;
    lblNovoVencimento: TLabel;
    mskNovoVencimento: TMaskEdit;
    dsAux2: TDataSource;
    cdsAux2: TClientDataSet;
    dspAux2: TDataSetProvider;
    qryAux2: TSQLQuery;
    dsParcial: TDataSource;
    cdsParcial: TClientDataSet;
    dspParcial: TDataSetProvider;
    qryParcial: TSQLQuery;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodFormaPgtoExit(Sender: TObject);
    procedure edtCodFormaPgtoEnter(Sender: TObject);
    procedure edtCodContaExit(Sender: TObject);
    procedure edtCodContaEnter(Sender: TObject);
    procedure BtnBuscaFormaPgtoClick(Sender: TObject);
    procedure BtnBuscaPlanoClick(Sender: TObject);
    procedure BtnBuscaContaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
  private
    loFuncoes: TFuncoes;
    function Total: double;

  public
    VlrDigitado: Double;
    sDescricao: string;
    iTipoQuitacao: integer;
    codManutencao: integer;
    codConta: integer;
    vlrRestante: Real;
    JaQuitado: Real;
  end;

var
  frmQuitarContaPagar: TfrmQuitarContaPagar;

implementation

uses unFormasPgto, unPlanoContas, unContas, unPrincipal, unDM;

{$R *.dfm}

procedure TfrmQuitarContaPagar.BtnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmQuitarContaPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmQuitarContaPagar.BtnConfirmarClick(Sender: TObject);
var
  iCodFornecedor: integer;
begin
  VlrDigitado := StrToFloat(edtValor.Text);
  if (edtValor.Text = trim('0,00')) or (edtValor.Text = trim('0')) then
    begin
      MessageDlg('Digite um valor numérico maior que 0!',mtWarning,[mbOk],0);
      Exit;
    end;

  if (StrToFloat(edtValor.Text) < StrToFloat(lblRestante.Caption)) and (iTipoQuitacao = 2) then
  begin
    MessageDlg('Não é possível realizar baixa parcial de várias contas ao mesmo tempo. Revise o valor à ser recebido!',mtWarning,[mbOk],0);
    edtValor.SetFocus;
    Exit;
  end;

  try
    if iTipoQuitacao = 1 then
      begin
        with qryQuitar, SQL do
          begin
            Close;
            Clear;
            Add('UPDATE contaspagar SET valorpago=:vlrpg');
            Add(',datapagamento=:dtpg,status=:sta,dataoperacaoquitacao=:dtopquit');
            Add('WHERE codigo = :cod');

            ParamByName('cod').AsInteger := codConta;
            ParamByName('vlrpg').AsFloat:= VlrDigitado;
            ParamByName('dtpg').AsDate := StrToDate(mskData.Text);
            ParamByName('sta').AsString := 'Q';
            ParamByName('dtopquit').AsDate := Date;
            ExecSQL();
          end;

          { VERIFICA SE ESTÁ RECEBENDO TUDO OU PARCIAL }
          if vlrRestante > VlrDigitado then
            begin
              { SE FOR PARCIAL, INCLUE UMA NOVA CONTA A RECEBER }
              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add('SELECT * FROM contaspagar');
              qryAux.SQL.Add('WHERE codigo = :conta');
              qryAux.ParamByName('conta').AsInteger := codConta;
              qryAux.Open;
              cdsAux.Close;
              cdsAux.Open;

              iCodFornecedor := cdsAux.FieldByname('codfornecedor').AsInteger;

              qryParcial.Close;
              qryParcial.SQL.Clear;
              qryParcial.SQL.Add('INSERT INTO contaspagar (lancamento,vencimento,valor,status,codfornecedor,');
              qryParcial.SQL.Add('codmanutencao,descricao,numeroparcela,codusuario)');
              qryParcial.SQL.Add('VALUES (:lan,:ven,:vlr,:sta,:cli,:os,:des,:npa,:usu)');
              qryParcial.ParamByName('lan').AsDate := cdsAux.FieldByName('lancamento').AsDateTime;
              qryParcial.ParamByName('ven').AsDate := StrToDate(mskNovoVencimento.Text);
              qryParcial.ParamByName('vlr').AsFloat:= vlrRestante - VlrDigitado;
              qryParcial.ParamByName('sta').AsString := 'A';
              qryParcial.ParamByName('cli').AsInteger:= cdsAux.FieldByName('codfornecedor').AsInteger;
              qryParcial.ParamByName('os').AsInteger := codManutencao;
              qryParcial.ParamByName('des').AsString := sDescricao;
              qryParcial.ParamByName('npa').AsInteger:= cdsAux.FieldByname('numeroparcela').AsInteger;
              qryParcial.ParamByName('usu').AsInteger:= 1;
              qryParcial.Prepared := True;
              qryParcial.ExecSQL();
            end;

        { PEGA DADOS DO FORNECEDOR }
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT * FROM fornecedores');
        qryAux.SQL.Add('WHERE codigo = :cod');
        qryAux.ParamByName('cod').AsInteger := iCodFornecedor;
        qryAux.Open;
        cdsAux.Close;
        cdsAux.Open;

        { PEGA DESCRICAO DA CONTA }
        qryQuitar.Close;
        qryQuitar.SQL.Clear;
        qryQuitar.SQL.Add('SELECT descricao FROM contaspagar');
        qryQuitar.SQL.Add('WHERE codigo = :cod');
        qryQuitar.ParamByName('cod').AsInteger := codConta;
        qryQuitar.Open;
        cdsQuitar.Close;
        cdsQuitar.Open;

        sDescricao := cdsQuitar.FieldByName('descricao').AsString;

        with qryQuitar, SQL do
          begin
            Close;
            Clear;
            Add('INSERT INTO caixa (codconta,valor,descricao,data,tipo)');
            Add('VALUES (:conta,:valor,:desc,:data,:tip)');
            ParamByName('conta').AsInteger := StrToInt(edtCodConta.Text);
            ParamByName('valor').AsFloat   := VlrDigitado;
            ParamByName('desc').AsString   := 'PGTO. : ' + sDescricao;
            { ATÉ DIA 24/10/2014 FOI UTILIZADO A DATA INFORMADA PELO USUARIO }
            ParamByName('data').AsDate     := Date; // DATA DA OPERAÇÃO
            ParamByName('tip').AsString    := 'D';
            ExecSQL();
          end;

        with qryAux, SQL do
          begin
            Close;
            Clear;
            Add('SELECT MAX(codigo) AS codigo FROM caixa');
            Open;
            cdsAux.Close;
            cdsAux.Open;
          end;

        with qryQuitar, SQL do
          begin
            Close;
            Clear;
            Add('INSERT INTO HISTORICOCONTAPAGAR (datapgto,valor,codformapgto,valoratual,codcontapagar,codconta,obs,codlancamentocaixa)');
            Add('VALUES (:dtPg,:vlr,:codforma,:vlrat,:codconta,:codcon,:obs,:codcaixa)');
            ParamByName('dtPg').AsDate := StrToDate(mskData.Text);
            ParamByName('vlr').AsFloat  := VlrDigitado;
            ParamByName('codforma').AsInteger := StrToInt(edtCodFormaPgto.Text);
            ParamByName('vlrat').AsFloat      := vlrRestante - VlrDigitado;
            ParamByName('codconta').AsInteger := codConta;
            ParamByName('codcon').AsInteger := StrToInt(edtCodConta.Text);
            ParamByName('obs').AsString := RchEdtObs.Text;
            ParamByName('codcaixa').AsInteger := cdsAux.FieldByName('codigo').AsInteger;
            ExecSQL();
          end;
      end;

    if iTipoQuitacao = 2 then
      begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT * FROM contaspagar');
        qryAux.SQL.Add('WHERE marcada = 1');
        qryAux.Open;
        cdsAux.Close;
        cdsAux.Open;

        cdsAux.First;

        while not(cdsAux.Eof) do
          begin
            qryQuitar.Close;
            qryQuitar.SQL.Clear;
            qryQuitar.SQL.Add('UPDATE contaspagar SET valorpago=:vlrpag,status=:sta');
            qryQuitar.SQL.Add(',datapagamento=:dtpag,dataoperacaoquitacao=:dtopquit');
            qryQuitar.SQL.Add('WHERE codigo = :cod');
            qryQuitar.ParamByName('cod').AsInteger := cdsAux.FieldByName('codigo').AsInteger;
            qryQuitar.ParamByName('vlrpag').AsFloat:= cdsAux.FieldByname('valor').AsFloat;
            qryQuitar.ParamByName('dtpag').AsDate := StrToDate(mskData.Text);
            qryQuitar.ParamByName('sta').AsString := 'Q';
            qryQuitar.ParamByName('dtopquit').AsDate := Date;
            qryQuitar.ExecSQL();

            qryAux2.Close;
            qryAux2.SQL.Clear;
            qryAux2.SQL.Add('SELECT razaosocial FROM fornecedores');
            qryAux2.SQL.Add('WHERE codigo = :cod');
            qryAux2.ParamByName('cod').AsInteger := cdsAux.FieldByName('codfornecedor').AsInteger;
            qryAux2.Open;
            cdsAux2.Close;
            cdsAux2.Open;

            with qryQuitar, SQL do
              begin
                Close;
                Clear;
                Add('INSERT INTO caixa (codconta,valor,descricao,data,tipo)');
                Add('VALUES (:conta,:valor,:desc,:data,:tip)');
                ParamByName('conta').AsInteger := StrToInt(edtCodConta.Text);
                ParamByName('valor').AsFloat   := cdsAux.FieldByname('valor').AsFloat;
                ParamByName('desc').AsString   := 'PGTO. ' + cdsAux.FieldByName('descricao').AsString;
                { ATÉ DIA 24/10/2014 FOI UTILIZADO A DATA INFORMADA PELO USUARIO }
                ParamByName('data').AsDate     := Date;
                ParamByName('tip').AsString    := 'D';
                ExecSQL();
              end;

            with qryAux2, SQL do
              begin
                Close;
                Clear;
                Add('SELECT MAX(codigo) AS codigo FROM caixa');
                Open;
                cdsAux2.Close;
                cdsAux2.Open;
              end;

            with qryQuitar, SQL do
              begin
                Close;
                Clear;
                Add('INSERT INTO HISTORICOCONTAPAGAR (datapgto,valor,codformapgto,valoratual,codcontapagar,codconta,codlancamentocaixa)');
                Add('VALUES (:dtPag,:vlr,:codforma,:vlrat,:codconta,:codcon,:codcaixa)');
                ParamByName('dtpag').AsDate := StrToDate(mskData.Text);
                ParamByName('vlr').AsFloat  := cdsAux.FieldByName('valor').AsFloat;
                ParamByName('codforma').AsInteger := StrToInt(edtCodFormaPgto.Text);
                ParamByName('vlrat').AsFloat      := 0;
                ParamByName('codconta').AsInteger := cdsAux.FieldByname('codigo').AsInteger;
                ParamByName('codcon').AsInteger := StrToInt(edtCodConta.Text);
                ParamByName('codcaixa').AsInteger := cdsAux2.FieldByName('codigo').AsInteger;
                ExecSQL();
              end;
            cdsAux.Next;
          end;
      end;
  except
    MessageDlg('Erro ao quitar a parcela!',mtWarning,[mbOk],0);
  end;

  Self.Close;
end;

procedure TfrmQuitarContaPagar.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TfrmQuitarContaPagar.edtCodFormaPgtoExit(Sender: TObject);
begin
  if edtCodFormaPgto.Text <> trim('') then
    begin
      lblFormaPgto.Caption := loFuncoes.BuscaFk(edtCodFormaPgto.Text,'formaspgto','descricao');

      if lblFormaPgto.Caption = trim('') then
        begin
          edtCodFormaPgto.Clear;
          BtnBuscaFormaPgto.SetFocus;
        end
      else
        edtCodConta.SetFocus;
    end;
end;

procedure TfrmQuitarContaPagar.edtCodFormaPgtoEnter(Sender: TObject);
begin
  lblFormaPgto.Caption := '';
end;

procedure TfrmQuitarContaPagar.edtCodContaExit(Sender: TObject);
begin
  if edtCodConta.Text <> trim('') then
    begin
      lblConta.Caption := loFuncoes.BuscaFk(edtCodConta.Text,'contas','descricao');

      if lblConta.Caption = trim('') then
        begin
          edtCodConta.Clear;
          BtnBuscaConta.SetFocus;
        end
      else
        BtnConfirmar.SetFocus;
    end;
end;

procedure TfrmQuitarContaPagar.edtCodContaEnter(Sender: TObject);
begin
  lblConta.Caption := '';
end;

procedure TfrmQuitarContaPagar.BtnBuscaFormaPgtoClick(Sender: TObject);
begin
  frmFormasPgto := TfrmFormasPgto.Create(self);
  frmFormasPgto.telaChamando := 4;
  frmFormasPgto.ShowModal;
  FreeAndNil(frmFormasPgto);

  if lblFormaPgto.Caption <> trim('') then
    edtCodConta.SetFocus;
end;

procedure TfrmQuitarContaPagar.BtnBuscaPlanoClick(Sender: TObject);
begin
  frmPlanoContas := TfrmPlanoContas.Create(self);
  frmPlanoContas.telaChamando := 5;
  frmPlanoContas.ShowModal;
  FreeAndNil(frmPlanoContas);

  if lblConta.Caption <> trim('') then
    edtCodConta.SetFocus;
end;

procedure TfrmQuitarContaPagar.BtnBuscaContaClick(Sender: TObject);
begin
  frmContas := TfrmContas.Create(self);
  frmContas.telaChamando := 5;
  frmContas.ShowModal;
  FreeAndNil(frmContas);

  if lblConta.Caption <> trim('') then
    BtnConfirmar.SetFocus;
end;

procedure TfrmQuitarContaPagar.FormShow(Sender: TObject);
begin
  if iTipoQuitacao = 1 then
    lblRestante.Caption := FloatToStr(vlrRestante);

  if iTipoQuitacao = 2 then
    lblRestante.Caption := FloatToStr(Total);

  edtValor.Text       := loFUncoes.TrataReal(edtValor.Text);
  lblRestante.Caption := loFUncoes.TrataReal(lblRestante.Caption);
  mskData.Text        := DateToStr(Date);
end;

procedure TfrmQuitarContaPagar.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmQuitarContaPagar.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmQuitarContaPagar.edtValorExit(Sender: TObject);
begin
  if (edtValor.Text <> '0,00') then
    VlrDigitado := StrToFloat(edtValor.Text);

  if (VlrDigitado < vlrRestante) and (iTipoQuitacao = 1) then
  begin
    lblNovoVencimento.Visible            := True;
    mskNovoVencimento.Visible := True;
    mskNovoVencimento.SetFocus;
  end;

  edtValor.Text := loFuncoes.TrataReal(edtValor.Text);
end;

function TfrmQuitarContaPagar.Total: double;
var
  DRetorno: Double;
begin
  try
    DRetorno := 0;

    qryQuitar.Close;
    qryQuitar.SQL.Clear;
    qryQuitar.SQL.Add('SELECT SUM(valor) AS Total FROM contaspagar WHERE marcada = 1');
    qryQuitar.Open;
    cdsQuitar.Close;
    cdsQuitar.Open;
  except
    MessageDlg('Erro ao gerar total a ser pago!',mtError,[mbOk],0);
  end;

  DRetorno := cdsQuitar.FieldByname('Total').AsFloat;

  Result := DRetorno;
end;

end.
