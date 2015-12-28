unit unRenegociarCR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, Provider, DBClient, DB, SqlExpr, Mask, ExtCtrls, Grids,
  DBGrids, StdCtrls, Buttons, unFuncoes;

type
  TfrmRenegociarCR = class(TForm)
    Label1: TLabel;
    lblTotalRenegociar: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    lblCondicaoPgto: TLabel;
    Bevel2: TBevel;
    edtCodCondPgto: TEdit;
    BtnBuscaCondPgto: TBitBtn;
    BtnGerar: TBitBtn;
    DBGrid1: TDBGrid;
    PnAlteracao: TPanel;
    lblValor: TLabel;
    lblVencimento: TLabel;
    edtValor: TEdit;
    mskVencimento: TMaskEdit;
    BtnGravar: TBitBtn;
    BtnAlterar: TBitBtn;
    PnRodape: TPanel;
    BtnConcluir: TBitBtn;
    btncancelar: TBitBtn;
    qryRenegociar: TSQLQuery;
    dsRenegociar: TDataSource;
    cdsRenegociar: TClientDataSet;
    dspRenegociar: TDataSetProvider;
    dsAux: TDataSource;
    cdsAux: TClientDataSet;
    dspAux: TDataSetProvider;
    qryAux: TSQLQuery;
    qryAux2: TSQLQuery;
    dsAux2: TDataSource;
    cdsAux2: TClientDataSet;
    dspAux2: TDataSetProvider;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure edtCodCondPgtoExit(Sender: TObject);
    procedure edtCodCondPgtoEnter(Sender: TObject);
    procedure BtnBuscaCondPgtoClick(Sender: TObject);
    procedure BtnGerarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnConcluirClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    operacao, codContaAlterando: integer;
    EAvista: Boolean;
    loFuncoes: TFuncoes;
    function Total(): Double;
    procedure AlteraSatusParcelasRenegociadas;
    procedure CancelarProcesso; 
    procedure mostraContas;

  public

    IntervaloVcto, PrimeiroVcto, QtdParcelas, codCliente, codOS, codConta: integer;
  end;

var
  frmRenegociarCR: TfrmRenegociarCR;

implementation

uses unCondicoesPgto, unPrincipal, DateUtils, UnSelecaoContaAvista, unDM;

{$R *.dfm}

procedure TfrmRenegociarCR.AlteraSatusParcelasRenegociadas;
begin
 { AO GERAR AS PARCELAS DA NOVA NEGOCIAÇÃO, O STATUS VAI FICAR COMO = 'R' }
  try
    qryRenegociar.Close;
    qryRenegociar.SQL.Clear;
    qryRenegociar.SQL.Add('UPDATE contasreceber SET status = :sta WHERE marcada = 1');
    qryRenegociar.ParamByName('sta').AsString := 'R';
    qryRenegociar.ExecSQL();
  except
    MessageDlg('Erro ao alterar status das parcelas renegociadas!',mtError,[mbOk],0);
  end;
end;

procedure TfrmRenegociarCR.CancelarProcesso;
var
  iNumeroParcela: integer;
begin
  iNumeroParcela := QtdParcelas;

  while iNumeroParcela > 1 do
  begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('DELETE FROM contasreceber');
    qryAux.SQL.Add('WHERE codos = :os');
    qryAux.SQL.Add('AND numeroparcela = :np');
    qryAux.ParamByName('manu').AsInteger := codOS;
    qryAux.ParamByName('np').AsInteger   := iNumeroParcela;
    qryAux.ExecSQL();

    iNumeroParcela := iNumeroParcela - 1;
  end;
end;

procedure TfrmRenegociarCR.mostraContas;
begin
  with qryRenegociar, SQL do
    begin
      Close;
      Clear;
      Add('SELECT * FROM contasreceber WHERE codOS = :os');
      Add('AND renegociada = 2 AND mostrarreparcelamento = 1');
      ParamByName('os').AsInteger := codOS;
      Open;
      cdsRenegociar.Close;
      cdsRenegociar.Open;

      TNumericField(cdsRenegociar.FieldByName('valor')).DisplayFormat := ',0.00;-,0.00';
    end;
end;

function TfrmRenegociarCR.Total: Double;
var
  DRetorno: Double;
begin
  try
    DRetorno := 0;

    qryRenegociar.Close;
    qryRenegociar.SQL.Clear;
    qryRenegociar.SQL.Add('SELECT SUM(valor) AS Total FROM contasreceber WHERE marcada = 1');
    qryRenegociar.Open;
    cdsRenegociar.Close;
    cdsRenegociar.Open;
  except
    MessageDlg('Erro ao gerar total a ser renegociado!',mtError,[mbOk],0);
  end;

  DRetorno := cdsRenegociar.FieldByname('Total').AsFloat;

  Result := DRetorno;
