unit unIncluirOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, unFuncoes, FMTBcd, SqlExpr,
  Provider, DB, DBClient, Grids, DBGrids, ComCtrls;

type
  TfrmIncluirOS = class(TForm)
    PnPrincipaisOS: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    lblCliente: TLabel;
    lblVendedor: TLabel;
    edtCodigo: TEdit;
    edtCodCliente: TEdit;
    edtCodVendedor: TEdit;
    mskDataAbertura: TMaskEdit;
    mskFechamento: TMaskEdit;
    CbxStatus: TComboBox;
    lblValorTotal: TLabel;
    BtnBuscaCliente: TBitBtn;
    BtnBuscaVendedor: TBitBtn;
    BtnConfirmar: TBitBtn;
    dsOS: TDataSource;
    cdsOS: TClientDataSet;
    dspOS: TDataSetProvider;
    qryOS: TSQLQuery;
    Label12: TLabel;
    PnServicos: TPanel;
    PnIncluirItem: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    lblEquipamento: TLabel;
    lblFuncionarioItem: TLabel;
    Label22: TLabel;
    edtCodEquipamento: TEdit;
    BtnBuscaEquipamento: TBitBtn;
    edtCodFuncITem: TEdit;
    BtnBuscaFuncionarioItem: TBitBtn;
    edtHoraInicial: TEdit;
    edtHoraFinal: TEdit;
    edtQtdHoras: TEdit;
    GrdItens: TDBGrid;
    dsItens: TDataSource;
    cdsItens: TClientDataSet;
    dspItens: TDataSetProvider;
    qryItens: TSQLQuery;
    Label13: TLabel;
    edtValorHora: TEdit;
    Label15: TLabel;
    lblValorTotalServico: TLabel;
    BtnGravar: TBitBtn;
    BtnExcluir: TBitBtn;
    qryAux: TSQLQuery;
    cdsAux: TClientDataSet;
    dspAux: TDataSetProvider;
    dsAux: TDataSource;
    Label7: TLabel;
    mskDataItem: TMaskEdit;
    Label10: TLabel;
    edtOSBloco: TEdit;
    Label5: TLabel;
    RchEdtObsItem: TRichEdit;
    BtnNovo: TBitBtn;
    BtnFechar: TBitBtn;
    procedure edtCodClienteEnter(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtCodVendedorEnter(Sender: TObject);
    procedure edtCodVendedorExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnBuscaClienteClick(Sender: TObject);
    procedure BtnBuscaVendedorClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure edtCodFuncITemEnter(Sender: TObject);
    procedure edtCodEquipamentoEnter(Sender: TObject);
    procedure edtCodFuncITemExit(Sender: TObject);
    procedure edtCodEquipamentoExit(Sender: TObject);
    procedure BtnBuscaEquipamentoClick(Sender: TObject);
    procedure BtnBuscaFuncionarioItemClick(Sender: TObject);
    procedure edtHoraFinalExit(Sender: TObject);
    procedure edtValorHoraExit(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure GrdItensCellClick(Column: TColumn);
    procedure GrdItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdItensKeyPress(Sender: TObject; var Key: Char);
    procedure GrdItensKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
  private

    codItem: integer;
    vlrTotalItens: real;
    loFuncoes: TFuncoes;
    procedure movimentaBanco;
    procedure carregaItensOS;
    procedure carregaOS;
    procedure atualizaTotal;
    procedure limpar;
    procedure limparitens;
    procedure mostraItens;
  public

    codPenultimoItem: integer;
    codOS: integer;
    operacaoItens: integer;
    operacao: integer; //operação = 1 - incluir / 2 - alterar / 3 - visualizar
  end;

var
  frmIncluirOS: TfrmIncluirOS;

implementation

uses UnClientes, unFuncionarios, unCondicoesPgto, unFormasPgto, unDM,
  unServicos, unEquipamentos, unFaturamentoOS;

{$R *.dfm}

procedure TfrmIncluirOS.edtCodClienteEnter(Sender: TObject);
begin
  lblCliente.Caption := '';
end;

procedure TfrmIncluirOS.edtCodClienteExit(Sender: TObject);
begin
  if edtCodCliente.Text <> trim('') then
    begin
      lblCliente.Caption := loFuncoes.BuscaFk(edtCodCliente.Text,'clientes','nome');

      if lblCliente.Caption = trim('') then
        begin
          edtCodCliente.Clear;
          BtnBuscaCliente.SetFocus;
        end
      else
        edtCodVendedor.SetFocus;
    end;
end;

procedure TfrmIncluirOS.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmIncluirOS.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmIncluirOS.edtCodVendedorEnter(Sender: TObject);
begin
  lblVendedor.Caption := '';
end;

procedure TfrmIncluirOS.edtCodVendedorExit(Sender: TObject);
begin
  if edtCodVendedor.Text <> trim('') then
    begin
      lblVendedor.Caption := loFuncoes.BuscaFk(edtCodVendedor.Text,'funcionarios','nome');

      if lblVendedor.Caption = trim('') then
        begin
          edtCodVendedor.Clear;
          BtnBuscaVendedor.SetFocus;
        end
      else
        BtnConfirmar.SetFocus;
    end;
end;

procedure TfrmIncluirOS.limpar;
begin
  edtCodigo.Clear;
  mskDataAbertura.Clear;
  mskFechamento.Clear;
  CbxStatus.ItemIndex := 0;
  lblValorTotal.Caption := '0,00';
  edtCodCliente.Clear;
  lblCliente.Caption := '';
  edtCodVendedor.Clear;
  lblVendedor.Caption := '';
  edtOSBloco.Text := '';
end;

procedure TfrmIncluirOS.FormShow(Sender: TObject);
begin
  if operacao = 1 then
    begin
      limpar;
      limparitens;
      mskDataAbertura.Text := DateToStr(Date);
      PnServicos.Enabled := False;
    end;

  if operacao = 2 then
    begin
      mskDataAbertura.SetFocus;
      carregaOS;
    end;

  if operacao = 3 then
    begin
      carregaOS;
      PnPrincipaisOS.Enabled := False;
      PnServicos.Enabled := False;
    end;

  operacaoItens := 1;
end;

procedure TfrmIncluirOS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TfrmIncluirOS.BtnBuscaClienteClick(Sender: TObject);
begin
  frmClientes := TfrmClientes.Create(self);
  frmClientes.telaChamando := 2;
  frmClientes.ShowModal;
  FreeAndNil(frmClientes);

  if lblCliente.Caption <> trim('') then
    edtCodVendedor.SetFocus;
end;

procedure TfrmIncluirOS.BtnBuscaVendedorClick(Sender: TObject);
begin
  frmFuncionarios := TfrmFuncionarios.Create(self);
  frmFuncionarios.telaChamando := 4;
  frmFuncionarios.ShowModal;
  FreeAndNil(frmFuncionarios);

  if lblVendedor.Caption <> trim('') then
    BtnConfirmar.SetFocus;
end;

procedure TfrmIncluirOS.BtnConfirmarClick(Sender: TObject);
begin
  if (edtCodCliente.Text = trim('')) or (edtCodCliente.Text = trim('0')) then
    begin
      MessageDlg('Não é possível confirmar sem o cliente!',mtWarning,[mbOk],0);
      edtCodCliente.SetFocus;
      Exit;
    end;

  if (edtCodVendedor.Text = trim('')) or (edtCodVendedor.Text = trim('0')) then
    begin
      MessageDlg('Não é possível confirmar sem o vendedor!',mtWarning,[mbOk],0);
      edtCodVendedor.SetFocus;
      Exit;
    end;

  if operacao = 1 then // INCLUIR
    begin
      try
        with qryOS, SQL do
          begin
            Close;
            Clear;
            Add('INSERT INTO os (codcliente, status ');

            if edtOSBloco.Text <> trim('') then
              Add(', osbloco');

            if edtCodVendedor.Text <> trim('') then
              Add(', codvendedor');

            if mskDataAbertura.Text <> '  /  /    ' then
              Add(',dataabertura');

            if mskFechamento.Text <> '  /  /    ' then
              Add(',datafechada');

            Add(')');

            Add('VALUES (:cli,:sta');

            if edtOSBloco.Text <> trim('') then
              Add(',:bloc');

            if edtCodVendedor.Text <> trim('') then
              Add(',:ven');

            if mskDataAbertura.Text <> '  /  /    ' then
              Add(',:dtaber');

            if mskFechamento.Text <> '  /  /    ' then
              Add(',:dtfech');

            Add(')');

            if edtOSBloco.Text <> trim('') then
              ParamByName('bloc').AsInteger := StrToInt(edtOSBloco.Text);   

            if mskDataAbertura.Text <> '  /  /    ' then
              ParamByName('dtaber').AsDate := StrToDate(mskDataAbertura.Text);

            if mskFechamento.Text <> '  /  /    ' then
              ParamByName('dtFech').AsDate := StrToDate(mskFechamento.Text);


            if edtCodCliente.Text <> trim('') then
              ParamByName('cli').AsInteger := StrToInt(edtCodCliente.Text);

            if edtCodVendedor.Text <> trim('') then
              ParamByName('ven').AsInteger := StrToInt(edtCodVendedor.Text);

            if CbxStatus.ItemIndex = 0 then
              ParamByName('sta').AsString := 'A';

            if CbxStatus.ItemIndex = 1 then
              ParamByName('sta').AsString := 'E';

            if CbxStatus.ItemIndex = 2 then
              ParamByName('sta').AsString := 'F';

            ExecSQL();
            PnServicos.Enabled := True;
            PnIncluirItem.Enabled := True;
            PnPrincipaisOS.Enabled := False;
            edtCodFuncITem.SetFocus;
          end
        except
          MessageDlg('Erro ao confirmar dados da ordem de serviço!',mtError,[mbOk],0);
        end;

      with qryOS, SQL do
        begin
          Close;
          Clear;
          Add('SELECT MAX(codigo) AS codigo FROM os');
          Add('WHERE codcliente = :cli');
          ParamByName('cli').AsInteger := StrToInt(edtCodCliente.Text);
          Open;
          cdsOS.Open;
          cdsOS.Refresh;
          cdsOS.Last;

          edtCodigo.Text := cdsOS.FieldByName('codigo').AsString;
        end;
    end;

  if operacao = 2 then // ALTERAR
    begin
      with qryOS, SQL do
        begin
          Close;
          Clear;
          Add('UPDATE os SET codcliente = :cli');

          if edtOSBloco.Text <> trim('') then
            Add(', osbloco = :bloc');

          if edtCodVendedor.Text <> trim('') then
            Add(', codvendedor = :ven');

          Add(', status = :sta');

          if mskDataAbertura.Text <> '  /  /    ' then
            Add(', dataabertura = :dtaber');


          if mskFechamento.Text <> '  /  /    ' then
            Add(', datafechada = :dtfech');

          Add('WHERE codigo = :cod');

          if edtOSBloco.Text <> trim('') then
            ParamByName('bloc').AsInteger:= StrToInt(edtOSBloco.Text);
            
          ParamByName('cod').AsInteger := StrToInt(edtCodigo.Text);
          ParamByName('cli').AsInteger := StrToInt(edtCodCliente.Text);

          if edtCodVendedor.Text <> trim('') then
            ParamByName('ven').AsInteger := StrToInt(edtCodVendedor.Text);

          if CbxStatus.ItemIndex = 0 then
            ParamByName('sta').AsString := 'A';

          if CbxStatus.ItemIndex = 1 then
            ParamByName('sta').AsString := 'E';

          if CbxStatus.ItemIndex = 2 then
            ParamByName('sta').AsString := 'F';

          if mskDataAbertura.Text <> '  /  /    ' then
            ParamByName('dtaber').AsDate := StrToDate(mskDataAbertura.Text);
          
          if mskFechamento.Text <> '  /  /    ' then
            ParamByName('dtFech').AsDate := StrToDate(mskFechamento.Text);

          ExecSQL();
          PnServicos.Enabled := True;
          PnIncluirItem.Enabled := True;
          PnPrincipaisOS.Enabled := False;
          edtCodFuncITem.SetFocus;
        end;
    end;
end;

procedure TfrmIncluirOS.limparitens;
begin
  edtCodEquipamento.Clear;
  lblEquipamento.Caption := '';
  edtCodFuncITem.Clear;
  lblFuncionarioItem.Caption := '';
  edtHoraInicial.Clear;
  edtHoraFinal.Clear;
  edtQtdHoras.Clear;
  edtValorHora.Text := '0,00';
  lblValorTotalServico.Caption := '0,00';
  RchEdtObsItem.Clear;
end;

procedure TfrmIncluirOS.edtCodFuncITemEnter(Sender: TObject);
begin
  lblFuncionarioItem.Caption := '';
end;

procedure TfrmIncluirOS.edtCodEquipamentoEnter(Sender: TObject);
begin
  lblEquipamento.Caption := '';
end;

procedure TfrmIncluirOS.edtCodFuncITemExit(Sender: TObject);
begin
  if edtCodFuncITem.Text <> trim('') then
    begin
      lblFuncionarioItem.Caption := loFuncoes.BuscaFk(edtCodFuncITem.Text,'funcionarios','nome');

      if lblFuncionarioItem.Caption = trim('') then
        begin
          edtCodFuncITem.Clear;
          BtnBuscaFuncionarioItem.SetFocus;
        end
      else
        edtCodEquipamento.SetFocus;
    end;
end;

procedure TfrmIncluirOS.edtCodEquipamentoExit(Sender: TObject);
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
        mskDataItem.SetFocus;
    end;
end;

procedure TfrmIncluirOS.BtnBuscaEquipamentoClick(Sender: TObject);
begin
  frmEquipamentos := TfrmEquipamentos.Create(self);
  frmEquipamentos.telaChamando := 1;
  frmEquipamentos.ShowModal;
  FreeAndNil(frmEquipamentos);

  if lblEquipamento.Caption <> trim('') then
    mskDataItem.SetFocus;
end;

procedure TfrmIncluirOS.BtnBuscaFuncionarioItemClick(Sender: TObject);
begin
  frmFuncionarios := TfrmFuncionarios.Create(self);
  frmFuncionarios.telaChamando := 5;
  frmFuncionarios.ShowModal;
  FreeAndNil(frmFuncionarios);

  if lblFuncionarioItem.Caption <> trim('') then
    edtCodEquipamento.SetFocus;
end;

procedure TfrmIncluirOS.edtHoraFinalExit(Sender: TObject);
begin
  if StrToFloat(edtHoraInicial.Text) > StrToFloat(edtHoraFinal.Text) then
    begin
      MessageDlg('Hora Inicial maior que a Hora Final!',mtWarning,[mbOk],0);
      edtHoraInicial.SetFocus;
    end;

  try
    edtQtdHoras.Text := FloatToStr( StrToFloat(edtHoraFinal.Text) - StrToFloat(edtHoraInicial.Text) );
    edtQtdHoras.Text := FormatFloat('##,###,##0.00',StrToFloat(edtQtdHoras.Text));
  except

  end;
end;

procedure TfrmIncluirOS.edtValorHoraExit(Sender: TObject);
begin
  try
    lblValorTotalServico.Caption := FloatToStr( StrToFloat(edtValorHora.Text) * StrToFloat(edtQtdHoras.Text) );
//    lblValorTotalServico.Caption := FormatFloat('##,###,##0.00',StrToFloat(lblValorTotalServico.Caption));
    lblValorTotalServico.Caption := loFuncoes.TrataReal(lblValorTotalServico.Caption);

    vlrTotalItens := StrToFloat(edtValorHora.Text) * StrToFloat(edtQtdHoras.Text);
  except

  end;

end;

procedure TfrmIncluirOS.BtnGravarClick(Sender: TObject);
begin
  { VERIFICAÇÕES }
  if (edtCodEquipamento.Text = trim('')) or (edtCodEquipamento.Text = trim('0')) then
    begin
      MessageDlg('Campo equipamento não pode ser nulo!',mtWarning,[mbOk],0);
      edtCodEquipamento.SetFocus;
      Exit;
    end;

  if (edtCodFuncITem.Text = trim('')) or (edtCodFuncITem.Text = trim('0')) then
    begin
      MessageDlg('Campo funcionário do serviço não pode ser nulo!',mtWarning,[mbOk],0);
      edtCodFuncITem.SetFocus;
      Exit;
    end;

  if (StrToFloat(edtQtdHoras.Text) = 0) or (StrToFloat(edtQtdHoras.Text) < 0) then
    begin
      MessageDlg('Quantidade de horas não pode ser 0 ou negativa!',mtWarning,[mbOk],0);
      edtHoraInicial.SetFocus;
      Exit;
    end;

  if (StrToFloat(edtValorHora.Text) = 0) or (StrToFloat(edtValorHora.Text) < 0) then
    begin
      MessageDlg('Valor da hora não pode ser 0,00!',mtWarning,[mbOk],0);
      edtValorHora.SetFocus;
      Exit;
    end;

  // inserindo
  if operacaoItens = 1 then
    begin
      with qryItens, SQL do
        begin
          Close;
          Clear;
          Add('INSERT INTO itensos (codos,codequipamento,horainicial,');
          Add('horafinal,qtdhoras,codfuncionario,valorhora,total,obs');

          if mskDataItem.Text <> '  /  /    ' then
            Add(',datacad');

          Add(')');

          Add('VALUES (:os,:equip,:hini,:hfin,:qtd,:fun,:vlrhora,:vlrtotal,:obs');

          if mskDataItem.Text <> '  /  /    ' then
            Add(',:dtcad');

          Add(')');

          ParamByName('os').AsInteger     := StrToInt(edtCodigo.Text);
          ParamByName('equip').AsInteger  := StrToInt(edtCodEquipamento.Text);
          ParamByName('hini').AsFloat     := StrToFloat(edtHoraInicial.Text);
          ParamByName('hfin').AsFloat     := StrToFloat(edtHoraFinal.Text);
          ParamByName('qtd').AsFloat      := StrToFloat(edtQtdHoras.Text);
          ParamByName('fun').AsInteger    := StrToInt(edtCodFuncITem.Text);
          ParamByName('vlrhora').AsFloat  := StrToFloat(edtValorHora.Text);
          ParamByName('vlrtotal').AsFloat := vlrTotalItens;

          if mskDataItem.Text <> '  /  /    ' then
            ParamByName('dtcad').AsDate := StrToDate(mskDataItem.Text);

          ParamByName('obs').AsString := RchEdtObsItem.Text;

          ExecSQL();
        end;             
    end;

  // alterando
  if operacaoItens = 2 then
    begin
      with qryItens, SQL do
        begin
          Close;
          Clear;
          Add('UPDATE itensos SET codequipamento=:equip,horainicial=:hini,');
          Add('horafinal=:hfin,qtdhoras=:qtd,codfuncionario=:fun,valorhora=:vlrhora,total=:vlrtotal,');
          Add('obs=:obs');

          if mskDataItem.Text <> '  /  /    ' then
            Add(',datacad=:dtcad');

          Add('WHERE codigo = :cod');
          ParamByName('cod').AsInteger := cdsItens.FieldByName('codigo').AsInteger;
          ParamByName('equip').AsInteger  := StrToInt(edtCodEquipamento.Text);
          ParamByName('hini').AsFloat     := StrToFloat(edtHoraInicial.Text);
          ParamByName('hfin').AsFloat     := StrToFloat(edtHoraFinal.Text);
          ParamByName('qtd').AsFloat      := StrToFloat(edtQtdHoras.Text);
          ParamByName('fun').AsInteger    := StrToInt(edtCodFuncITem.Text);
          ParamByName('vlrhora').AsFloat  := StrToFloat(edtValorHora.Text);
          ParamByName('vlrtotal').AsFloat := StrToFloat(lblValorTotalServico.Caption);
          ParamByName('obs').AsString     := RchEdtObsItem.Text;

          if mskDataItem.Text <> '  /  /    ' then
            ParamByName('dtcad').AsDate := StrToDate(mskDataItem.Text);

          if StrToFloat(edtValorHora.Text) > vlrTotalItens then
            begin
              MessageDlg('Por favor forme o preço total desse item!',mtWarning,[mbOk],0);
              Exit;
            end;   

          ParamByName('vlrtotal').AsFloat := vlrTotalItens;
          ExecSQL();

          atualizaTotal;
        end;
    end;

  try
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT qtdhoras FROM equipamentos');
    qryAux.SQL.Add('WHERE codigo = :equip');
    qryAux.ParamByName('equip').AsInteger := StrToInt(edtCodEquipamento.Text);
    qryAux.Open;
    cdsAux.Close;
    cdsAux.Open;

    if cdsAux.FieldByName('qtdhoras').AsInteger < (StrToFloat(edtHoraFinal.Text)) then
      begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('UPDATE equipamentos SET qtdhoras = :horas');
        qryAux.SQL.Add('WHERE codigo = :equip');
        qryAux.ParamByName('equip').AsInteger := StrToInt(edtCodEquipamento.Text);
        qryAux.ParamByName('horas').AsFloat   := StrToFloat(edtHoraFinal.Text);
        qryAux.ExecSQL();
      end;
  except
    MessageDlg('Erro ao atualizar quantidade de horas do equipamento!' + #13 + 'Contate urgente o suporte técnico!',mtError,[mbOk],0);
  end;

  mostraItens;
  BtnFechar.Enabled := True;

  if operacaoItens = 1 then
    begin
      limparitens;
      edtCodFuncITem.SetFocus;
    end;

  BtnNovo.SetFocus;

end;

procedure TfrmIncluirOS.mostraItens;
begin
  if (edtCodigo.Text = trim('')) or (edtCodigo.Text = trim('0')) then
    Exit;

  try
    with qryItens, SQL do
      begin
        Close;
        Clear;
        Add('SELECT io.*, equip.descricao as equipamento, fun.nome as funcionario');
        Add('FROM itensos io');
        Add('INNER JOIN equipamentos equip');
        Add('ON equip.codigo = io.codequipamento');
        Add('INNER JOIN funcionarios fun');
        Add('ON fun.codigo = io.codfuncionario');
        Add('WHERE io.codos = :os');
        ParamByName('os').AsInteger := StrToInt(edtCodigo.Text);
        Open;
        cdsItens.Open;
        cdsItens.Refresh;
      end;
    except
      MessageDlg('Erro ao mostrar os itens da O.S.!',mtError,[mbOk],0);
    end;

  atualizaTotal;


  if cdsItens.RecordCount > 0 then
    begin
      TNumericField(cdsItens.FieldByName('valorhora')).DisplayFormat := ',0.00;-,0.00';
      TNumericField(cdsItens.FieldByName('total')).DisplayFormat := ',0.00;-,0.00';
    end;
end;

procedure TfrmIncluirOS.atualizaTotal;
begin
  if (edtCodigo.Text = trim('')) or (edtCodigo.Text = trim('0')) then
    Exit;

  with qryAux, SQL do
    begin
      Close;
      Clear;
      Add('SELECT SUM(total) as Total FROM itensos');
      Add('WHERE codos=:os');
      ParamByName('os').AsInteger := StrToInt(edtCodigo.Text);
      Open;
      cdsAux.Close;
      cdsAux.Open;
      cdsAux.Refresh;
    end;

  vlrTotalItens := cdsAux.FieldByName('total').AsFloat;
  lblValorTotal.Caption := cdsAux.FieldByName('total').AsString;

  if (lblValorTotal.Caption <> trim('')) {and (StrToFloat(lblValorTotal.Caption) <>}  then
    begin
      with qryAux, SQL do
        begin
          Close;
          Clear;
          Add('UPDATE os SET subtotal = :vlrtotal, valortotal=:vtotal WHERE codigo = :cod');
          ParamByName('cod').AsInteger    := StrToInt(edtCodigo.Text);
          ParamByName('vlrtotal').AsFloat := StrToFloat(lblValorTotal.Caption);
          ParamByName('vtotal').AsFloat   := StrToFloat(lblValorTotal.Caption);
          ExecSQL();
        end;
    end;

  if lblValorTotal.Caption <> trim('') then
    lblValorTotal.Caption := loFuncoes.TrataReal(lblValorTotal.Caption);



end;

procedure TfrmIncluirOS.BtnExcluirClick(Sender: TObject);
begin
  with qryAux, SQL do
    begin
      Close;
      Clear;
      Add('DELETE FROM itensos');
      Add('WHERE codos = :os AND codigo = :cod');
      ParamByName('os').AsInteger := StrToInt(edtCodigo.Text);
      ParamByName('cod').AsInteger:= cdsItens.FieldByName('codigo').AsInteger;
      ExecSQL();
    end;

  mostraItens;
end;

procedure TfrmIncluirOS.carregaOS;
begin
  limpar;
  limparitens;

  with qryOS, SQL do
    begin
      Close;
      Clear;
      Add('SELECT * FROM os');
      Add('WHERE codigo = :cod');
      ParamByName('cod').AsInteger := codOS;
      Open;
      cdsOS.Open;
      cdsOS.Refresh;
    end;

  edtCodigo.Text := IntToStr(codOS);

  if cdsOS.FieldByName('dataabertura').AsDateTime = 30/12/1899 then
    mskDataAbertura.Clear
  else
    mskDataAbertura.Text := cdsOS.FieldByName('dataabertura').AsString;

  if cdsOS.FieldByName('datafechada').AsDateTime = 30/12/1899 then
    mskFechamento.Clear
  else
    mskFechamento.Text := cdsOS.FieldByName('datafechada').AsString;

  if cdsOS.FieldByName('status').AsString = 'A' then
    CbxStatus.ItemIndex := 0;

  if cdsOS.FieldByName('status').AsString = 'F' then
    CbxStatus.ItemIndex := 1;

  lblValorTotal.Caption := cdsOS.FieldByName('valortotal').AsString;

  edtCodCliente.Text := cdsOS.FieldByName('codcliente').AsString;
  lblCliente.Caption := loFuncoes.BuscaFk(edtCodCliente.Text,'clientes','nome');

  edtCodVendedor.Text := cdsOS.FieldByName('codvendedor').AsString;
  lblVendedor.Caption := loFuncoes.BuscaFk(edtCodVendedor.Text,'funcionarios','nome');
  edtOSBloco.Text     := cdsOS.FieldByName('osbloco').AsString;

  mostraItens;
end;

procedure TfrmIncluirOS.carregaItensOS;
begin
  limparitens;

  edtCodEquipamento.Text := cdsItens.FieldByName('codequipamento').AsString;
  lblEquipamento.Caption := loFuncoes.BuscaFk(edtCodEquipamento.Text,'equipamentos','descricao');

  edtCodFuncITem.Text := cdsItens.FieldByName('codfuncionario').AsString;
  lblFuncionarioItem.Caption := loFuncoes.BuscaFk(edtCodFuncITem.Text,'funcionarios','nome');

  edtHoraInicial.Text := cdsItens.FieldByName('horainicial').AsString;
  edtHoraFinal.Text   := cdsItens.FieldByName('horafinal').AsString;
  edtQtdHoras.Text    := cdsItens.FieldByName('qtdhoras').AsString;
  edtValorHora.Text   := cdsItens.FieldByName('valorhora').AsString;
  edtValorHora.Text   := loFuncoes.TrataReal(edtValorHora.Text);
  lblValorTotalServico.Caption := cdsItens.FieldByName('total').AsString;
  lblValorTotalServico.Caption := loFuncoes.TrataReal(lblValorTotalServico.Caption);
  RchEdtObsItem.Text  := cdsItens.FieldByName('obs').AsString;
  mskDataItem.Text    := cdsItens.FieldByName('datacad').AsString;

  RchEdtObsItem.Text := cdsItens.FieldByName('obs').AsString;
end;

procedure TfrmIncluirOS.GrdItensCellClick(Column: TColumn);
begin
  carregaItensOS;

  operacaoItens := 2;
end;

procedure TfrmIncluirOS.GrdItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  carregaItensOS;
end;

procedure TfrmIncluirOS.GrdItensKeyPress(Sender: TObject; var Key: Char);
begin
  carregaItensOS;
end;

procedure TfrmIncluirOS.GrdItensKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  carregaItensOS;
end;

procedure TfrmIncluirOS.BtnAlterarClick(Sender: TObject);
begin
  operacaoItens := 2;
end;

procedure TfrmIncluirOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Self.Close;
end;

procedure TfrmIncluirOS.movimentaBanco;
var
  HUltima, HAgora, Intervalo, SaldoHoras: Real;
  CodItemOS: integer;
  Inverso: Real;
begin
  // pega o codigo do items da os
  with qryAux, SQL do
    begin
      Close;
      Clear;
      Add('SELECT MAX(codigo) AS codigo FROM itensos');
      Open;
      cdsAux.Close;
      cdsAux.Open;
      cdsAux.Refresh;

      CodItemOS := cdsAux.FieldByName('codigo').AsInteger;
    end;

  // se encontrou...
  if (codPenultimoItem >= 1) then
    begin
      // faz o select pra pegar os dados (horas...)
      with qryAux, SQL do
        begin
          Close;
          Clear;
          Add('SELECT * FROM itensos');
          Add('WHERE codigo = :cod');
          ParamByName('cod').AsInteger := codPenultimoItem;
          Open;
          cdsAux.Close;
          cdsAux.Open;
          cdsAux.Refresh;
        end;

      // atribui os valores as variáveis
      HUltima := cdsAux.FieldByName('horafinal').AsFloat;
      HAgora  := StrToFloat(edtHoraInicial.Text);
      Intervalo := HAgora - HUltima;

      // se há diferenca, positiva ou negativa
      if Intervalo <> 0 then
        begin
          // pega ultimo registro no banco de horas, para em seguida localizar o saldo
          with qryAux, SQL do
            begin
              Close;
              Clear;
              Add('SELECT MAX(codigo) AS Codigo FROM bancohoras');
              Add('WHERE codequipamento=:equip');
              ParamByName('equip').AsInteger := StrToInt(edtCodEquipamento.Text);
              Open;
              cdsAux.Close;
              cdsAux.Open;
              cdsAux.Refresh;
            end;

          // faz o select pra pegar o saldo de horas do equipamento
          if cdsAux.FieldByName('codigo').AsInteger > 0 then
            begin
              with qryAux, SQL do
                begin
                  Close;
                  Clear;
                  Add('SELECT saldo FROM bancohoras');
                  Add('WHERE codigo = :cod');
                  ParamByName('cod').AsInteger := cdsAux.FieldByName('codigo').AsInteger;
                  Open;
                  cdsAux.Open;
                  cdsAux.Refresh;

                  SaldoHoras := cdsAux.FieldByName('saldo').AsFloat;
                end;
            end;

          // insere a movimentação no banco de horas
          with qryAux, SQL do
            begin
              Close;
              Clear;
              Add('INSERT INTO bancohoras (codequipamento,movimento,saldo,coditemos)');
              Add('VALUES (:equip,:mov,:saldo,:itos)');
              ParamByName('equip').AsInteger := StrToInt(edtCodEquipamento.Text);

              if intervalo > 0 then
                ParamByName('mov').AsFloat     := -Intervalo
              else
                ParamByName('mov').AsFloat     := Intervalo;


              ParamByName('saldo').AsFloat   := Intervalo + SaldoHoras;
              ParamByName('itos').AsInteger  := CodItemOS;
              ExecSQL();
            end;
        end;

    end;

  // atualiza a qtd de horas trabalhadas do equipamento
  if StrToFloat(edtQtdHoras.Text) > 0 then
    begin
      with qryAux, SQL do
        begin
          Close;
          Clear;
          Add('UPDATE equipamentos SET qtdhoras = qtdhoras + :horas');
          Add('WHERE codigo = :equip');
          ParamByName('equip').AsInteger := StrToInt(edtCodEquipamento.Text);
          ParamByName('horas').AsFloat   := StrToFloat(edtQtdHoras.Text);
          ExecSQL();
        end;
    end;
end;

procedure TfrmIncluirOS.BtnFecharClick(Sender: TObject);
begin
  lblValorTotal.Caption := StringReplace(lblValorTotal.Caption, '.', '', []);

  if StrToFloat(lblValorTotal.Caption) = 0 then
    begin
      MessageDlg('O.S. com valor 0,00 não é possível faturar ou fechar!',mtWarning,[mbOk],0);
      Exit;
    end;

  frmFaturamentoOS := TfrmFaturamentoOS.Create(self);
  frmFaturamentoOS.codOS      := StrToInt(edtCodigo.Text);
  frmFaturamentoOS.codCliente := StrToInt(edtCodCliente.Text);
  frmFaturamentoOS.lblVlrSubTotal.Caption := lblValorTotal.Caption;
  frmFaturamentoOS.lblVlrTotal.Caption    := lblValorTotal.Caption;

  try
    frmFaturamentoOS.lblVlrSubTotal.Caption := FormatFloat('##,###,##0.00',StrToFloat(frmFaturamentoOS.lblVlrSubTotal.Caption));
    frmFaturamentoOS.lblVlrTotal.Caption    := FormatFloat('##,###,##0.00',StrToFloat(frmFaturamentoOS.lblVlrTotal.Caption));
  except

  end;

  frmFaturamentoOS.ShowModal;
  FreeAndNil(frmFaturamentoOS);

  Self.Close;
end;

procedure TfrmIncluirOS.BtnNovoClick(Sender: TObject);
begin
  limparitens;
  operacaoItens := 1;
  edtCodFuncITem.SetFocus;
end;

end.
