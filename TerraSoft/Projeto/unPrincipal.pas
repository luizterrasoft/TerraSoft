unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, Buttons, StdCtrls, ComCtrls, jpeg, FMTBcd,
  SqlExpr, Provider, DB, DBClient, unFuncoes, RlConsts;

type
  TfrmPrincipal = class(TForm)
    MnMnuPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    PnTopo: TPanel;
    SpdBtnClientes: TSpeedButton;
    N1: TMenuItem;
    Municpios1: TMenuItem;
    Regies1: TMenuItem;
    Fornecedores1: TMenuItem;
    SpdBtnFornecedores: TSpeedButton;
    Funcionrios1: TMenuItem;
    N2: TMenuItem;
    Produtos1: TMenuItem;
    SpdBtnProdutos: TSpeedButton;
    Servios1: TMenuItem;
    Equipamentos1: TMenuItem;
    SpdBtnEquipamentos: TSpeedButton;
    N3: TMenuItem;
    FormasdePagamento1: TMenuItem;
    CondiesdePagamento1: TMenuItem;
    Movimentaes1: TMenuItem;
    OSOrdensdeServio1: TMenuItem;
    Bevel1: TBevel;
    SpdBtnOS: TSpeedButton;
    ContasaReceber1: TMenuItem;
    ContasaReceber2: TMenuItem;
    Bevel2: TBevel;
    SpdBtnContasReceber: TSpeedButton;
    PlanodeContas1: TMenuItem;
    Contas1: TMenuItem;
    Caixa1: TMenuItem;
    N4: TMenuItem;
    SpdBtnCaixa: TSpeedButton;
    N5: TMenuItem;
    Manutenes1: TMenuItem;
    ContasaPagar1: TMenuItem;
    AgendaManutenes1: TMenuItem;
    dsPrincipal: TDataSource;
    cdsPrincipal: TClientDataSet;
    dspPrincipal: TDataSetProvider;
    qryPrincipal: TSQLQuery;
    dsAux: TDataSource;
    cdsAux: TClientDataSet;
    dspAux: TDataSetProvider;
    qryAux: TSQLQuery;
    RchEdtAvisosManutencoes: TRichEdit;
    SpdBtnContasPagar: TSpeedButton;
    SpdBtnManutencoes: TSpeedButton;
    SpdBtnSair: TSpeedButton;
    SubPlanodeContas1: TMenuItem;
    Configuraes1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobreosistema1: TMenuItem;
    Backup1: TMenuItem;
    Relatrios1: TMenuItem;
    Gerais1: TMenuItem;
    Empresa1: TMenuItem;
    StBarPrincipal: TStatusBar;
    N6: TMenuItem;
    iposdeCobrana1: TMenuItem;
    N7: TMenuItem;
    NotasFiscais1: TMenuItem;
    Entrada1: TMenuItem;
    Usurios1: TMenuItem;
    N8: TMenuItem;
    elas1: TMenuItem;
    BotesFunes1: TMenuItem;
    rocardeUsurio1: TMenuItem;
    Manutenes2: TMenuItem;
    Geral1: TMenuItem;
    Comisses1: TMenuItem;
    PorVendedor1: TMenuItem;
    Por1: TMenuItem;
    Funcionrios2: TMenuItem;
    Serviosrealizados1: TMenuItem;
    Equipamentos2: TMenuItem;
    ServiosporEquipamentos1: TMenuItem;
    Abastecimentos1: TMenuItem;
    iposdeCombustvel1: TMenuItem;
    PnLateral: TPanel;
    SpdBtnAbastecimentos: TSpeedButton;
    Compras1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure SpdBtnClientesClick(Sender: TObject);
    procedure Municpios1Click(Sender: TObject);
    procedure Regies1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure SpdBtnFornecedoresClick(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure SpdBtnProdutosClick(Sender: TObject);
    procedure Servios1Click(Sender: TObject);
    procedure Equipamentos1Click(Sender: TObject);
    procedure SpdBtnEquipamentosClick(Sender: TObject);
    procedure FormasdePagamento1Click(Sender: TObject);
    procedure CondiesdePagamento1Click(Sender: TObject);
    procedure OSOrdensdeServio1Click(Sender: TObject);
    procedure SpdBtnOSClick(Sender: TObject);
    procedure ContasaReceber2Click(Sender: TObject);
    procedure SpdBtnContasReceberClick(Sender: TObject);
    procedure PlanodeContas1Click(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure Caixa1Click(Sender: TObject);
    procedure SpdBtnCaixaClick(Sender: TObject);
    procedure Manutenes1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AgendaManutenes1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure SpdBtnContasPagarClick(Sender: TObject);
    procedure SpdBtnManutencoesClick(Sender: TObject);
    procedure SpdBtnSairClick(Sender: TObject);
    procedure SubPlanodeContas1Click(Sender: TObject);
    procedure Sobreosistema1Click(Sender: TObject);
    procedure Backup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Empresa1Click(Sender: TObject);
    procedure Gerais1Click(Sender: TObject);
    procedure Lavaes1Click(Sender: TObject);
    procedure iposdeCobrana1Click(Sender: TObject);
    procedure Entrada1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure elas1Click(Sender: TObject);
    procedure BotesFunes1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure rocardeUsurio1Click(Sender: TObject);
    procedure Geral1Click(Sender: TObject);
    procedure Serviosrealizados1Click(Sender: TObject);
    procedure ServiosporEquipamentos1Click(Sender: TObject);
    procedure Abastecimentos1Click(Sender: TObject);
    procedure iposdeCombustvel1Click(Sender: TObject);
    procedure SpdBtnAbastecimentosClick(Sender: TObject);
    procedure Compras1Click(Sender: TObject);
  private

    loFuncoes: TFuncoes;
    procedure verificaManutencoes;

  public

    { RESOLUCAO }
    oldwidth:integer;
    OldHeight :integer;
    Auxwidth:integer;
    Auxheight:integer ;
    {                  }

    iModoSuporte: integer; // 1 = em suporte 
    iCaixaUsado: integer;
    bChamarEquipamento: boolean;
    iOperacao: integer;
    iCodUsuario: integer;
    sCampo: string;

    function SetScreenResolution(Width, Height: integer): Longint;
    procedure ajusteResolucao;
    procedure ajusteResolucao2;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses UnClientes, unMunicipios, unRegioes, unFornecedores, unFuncionarios,
  unProdutos, unServicos, unEquipamentos, unFormasPgto, unCondicoesPgto,
  unOS, unContasReceber, unPlanoContas, unContas, unCaixa, unManutencoes,
  unAgendaManu, unDM, unConsultaManutencoes, unContasPagar,
  unSubPlanosdeContas, unSobre, unBackupRestore, Shellapi, unEmpresas,
  unConfiguracoes, unLavacoes, unTiposCobrancas, unEntradasCompras,
  Principal, unUsuarios, unTelas, unBotoes, unLogin,
  unRelatoriosManutencoes, unServicosRealizadosPorFuncionario,
  unSelRelServicosEquipamentos, unAbastecimentos, unTiposCombustiveis,
  unCompras;

{$R *.dfm}

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
  if not(loFuncoes.Permissao(1,1,true)) then
    Exit;

  frmClientes := TfrmClientes.Create(self);
  frmClientes.ShowModal;
  FreeAndNil(frmClientes);
end;

procedure TfrmPrincipal.SpdBtnClientesClick(Sender: TObject);
begin
  if not(loFuncoes.Permissao(1,0,true)) then
    Exit;

  try
    frmClientes := TfrmClientes.Create(self);
    frmClientes.ShowModal;
  finally
    FreeAndNil(frmClientes);
  end;
end;

procedure TfrmPrincipal.Municpios1Click(Sender: TObject);
begin
  frmMunicipios := TfrmMunicipios.Create(self);
  frmMunicipios.ShowModal;
  FreeAndNil(frmMunicipios);
end;

procedure TfrmPrincipal.Regies1Click(Sender: TObject);
begin
  frmRegioes := TfrmRegioes.Create(self);
  frmRegioes.ShowModal;
  FreeAndNil(frmRegioes);

end;

procedure TfrmPrincipal.Fornecedores1Click(Sender: TObject);
begin
  frmFornecedores := TfrmFornecedores.Create(self);
  frmFornecedores.ShowModal;
  FreeAndNil(frmFornecedores);
end;

procedure TfrmPrincipal.SpdBtnFornecedoresClick(Sender: TObject);
begin
  frmFornecedores := TfrmFornecedores.Create(self);
  frmFornecedores.ShowModal;
  FreeAndNil(frmFornecedores);
end;

procedure TfrmPrincipal.Funcionrios1Click(Sender: TObject);
begin
  frmFuncionarios := TfrmFuncionarios.Create(self);
  frmFuncionarios.ShowModal;
  FreeAndNil(frmFuncionarios);
end;

procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
begin
  frmProdutos := TfrmProdutos.Create(self);
  frmProdutos.ShowModal;
  FreeAndNil(frmProdutos);
end;

procedure TfrmPrincipal.SpdBtnProdutosClick(Sender: TObject);
begin
  frmProdutos := TfrmProdutos.Create(self);
  frmProdutos.ShowModal;
  FreeAndNil(frmProdutos);
end;

procedure TfrmPrincipal.Servios1Click(Sender: TObject);
begin
  frmServicos := TfrmServicos.Create(self);
  frmServicos.ShowModal;
  FreeAndNil(frmServicos);
end;

procedure TfrmPrincipal.Equipamentos1Click(Sender: TObject);
begin
  frmEquipamentos := TfrmEquipamentos.Create(self);
  frmEquipamentos.ShowModal;
  FreeAndNil(frmEquipamentos);
end;

procedure TfrmPrincipal.SpdBtnEquipamentosClick(Sender: TObject);
begin
  frmEquipamentos := TfrmEquipamentos.Create(self);
  frmEquipamentos.ShowModal;
  FreeAndNil(frmEquipamentos);
end;

procedure TfrmPrincipal.FormasdePagamento1Click(Sender: TObject);
begin
  frmFormasPgto := TfrmFormasPgto.Create(self);
  frmFormasPgto.ShowModal;
  FreeAndNil(frmFormasPgto);
end;

procedure TfrmPrincipal.CondiesdePagamento1Click(Sender: TObject);
begin
  frmCondicoesPgto := TfrmCondicoesPgto.Create(self);
  frmCondicoesPgto.ShowModal;
  FreeAndNil(frmCondicoesPgto);
end;

procedure TfrmPrincipal.OSOrdensdeServio1Click(Sender: TObject);
begin
  frmOS := TfrmOS.Create(self);
  frmOS.ShowModal;
  FreeAndNil(frmOS);
end;

procedure TfrmPrincipal.SpdBtnOSClick(Sender: TObject);
begin
  frmOS := TfrmOS.Create(self);
  frmOS.ShowModal;
  FreeAndNil(frmOS);
end;

procedure TfrmPrincipal.ContasaReceber2Click(Sender: TObject);
begin
  frmContasReceber := TfrmContasReceber.Create(self);
  frmContasReceber.ShowModal;
  FreeAndNil(frmContasReceber);
end;

procedure TfrmPrincipal.SpdBtnContasReceberClick(Sender: TObject);
begin
  frmContasReceber := TfrmContasReceber.Create(self);
  frmContasReceber.ShowModal;
  FreeAndNil(frmContasReceber);
end;

procedure TfrmPrincipal.PlanodeContas1Click(Sender: TObject);
begin
  frmPlanoContas := TfrmPlanoContas.Create(self);
  frmPlanoContas.ShowModal;
  FreeAndNil(frmPlanoContas);
end;

procedure TfrmPrincipal.Contas1Click(Sender: TObject);
begin
  frmContas := TfrmContas.Create(self);
  frmContas.ShowModal;
  FreeAndNil(frmContas);
end;

procedure TfrmPrincipal.Caixa1Click(Sender: TObject);
begin
  frmCaixa := TfrmCaixa.Create(self);
  frmCaixa.ShowModal;
  FreeAndNil(frmCaixa);
end;

procedure TfrmPrincipal.SpdBtnAbastecimentosClick(Sender: TObject);
begin
  try
    frmAbastecimentos := TfrmAbastecimentos.Create(self);
    frmAbastecimentos.ShowModal;
  finally
    FreeAndNil(frmAbastecimentos);
  end;
end;

procedure TfrmPrincipal.SpdBtnCaixaClick(Sender: TObject);
begin
  frmCaixa := TfrmCaixa.Create(self);
  frmCaixa.ShowModal;
  FreeAndNil(frmCaixa);
end;

procedure TfrmPrincipal.Manutenes1Click(Sender: TObject);
begin
  frmConsultaManutencoes := TfrmConsultaManutencoes.Create(self);
  frmConsultaManutencoes.ShowModal;
  FreeAndNil(frmConsultaManutencoes);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  Data_Vencimento, Data_Hoje: TDate;
begin
{  Data_Hoje := Date;
  Data_Vencimento := StrToDate('25/09/2015');

  if Data_Hoje > Data_Vencimento then
    Application.Terminate;}


  verificaManutencoes;

  { PEGA O ÚLTIMO CAIXA }
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT MAX(codigo) AS CodCaixa');
  qryAux.SQL.Add('FROM caixaprincipal');
  qryAux.Open;
  cdsAux.Close;
  cdsAux.Open;
  iCaixaUsado := cdsAux.FieldByName('codcaixa').AsInteger;

  { PEGA NOME DA EMPRESA }
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT razaosocial, fantasia FROM empresas');
  qryAux.Open;
  cdsAux.Close;
  cdsAux.Open;

  StBarPrincipal.Panels[1].Text := cdsAux.FieldByName('razaosocial').AsString + ' - ' + cdsAux.FieldByName('fantasia').AsString;
end;

procedure TfrmPrincipal.AgendaManutenes1Click(Sender: TObject);
begin
  frmAgendaManu := TfrmAgendaManu.Create(self);
  frmAgendaManu.ShowModal;
  FreeAndNil(frmAgendaManu);
  verificaManutencoes;
end;

procedure TfrmPrincipal.verificaManutencoes;
begin
  RchEdtAvisosManutencoes.Clear;
  RchEdtAvisosManutencoes.Lines.Add('                                         ');
  RchEdtAvisosManutencoes.Lines.Add('          Agenda de Manutenções          ');
  RchEdtAvisosManutencoes.Lines.Add('                                         ');

  with qryPrincipal, SQL do
    begin
      Close;
      Clear;
      Add('SELECT * FROM equipamentos');
      Add('WHERE status = 0 OR status IS NULL');
      Open;
      cdsPrincipal.Close;
      cdsPrincipal.Open;
    end;

  while not(cdsPrincipal.Eof) do
    begin
      with qryAux, SQL do
        begin
          Close;
          Clear;
          Add('SELECT * FROM agendamanu');
          Add('WHERE codequipamento = :equi');
          Add('AND status = 0 OR status IS NULL');
          ParamByName('equi').AsInteger := cdsPrincipal.FieldByName('codigo').AsInteger;
          Open;
          cdsAux.Close;
          cdsAux.Open;
        end;

      if (cdsPrincipal.FieldByName('qtdhoras').AsFloat >= cdsAux.FieldByName('aviso').AsFloat) and (cdsAux.FieldByName('aviso').AsFloat > 0) then
        begin
          RchEdtAvisosManutencoes.Lines.Add(cdsAux.FieldByName('descricao').AsString + ' - ' + cdsPrincipal.FieldByName('descricao').AsString);
        end;

      cdsPrincipal.Next;
    end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  loFuncoes := TFuncoes.Create;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  loFuncoes.Free;
end;

procedure TfrmPrincipal.ContasaPagar1Click(Sender: TObject);
begin
  frmContasPagar := TfrmContasPagar.Create(self);
  frmContasPagar.ShowModal;
  FreeAndNil(frmContasPagar);
end;

procedure TfrmPrincipal.SpdBtnContasPagarClick(Sender: TObject);
begin
  frmContasPagar := TfrmContasPagar.Create(self);
  frmContasPagar.ShowModal;
  FreeAndNil(frmContasPagar);
end;

procedure TfrmPrincipal.SpdBtnManutencoesClick(Sender: TObject);
begin
  frmConsultaManutencoes := TfrmConsultaManutencoes.Create(self);
  frmConsultaManutencoes.ShowModal;
  FreeAndNil(frmConsultaManutencoes);
end;

procedure TfrmPrincipal.SpdBtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPrincipal.SubPlanodeContas1Click(Sender: TObject);
begin
  try
    frmSubPlanosdeContas := TfrmSubPlanosdeContas.Create(self);
    frmSubPlanosdeContas.ShowModal;
  finally
    FreeAndNil(frmSubPlanosdeContas);
  end;
end;

procedure TfrmPrincipal.Sobreosistema1Click(Sender: TObject);
begin
  frmSobre := TfrmSobre.Create(self);

  try
    frmSobre.ShowModal;
  finally
    FreeAndNil(frmSobre);
  end;
end;

procedure TfrmPrincipal.Backup1Click(Sender: TObject);
begin
  frmBackup := TfrmBackup.Create(self);

  try
    frmBackup.ShowModal;
  finally
    FreeAndNil(frmBackup);
  end;
end;

function TfrmPrincipal.SetScreenResolution(Width,
  Height: integer): Longint;
var
  DeviceMode: TDeviceMode;
begin
  with DeviceMode do begin
    dmSize := SizeOf(TDeviceMode);
    dmPelsWidth := Width;
    dmPelsHeight := Height;
    dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
  end;
  Result := ChangeDisplaySettings(DeviceMode, CDS_UPDATEREGISTRY);
end;

procedure TfrmPrincipal.ajusteResolucao;
var
  Mens: String;
begin
  EnableMenuItem(GetSystemMenu(handle, False), SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);

  if (Screen.Width  =1024) and (Screen.Height = 768) then
  begin
  Auxwidth :=1024;
  Auxheight :=768;
  end;

 if (Screen.Width <> 1024) and (Screen.Height <> 768) then
 begin

    OldWidth := Screen.Width;
    OldHeight := Screen.Height;
    Auxwidth:=oldwidth;
     Auxheight:=OldHeight;

    Mens := 'O Programa "Seu programa -"irá ajustar sua resolução de vídeo  para 1024 X 768'+#13;
    Mens := Mens + 'automaticamente para uma melhor visualisação, mas não se preocupe pois ao termino de uso ,' + #13;
    Mens := Mens + ' ele retornará sua resolução novamente. Muito obrigado...';
    MessageBox(Self.Handle, PChar(Mens), 'Ajuste de Vídeo', MB_OK + MB_ICONWARNING);
    SetScreenResolution(1024, 768);
 end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {If (Screen.Width = 1024)and(Auxwidth=1024)and(Screen.Height = 768)and(Auxheight=768) then
    begin
      Application.Terminate;
    end;

  If (Screen.Width = 1024)and(Auxwidth<>1024)and(Screen.Height = 768)and(Auxheight<>768) then
  begin
    if  (Application.MessageBox('Voltando para sua resolução antiga...','Ajustes Automaticos',MB_OK +MB_ICONWARNING)=ID_OK )then
      Begin
        OldWidth := 800  ;
        OldHeight := 600;
        SetScreenResolution(Auxwidth, Auxheight);
      end;
      Application.Terminate;
  end;}
end;

procedure TfrmPrincipal.ajusteResolucao2;
const
  ScreenWidth: LongInt = 500;
var
 i: integer;
  begin

  if (Screen.Width <> ScreenWidth) then
  begin
    // aqui faz a escala de todos os componentes do form, o scaled precisa estar true
    Self.ScaleBy(Screen.Width, ScreenWidth);

    // aqui eu forço a escala para os estilos do devexpress, se você não utiliza não precisa
    for I := ComponentCount - 1 downto 0 do
    begin
      if (Components[I] is TBitBtn) then
        TBitBtn(Components[I]).Font.Size := Trunc(TBitBtn(Components[I]).Font.Size * (Screen.Width / ScreenWidth));
    end;
  end;

end;

procedure TfrmPrincipal.Empresa1Click(Sender: TObject);
begin
  frmEmpresa := TfrmEmpresa.Create(self);

  try
    frmEmpresa.ShowModal;
  finally
    FreeAndNil(frmEmpresa);
  end;
end;

procedure TfrmPrincipal.Gerais1Click(Sender: TObject);
begin
  frmConfiguracoes := TfrmConfiguracoes.Create(self);

  try
    frmConfiguracoes.ShowModal;
  finally
    FreeAndNil(frmConfiguracoes);
  end;
end;

procedure TfrmPrincipal.Lavaes1Click(Sender: TObject);
begin
  frmLavacoes := TfrmLavacoes.Create(self);

  try
    frmLavacoes.ShowModal;
  finally
    FreeAndNil(frmLavacoes);
  end;
end;

procedure TfrmPrincipal.iposdeCobrana1Click(Sender: TObject);
begin
  frmTiposCobrancas := TfrmTiposCobrancas.Create(self);

  try
    frmTiposCobrancas.ShowModal;
  finally
    FreeAndNil(frmTiposCobrancas);
  end;
end;

procedure TfrmPrincipal.Entrada1Click(Sender: TObject);
begin
  frmEntradasCompras := TfrmEntradasCompras.Create(self);

  try
    frmEntradasCompras.ShowModal;
  finally
    FreeAndNil(frmEntradasCompras);
  end;
end;

procedure TfrmPrincipal.Usurios1Click(Sender: TObject);
begin
  try
    frmUsuarios := TfrmUsuarios.Create(self);
    frmUsuarios.ShowModal;
  finally
    FreeAndNil(frmUsuarios);
  end;
end;

procedure TfrmPrincipal.elas1Click(Sender: TObject);
begin
  try
    frmTelas := TfrmTelas.Create(self);
    frmTelas.ShowModal;
  finally
    FreeAndNil(frmTelas);
  end;

end;

procedure TfrmPrincipal.BotesFunes1Click(Sender: TObject);
begin
  try
    frmBotoes := TfrmBotoes.Create(self);
    frmBotoes.ShowModal;
  finally
    FreeAndNil(frmBotoes);
  end;
end;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  frmLogin := TfrmLogin.Create(self);
  frmLogin.ShowModal;
  FreeAndNil(frmLogin);
end;

procedure TfrmPrincipal.rocardeUsurio1Click(Sender: TObject);
begin
  try
    frmPrincipal.Close;
    frmLogin := TfrmLogin.Create(self);
    frmLogin.ShowModal;
  finally
    FreeAndNil(frmLogin);
  end;
end;

procedure TfrmPrincipal.Geral1Click(Sender: TObject);
begin
  try
    frmRelatoriosManutencoes := TfrmRelatoriosManutencoes.Create(self);
    frmRelatoriosManutencoes.ShowModal;
  finally
    FreeAndNil(frmRelatoriosManutencoes);
  end;
end;

procedure TfrmPrincipal.Serviosrealizados1Click(Sender: TObject);
begin
  try
    frmServicosRealizadosPorFuncionario := TfrmServicosRealizadosPorFuncionario.Create(self);
    frmServicosRealizadosPorFuncionario.ShowModal;
  finally
    FreeAndNil(frmServicosRealizadosPorFuncionario);
  end;
end;

procedure TfrmPrincipal.ServiosporEquipamentos1Click(Sender: TObject);
begin
  try
    frmSelRelServicosEquipamentos := TfrmSelRelServicosEquipamentos.Create(self);
    frmSelRelServicosEquipamentos.ShowModal;
  finally
    FreeAndNil(frmSelRelServicosEquipamentos);
  end;
end;

procedure TfrmPrincipal.Abastecimentos1Click(Sender: TObject);
begin
  try
    frmAbastecimentos := TfrmAbastecimentos.Create(self);
    frmAbastecimentos.ShowModal;
  finally
    FreeAndNil(frmAbastecimentos);
  end;
end;

procedure TfrmPrincipal.iposdeCombustvel1Click(Sender: TObject);
begin
  try
    frmTiposCombustiveis := TfrmTiposCombustiveis.Create(self);
    frmTiposCombustiveis.ShowModal;
  finally
    FreeAndNil(frmTiposCombustiveis);
  end;
end;

procedure TfrmPrincipal.Compras1Click(Sender: TObject);
begin
  try
    frmCompras := TfrmCompras.Create(self);
    frmCompras.ShowModal;
  finally
    FreeAndNil(frmCompras);
  end;
end;

initialization
  //RLConsts.SetVersion(3,72,'B');

end.