end;

procedure TfrmRenegociarCR.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmRenegociarCR.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmRenegociarCR.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmRenegociarCR.FormShow(Sender: TObject);
begin
  lblTotalRenegociar.Caption := loFuncoes.TrataReal(FloatToStr(Total));
end;

procedure TfrmRenegociarCR.btncancelarClick(Sender: TObject);
begin
  CancelarProcesso;

  Self.Close;
end;

procedure TfrmRenegociarCR.edtCodCondPgtoExit(Sender: TObject);
begin
  if edtCodCondPgto.Text <> trim('') then
    begin
      lblCondicaoPgto.Caption := loFuncoes.BuscaFk(edtCodCondPgto.Text,'condicoespgto','descricao');
      IntervaloVcto := StrToInt(loFUncoes.BuscaFk(edtCodCondPgto.Text,'condicoespgto','DIASENTREPRESTACOES'));
      PrimeiroVcto  := StrToInt(loFUncoes.BuscaFk(edtCodCondPgto.Text,'condicoespgto','NDIASPRIMEIROVCTO'));
      QtdParcelas   := StrToInt(loFUncoes.BuscaFk(edtCodCondPgto.Text,'condicoespgto','qtdparcelas'));

      if lblCondicaoPgto.Caption = trim('') then
        begin
          edtCodCondPgto.Clear;
          BtnBuscaCondPgto.SetFocus;
        end
      else
        begin
          BtnGerar.SetFocus;
        end;
    end;
end;

procedure TfrmRenegociarCR.edtCodCondPgtoEnter(Sender: TObject);
begin
  lblCondicaoPgto.Caption := '';
end;

procedure TfrmRenegociarCR.BtnBuscaCondPgtoClick(Sender: TObject);
begin
  frmCondicoesPgto := TfrmCondicoesPgto.Create(self);
  frmCondicoesPgto.telaChamando := 4;
  frmCondicoesPgto.ShowModal;
  FreeAndNil(frmCondicoesPgto);

  if lblCondicaoPgto.Caption <> trim('') then
    BtnGerar.SetFocus;
end;

procedure TfrmRenegociarCR.BtnGerarClick(Sender: TObject);
var
  i: integer;
  DiasVcto: integer;
  Avista: TDate;
