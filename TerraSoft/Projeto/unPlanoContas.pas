unit unPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unConsultas, FMTBcd, Provider, DBClient, DB, SqlExpr, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, unFuncoes;

type
  TfrmPlanoContas = class(TfrmConsultas)
    Bevel1: TBevel;
    RdBtnCodigo: TRadioButton;
    RdBtnDescricao: TRadioButton;
    GrdPlanoContas: TDBGrid;
    procedure BtnIncluirClick(Sender: TObject);
    procedure GrdPlanoContasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure GrdPlanoContasDblClick(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GrdPlanoContasKeyPress(Sender: TObject; var Key: Char);
    procedure GrdPlanoContasTitleClick(Column: TColumn);
  private

    loFuncoes: TFuncoes;
    procedure carregaDados; override;
  public
    telaChamando: integer;
  end;

var
  frmPlanoContas: TfrmPlanoContas;

implementation

uses unIncluirPlanoContas, unIncluirCliente, unIncluirContasReceber,
  unFaturamentoOS, unQuitarContaReceber, unManutencoes, unQuitarContaPagar,
  unIncluirSubPlanoContas, unIncluirContasPagar, unFaturamentoManu,
  unPrincipal, unIncluirAbastecimento;

{$R *.dfm}

procedure TfrmPlanoContas.BtnIncluirClick(Sender: TObject);
begin
  inherited;
  frmIncluirPlanoContas := TfrmIncluirPlanoContas.Create(self);
  frmIncluirPlanoContas.ShowModal;
  FreeAndNil(frmIncluirPlanoContas);
  mostraTodos;
end;

procedure TfrmPlanoContas.GrdPlanoContasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if State = [] then
  begin
    if cdsDados.RecNo mod 2 = 1 then
      GrdPlanoContas.Canvas.Brush.Color := clMoneyGreen
    else
      GrdPlanoContas.Canvas.Brush.Color := clWhite;
  end;
  GrdPlanoContas.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmPlanoContas.GrdPlanoContasDblClick(Sender: TObject);
begin
  inherited;
  if telachamando <> 0 then
    begin
      if telaChamando = 1 then // inclusao contas receber
        begin
           
        end;

      if telaChamando = 2 then // faturamento os { N�AAAOOOO EXIIIISTEEEE MAIIISSS }}}
        begin
          
        end;

      if telaChamando = 3 then // quitando conta a receber
        begin
          { PROCESSO N�O MAIS UTILIZADO }
          {frmQuitarContaReceber.edtCodPlanoConta.Text   := cdsDados.FieldByName('codigo').AsString;
          frmQuitarContaReceber.lblPlanoContas.Caption  := cdsDados.FieldByName('descricao').AsString;}
        end;

      if telaChamando = 4 then // manutencao equipamento/veiculo
        begin
          frmManutencoes.edtCodPlanoConta.Text := cdsDados.FieldByName('codigo').AsString;
          frmManutencoes.lblPlanoConta.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      if telaChamando = 5 then // gerando contas a pagar --> manutencoes
        begin
           { PROCESSO N�O MAIS UTILIZADO }
          {frmFaturamentoManu.edtCodPlanoConta.Text := cdsDados.FieldByName('codigo').AsString;
          frmFaturamentoManu.lblPlanoConta.Caption := cdsDados.FieldByName('descricao').AsString;}
        end;

      if telaChamando = 6 then // cadastro de sub plano de conta
        begin
          frmIncluirSubPlanoContas.edtCodPlanoConta.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirSubPlanoContas.lblPlanoConta.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      if telaChamando = 7 then // inclusao contas a pagar manual
        begin
          frmIncluirContasPagar.edtCodPlanoConta.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirContasPagar.lblPlanoConta.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      if telaChamando = 8 then // inclusao abastecimento
        begin
          frmIncluirAbastecimento.edtCodPlanoConta.Text := cdsDados.FieldByName('codigo').AsString;
          frmIncluirAbastecimento.lblPlanoConta.Caption := cdsDados.FieldByName('descricao').AsString;
        end;

      Self.Close;
    end
  else
    BtnAlterarClick(self);
end;

procedure TfrmPlanoContas.edtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
    begin
      if edtConsulta.Text <> trim('') then
        begin
          with qryDados, SQL do
            begin
              Close;
              Clear;

              // CODIGO
              if RdBtnCodigo.Checked then
                begin
                  Add('SELECT * FROM planocontas WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := StrToInt(edtConsulta.Text);
                end;

              // NOME
              if RdBtnDescricao.Checked then
                begin
                  Add('SELECT * FROM planocontas WHERE descricao LIKE :desc');
                  ParamByName('desc').AsString := '%' + edtConsulta.Text + '%';
                end;

              Open;
            end;
        end;
      cdsDados.Open;
      cdsDados.Refresh;

      GrdPlanoContas.SetFocus;      
    end;
end;

procedure TfrmPlanoContas.BtnAlterarClick(Sender: TObject);
begin
  frmIncluirPlanoContas := TfrmIncluirPlanoContas.Create(self);

  inherited;

  frmIncluirPlanoContas.ShowModal;
  FreeAndNil(frmIncluirPlanoContas);

  mostraTodos;
end;

procedure TfrmPlanoContas.carregaDados;
begin
  inherited;
  with cdsDados do
    begin
      with frmIncluirPlanoContas do
        begin
          edtCodigo.Text := FIeldByName('codigo').AsString;
          edtSequencial.Text := FieldByName('sequencial').AsString;
          edtDescricao.Text := FieldByName('descricao').AsString;
        end;
    end;
end;

procedure TfrmPlanoContas.FormCreate(Sender: TObject);
begin
  inherited;
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmPlanoContas.FormDestroy(Sender: TObject);
begin
  inherited;
  loFuncoes.Free;
end;

procedure TfrmPlanoContas.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente excluir o plano de conta '+cdsDados.FieldByName('descricao').AsString+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if cdsDados.FieldByName('codigo').AsString <> trim('') then
        begin
          try
            with qryDados, SQL do
              begin
                Close;
                Clear;
                Add('DELETE FROM planocontas WHERE codigo = :cod');
                ParamByName('cod').AsInteger := cdsDados.FieldByName('codigo').AsInteger;
                ExecSQL();
              end;
          except
            MessageDlg('Erro ao excluir o plano de conta!',mtError,[mbOk],0);
          end;
        end;         
      mostraTodos;
    end;
end;

procedure TfrmPlanoContas.FormShow(Sender: TObject);
begin
  frmPrincipal.sCampo := 'CODIGO';

  sSQL := 'SELECT * FROM planocontas';

  inherited;

end;

procedure TfrmPlanoContas.GrdPlanoContasKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
    if telaChamando > 0 then
      GrdPlanoContasDblClick(self)
    else
      BtnAlterarClick(self);
end;

procedure TfrmPlanoContas.GrdPlanoContasTitleClick(Column: TColumn);
begin
  inherited;
  frmPrincipal.sCampo := Column.FieldName; // CAMPO RECEBE O NOME DA COLUNA CLICADA,

  mostraTodos;
end;

end.