begin
  i := 1;

  while i <= QtdParcelas do
    begin

      if i = 1 then
        DiasVcto := PrimeiroVcto
      else
        DiasVcto := (i * IntervaloVcto);

      // verifica se a parcela é avista
      Avista := IncDay(Date,DiasVcto);

      if Avista = Date then
        EAvista := True
      else
        EAvista := False;

      with qryRenegociar, SQL do
        begin
          try
            Close;
            Clear;
            Add('INSERT INTO contasreceber (emissao,vencimento,valor,codcliente,codos,');
            Add('status,descricao,numeroparcela,renegociada,mostrarreparcelamento');

            if frmPrincipal.iCodUsuario > 0 then
              Add(',codusuario');

            if EAvista = true then
              Add(',datarecebimento,valorrecebido)')
            else
              Add(')');


            Add('VALUES (:emi,:venc,:vlr,:codcli,:codos,:sta,:des,:npa,:ren,:mrep');

            if frmPrincipal.iCodUsuario > 0 then
              Add(',:usu');

            if EAvista = true then
              Add(',:dtRec,:vlrrec)')
            else
              Add(')');

            ParamByName('emi').AsDate   := Date;
            ParamByName('venc').AsDate  := IncDay(Date,DiasVcto);
            ParamByName('vlr').AsFloat  := StrToFloat(lblTotalRenegociar.Caption) / QtdParcelas;
            ParamByName('codcli').AsInteger := codCliente;
            ParamByName('codos').AsInteger  := codOS;

            if EAvista then
              ParamByName('sta').AsString := 'Q'
            else
              ParamByName('sta').AsString := 'A';

            ParamByName('des').AsString := 'O.S. Número: '+IntToStr(codOS);
            ParamByName('npa').AsInteger:= i;

            if frmPrincipal.iCodUsuario > 0 then
              ParamByName('usu').AsInteger := frmPrincipal.iCodUsuario;
              
            ParamByName('ren').AsInteger := 2;
            ParamByName('mrep').AsInteger:= 1;

            if EAvista = true then
              begin
                ParamByName('dtRec').AsDate   := Date;
                ParamByName('vlrrec').AsFloat := StrToFloat(lblTotalRenegociar.Caption) / QtdParcelas;

                // chama a tela pra selecionar qual conta vai cair esse avista
                frmSelecaoContaAvista := TfrmSelecaoContaAvista.Create(self);
                frmSelecaoContaAvista.tela := 4; // faturamento os
                frmSelecaoContaAvista.ShowModal;
                FreeAndNil(frmSelecaoContaAvista);

                // lança no caixa - o avista
                with qryAux, SQL do
                  begin
                    Close;
                    Clear;
                    Add('INSERT INTO caixa (codconta,valor,descricao,data,tipo)');
                    Add('VALUES (:codconta,:valor,:desc,:data,:tip)');
                    ParamByName('codconta').AsInteger := codConta;
                    ParamByName('valor').AsFloat   := StrToFloat(lblTotalRenegociar.Caption) / QtdParcelas;
                    ParamByName('desc').AsString   := 'RECBTO. PARCELA A VISTA O.S.: ' + IntToStr(codOs);
                    ParamByName('data').AsDate     := Date;
                    ParamByName('tip').AsString    := 'C';
                    ExecSQL();
                  end;
              end;

            ExecSQL();
          except
            MessageDlg('Erro ao gerar a parcela número '+ IntToStr(i)+ '!',mtError,[mbOk],0);
          end;
        end;
      i := i + 1;
    end;

  mostraContas;

  { REAJUSTA A ORIGEM DE CADA CONTA }
  cdsRenegociar.First;
  while not(cdsRenegociar.Eof) do
    begin
      qryAux2.Close;
      qryAux2.SQL.Clear;
      qryAux2.SQL.Add('SELECT DISTINCT(codOS) FROM contasreceber');
      qryAux2.SQL.Add('WHERE marcada = 1');
      qryAux2.Open;
      cdsAux2.Close;
      cdsAux2.Open;

      cdsAux2.First;
      while not(cdsAux2.Eof) do
        begin
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add('INSERT INTO renegociacoescr');
          qryAux.SQL.Add('(codnovaconta,codos)');
          qryAux.SQL.Add('VALUES (:con,:os)');
          qryAux.ParamByName('con').AsInteger := cdsRenegociar.FieldByName('codigo').AsInteger;
          qryAux.ParamByName('os').AsInteger  := cdsAux2.FieldByName('codos').AsInteger;
          qryAux.ExecSQL();

          cdsAux2.Next;
        end;

      cdsRenegociar.Next;
    end;

  { ATUALIZA CONDICAO DE PAGAMENTO DA OS }
  with qryAux, SQL do
    begin
      try
        Close;
        Clear;
        Add('UPDATE OS SET codcondicaopgto = :cond');
        Add('WHERE codigo = :os');
        ParamByName('os').AsInteger := codOS;
        ParamByName('cond').AsInteger := StrToInt(edtCodCondPgto.Text);
        ExecSQL();
      except
        MessageDlg('Erro ao alterar condição pgto. da OS que está sendo refaturada!',mtError,[mbOk],0);
      end;
    end;
end;

procedure TfrmRenegociarCR.BtnAlterarClick(Sender: TObject);
begin
  operacao := 2;
  codContaAlterando := cdsRenegociar.FieldByName('codigo').AsInteger;

  PnAlteracao.Enabled := True;
  edtValor.Text := loFuncoes.TrataReal(cdsRenegociar.FieldByName('valor').AsString);
  mskVencimento.Text := cdsRenegociar.FieldByName('vencimento').AsString;
  edtValor.SetFocus;
end;

procedure TfrmRenegociarCR.BtnGravarClick(Sender: TObject);
begin
  if (edtValor.Text <> trim('')) and (edtValor.Text <> trim('0,00')) and (mskVencimento.Text <> '  /  /    ') then
    begin
      with qryRenegociar, SQL do
        begin
          Close;
          Clear;
          Add('UPDATE contasreceber SET valor = :vlr, vencimento = :vcto');
          Add('WHERE codigo = :cod');
          ParamByName('cod').AsInteger := codContaAlterando;
          ParamByName('vlr').AsFloat   := StrToFloat(edtValor.Text);
          ParamByName('vcto').AsDate   := StrToDate(mskVencimento.Text);
          ExecSQL();
        end;
    end
  else
    begin
      MessageDlg('Verifique os dados que estão sendo alterados!',mtWarning,[mbOk],0);
      edtValor.SetFocus;
    end;

  mostraContas;
end;

procedure TfrmRenegociarCR.BtnConcluirClick(Sender: TObject);
begin
  AlteraSatusParcelasRenegociadas;

  Self.Close;
end;

procedure TfrmRenegociarCR.edtValorExit(Sender: TObject);
begin
  edtValor.Text := loFuncoes.TrataReal(edtValor.Text);
end;

procedure TfrmRenegociarCR.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

end.
