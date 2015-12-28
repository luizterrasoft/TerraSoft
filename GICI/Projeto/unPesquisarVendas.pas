unit unPesquisarVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPesquisa, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  plsComboBox, Mask, plsTMaskEdit, plsEdit, unVariaveis, Menus,
  unConjuntoDadosConstrutora, unConjuntoDadosTipoImovel, unConjuntoDadosEstado,
  unConjuntoDadosCidade, unConjuntoDadosBairro, unConjuntoDadosRua; 

  type
    TConstrutora = record
      codigo: Integer;
      nome: string[100];
    end;

  type
    TTipoImovel = record
      codigo: Integer;
      nome: string[100];
    end;

  type
    TEstado = record
      codigo: Integer;
      nome: string[100];
    end;

  type
    TCidade = record
      codigo: Integer;
      nome: string[100];
    end;

  type
    TBairro = record
      codigo: Integer;
      nome: string[100];
    end;

  type
    TRua = record
      codigo: Integer;
      nome: string[100];
      cep: string[9];
    end;


type
  TfrmPesquisarVendas = class(TfrmPesquisar)
    lblCodigo: TLabel;
    plsEdCodigo: TPlsEdit;
    pnlTipoVenda: TPanel;
    lblTipoVenda: TLabel;
    lblImovelDe: TLabel;
    plsCbBxTipoVenda: TPlsComboBox;
    plsCbBxImovelDe: TPlsComboBox;
    grpBxDataVenda: TGroupBox;
    lblEntreDataVenda: TLabel;
    plsMedDataVendaInicio: TPlsMaskEdit;
    plsMedDataVendaFinal: TPlsMaskEdit;
    grpBxValorVenda: TGroupBox;
    lblEntreValorVenda: TLabel;
    plsMedValorVendaInicio: TPlsEdit;
    plsMedValorVendaFim: TPlsEdit;
    rdGrpTipoPessoa: TRadioGroup;
    grpBxNomePessoa: TGroupBox;
    plsEdNomePessoa: TPlsEdit;
    pnlConstrutora: TPanel;
    lblConstrutora: TLabel;
    spBtnBuscaConstrutora: TSpeedButton;
    plsEdConstrutora: TPlsEdit;
    pnlTipoImovel: TPanel;
    lblTipoImovel: TLabel;
    spBtnBuscaTipoImovel: TSpeedButton;
    plsEdTipoImovel: TPlsEdit;
    grpBxEndereco: TGroupBox;
    pnlEstado: TPanel;
    spBtnBuscaEstado: TSpeedButton;
    lblEstado: TLabel;
    plsEdEstado: TPlsEdit;
    pnlCidade: TPanel;
    spBtnBuscaCidade: TSpeedButton;
    lblCidade: TLabel;
    plsEdCidade: TPlsEdit;
    pnlRua: TPanel;
    spBtnBuscaRua: TSpeedButton;
    lblRua: TLabel;
    plsEdRua: TPlsEdit;
    pnlBairro: TPanel;
    lblBairro: TLabel;
    spBtnBuscaBairro: TSpeedButton;
    plsEdBairro: TPlsEdit;
    lblImovel: TLabel;
    lblFiltrosUsados: TLabel;
    lblNomeFiltrosUsados: TLabel;
    mnItDetalhar: TMenuItem;
    zQryDadosCODIGO: TIntegerField;
    zQryDadosDATA_VENDA: TDateField;
    zQryDadosATIVO: TStringField;
    zQryDadosTIPO_PESSOA: TStringField;
    zQryDadosNOME_TIPO_PESSOA: TStringField;
    zQryDadosTIPO_VENDA: TStringField;
    zQryDadosIMOVEL_DE: TStringField;
    zQryDadosCC_VALOR_VENDA: TStringField;
    zQryDadosCC_DEDUCOES: TStringField;
    zQryDadosCC_VALOR_BEM_NEGOCIAVEL: TStringField;
    zQryDadosDEDUZIR_BEM_NEGOC_VALOR_VENDA: TStringField;
    zQryDadosTIPO_CALCULO_COMISSAO: TStringField;
    zQryDadosCC_VALOR_PARA_CALCULO_COMISSAO: TStringField;
    zQryDadosCC_PERCENTUAL_SOBRE_VENDA: TStringField;
    zQryDadosCC_VALOR_TOTAL_COMISSAO: TStringField;
    zQryDadosCC_PERCENTUAL_SOBRE_COMISSAO: TStringField;
    zQryDadosOBSERVACAO: TStringField;
    zQryDadosDATA_CANCELAMENTO: TDateTimeField;
    zQryDadosNOME_CONSTRUTORA: TStringField;
    zQryDadosCODIGO_IMOVEL: TIntegerField;
    zQryDadosSTATUS_IMOVEL: TSmallintField;
    zQryDadosCODIGO_TIPO_IMOVEL: TIntegerField;
    zQryDadosNOME_TIPO_IMOVEL: TStringField;
    zQryDadosCODIGO_ESTADO: TIntegerField;
    zQryDadosSIGLA_ESTADO: TStringField;
    zQryDadosCODIGO_CIDADE: TIntegerField;
    zQryDadosNOME_CIDADE: TStringField;
    zQryDadosCODIGO_BAIRRO: TIntegerField;
    zQryDadosNOME_BAIRRO: TStringField;
    zQryDadosCODIGO_RUA: TIntegerField;
    zQryDadosNOME_RUA: TStringField;
    zQryDadosCEP_RUA: TStringField;
    zQryDadosSITUACAO_DESEJAVEL: TStringField;
    zQryDadosCC_VALOR_IMOVEL_IMOVEL: TStringField;
    zQryDadosDESCRICAO_IMOVEL: TStringField;
    cdsDadosCODIGO: TIntegerField;
    cdsDadosDATA_VENDA: TDateField;
    cdsDadosATIVO: TStringField;
    cdsDadosTIPO_PESSOA: TStringField;
    cdsDadosNOME_TIPO_PESSOA: TStringField;
    cdsDadosTIPO_VENDA: TStringField;
    cdsDadosIMOVEL_DE: TStringField;
    cdsDadosCC_VALOR_VENDA: TStringField;
    cdsDadosCC_DEDUCOES: TStringField;
    cdsDadosCC_VALOR_BEM_NEGOCIAVEL: TStringField;
    cdsDadosDEDUZIR_BEM_NEGOC_VALOR_VENDA: TStringField;
    cdsDadosTIPO_CALCULO_COMISSAO: TStringField;
    cdsDadosCC_VALOR_PARA_CALCULO_COMISSAO: TStringField;
    cdsDadosCC_PERCENTUAL_SOBRE_VENDA: TStringField;
    cdsDadosCC_VALOR_TOTAL_COMISSAO: TStringField;
    cdsDadosCC_PERCENTUAL_SOBRE_COMISSAO: TStringField;
    cdsDadosOBSERVACAO: TStringField;
    cdsDadosDATA_CANCELAMENTO: TDateTimeField;
    cdsDadosNOME_CONSTRUTORA: TStringField;
    cdsDadosCODIGO_IMOVEL: TIntegerField;
    cdsDadosSTATUS_IMOVEL: TSmallintField;
    cdsDadosCODIGO_TIPO_IMOVEL: TIntegerField;
    cdsDadosNOME_TIPO_IMOVEL: TStringField;
    cdsDadosCODIGO_ESTADO: TIntegerField;
    cdsDadosSIGLA_ESTADO: TStringField;
    cdsDadosCODIGO_CIDADE: TIntegerField;
    cdsDadosNOME_CIDADE: TStringField;
    cdsDadosCODIGO_BAIRRO: TIntegerField;
    cdsDadosNOME_BAIRRO: TStringField;
    cdsDadosCODIGO_RUA: TIntegerField;
    cdsDadosNOME_RUA: TStringField;
    cdsDadosCEP_RUA: TStringField;
    cdsDadosSITUACAO_DESEJAVEL: TStringField;
    cdsDadosCC_VALOR_IMOVEL_IMOVEL: TStringField;
    cdsDadosDESCRICAO_IMOVEL: TStringField;
    lblTotalRegistros: TLabel;
    procedure plsCbBxTipoVendaChange(Sender: TObject);
    procedure plsCbBxImovelDeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure plsEdTipoImovelExit(Sender: TObject);
    procedure spBtnBuscaTipoImovelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure plsEdEstadoExit(Sender: TObject);
    procedure spBtnBuscaEstadoClick(Sender: TObject);
    procedure plsEdCidadeExit(Sender: TObject);
    procedure spBtnBuscaCidadeClick(Sender: TObject);
    procedure plsEdBairroExit(Sender: TObject);
    procedure spBtnBuscaBairroClick(Sender: TObject);
    procedure plsEdRuaExit(Sender: TObject);
    procedure spBtnBuscaRuaClick(Sender: TObject);
    procedure dbGrdDadosPesquisaDblClick(Sender: TObject);
    procedure mnItDetalharClick(Sender: TObject);
    procedure plsEdConstrutoraExit(Sender: TObject);
    procedure spBtnBuscaConstrutoraClick(Sender: TObject);
  private
    FoTipoVenda: TTiposVendas;
    FoTipoImovelDe: TTiposImoveisDe;
    FoConjuntoDadosConstrutora: TConjuntoDadosConstrutora;
    FoConjuntoDadosTipoImovel: TConjuntoDadosTipoImovel;
    FoConjuntoDadosEstado: TConjuntoDadosEstado;
    FoConjuntoDadosCidade: TConjuntoDadosCidade;
    FoConjuntoDadosBairro: TConjuntoDadosBairro;
    FoConjuntoDadosRua: TConjuntoDadosRua;

    procedure AbreTelaSelecaoConstrutora(pnTpSelecao:Word);
    procedure VerificarConstrutoraExiste;
    procedure AbreTelaSelecaoTipoImovel(pnTpSelecao:Word);
    procedure VerificarTipoImovelExiste;
    procedure AbreTelaSelecaoEstado(pnTpSelecao:Word);
    procedure VerificarEstadoExiste;
    procedure AbreTelaSelecaoCidade(pnTpSelecao:Word);
    procedure VerificarCidadeExiste;
    procedure AbreTelaSelecaoBairro(pnTpSelecao:Word);
    procedure VerificarBairroExiste;
    procedure AbreTelaSelecaoRua(pnTpSelecao:Word);
    procedure VerificarRuaExiste;

    procedure popularComboBoxImovelDe;
    procedure LimparEndereco(nEnderecoChamou: String); //limpa os campos do endere�o, a partir daquele que alterou
    function ValidarAcessoEndereco(nEnderecoChamou: String): boolean; //valida se o acesso ao endere�o pode ser realizado
    procedure DetalharVenda(pnCodVenda:Integer);
  public
    FoConstrutora: TConstrutora;
    FoTipoImovel: TTipoImovel;
    FoEstado: TEstado;
    FoCidade: TCidade;
    FoBairro: TBairro;
    FoRua: TRua;
    FbPodeLimparEndereco: Boolean;

    procedure PassarParametro(pTipo:String; pValores:OleVariant); override;
  protected
    procedure SelecionarTodosDados; override;
    procedure Pesquisar; override;
    procedure FormatarValores; override;
    procedure LimparTela; override;
  end;
var
  frmPesquisarVendas: TfrmPesquisarVendas;

implementation

uses
  unConstantes, unSelecionaRegistroTipoImovel, unPrincipal,
  unSelecionaRegistroEstado, unSelecionaRegistroCidade,
  unSelecionaRegistroBairro, unSelecionaRegistroRua, unSelecionaRegistroConstrutora,
  unExibeDadosVenda;

const
  fnSELECIONAR_CONSTRUTORA_NORMAL = 1;
  fnSELECIONAR_CONSTRUTORA_DIGITANDO = 2;
  fnSELECIONAR_TIPO_IMOVEL_NORMAL    = 1;
  fnSELECIONAR_TIPO_IMOVEL_DIGITANDO = 2;
  fnSELECIONAR_ESTADO_NORMAL    = 1;
  fnSELECIONAR_ESTADO_DIGITANDO = 2;
  fnSELECIONAR_CIDADE_NORMAL    = 1;
  fnSELECIONAR_CIDADE_DIGITANDO = 2;
  fnSELECIONAR_BAIRRO_NORMAL    = 1;
  fnSELECIONAR_BAIRRO_DIGITANDO = 2;
  fnSELECIONAR_RUA_NORMAL    = 1;
  fnSELECIONAR_RUA_DIGITANDO = 2;

{$R *.dfm}

(* procedimentos de controle *)

procedure TfrmPesquisarVendas.PassarParametro(pTipo:String; pValores:OleVariant);
begin
  if(pTipo = PRM_NAO_LIMPAR_ENDERECO)then
  begin
    FbPodeLimparEndereco := False;
  end;
end;

procedure TfrmPesquisarVendas.LimparTela;
begin
  inherited;
  rdGrpTipoPessoa.ItemIndex := -1;
  plsCbBxTipoVenda.ItemIndex := -1;
  plsCbBxImovelDe.ItemIndex := -1;
  pnlConstrutora.Visible := False;
  lblFiltrosUsados.Caption := STRING_INDEFINIDO;

  FoConstrutora.codigo := NUMERO_INDEFINIDO;
  FoConstrutora.nome := STRING_INDEFINIDO;
  FoTipoImovel.codigo := NUMERO_INDEFINIDO;
  FoTipoImovel.nome := STRING_INDEFINIDO;
  FoEstado.codigo := NUMERO_INDEFINIDO;
  FoEstado.nome := STRING_INDEFINIDO;
  FoCidade.codigo := NUMERO_INDEFINIDO;
  FoCidade.nome := STRING_INDEFINIDO;
  FoBairro.codigo := NUMERO_INDEFINIDO;
  FoBairro.nome := STRING_INDEFINIDO;
  FoRua.codigo := NUMERO_INDEFINIDO;
  FoRua.nome := STRING_INDEFINIDO;
  FoRua.cep := STRING_INDEFINIDO;
end;


procedure TfrmPesquisarVendas.SelecionarTodosDados;
begin
  cdsDados.Close;
  zQryDados.Close;
  zQryDados.SQL.Clear;
  zQryDados.SQL.Add('SELECT v.codigo,v.data_venda,v.ativo,v.tipo_pessoa,');
  zQryDados.SQL.Add('CASE WHEN v.tipo_pessoa = ''F�SICA'' THEN pf.nome ');
  zQryDados.SQL.Add('WHEN v.tipo_pessoa = ''JUR�DICA'' THEN pj.nome ');
  zQryDados.SQL.Add('ELSE '''' END AS NOME_TIPO_PESSOA,');
  zQryDados.SQL.Add('v.tipo_venda,');
  zQryDados.SQL.Add('CASE WHEN v.venda_meu_agenciamento_meu = ''SIM'' THEN ''MEU'' ');
  zQryDados.SQL.Add('WHEN v.venda_meu_agenciamento_colegas = ''SIM'' THEN ''COLEGAS'' ');
  zQryDados.SQL.Add('WHEN v.venda_pauta_construtora = ''SIM'' THEN ''CONSTRUTORA'' ');
  zQryDados.SQL.Add('WHEN v.venda_pauta_terceiros = ''SIM'' THEN ''TERCEIROS'' ');
  zQryDados.SQL.Add('ELSE '''' END AS IMOVEL_DE,');
  zQryDados.SQL.Add('CAST(v.valor_venda AS VARCHAR(20)) AS CC_VALOR_VENDA,');
  zQryDados.SQL.Add('CAST(v.deducoes AS VARCHAR(20)) AS CC_DEDUCOES,');
  zQryDados.SQL.Add('CAST(v.valor_bem_negociavel AS VARCHAR(20)) AS CC_VALOR_BEM_NEGOCIAVEL,');
  zQryDados.SQL.Add('v.deduzir_bem_negoc_valor_venda,v.tipo_calculo_comissao,');
  zQryDados.SQL.Add('CAST(v.valor_para_calculo_comissao AS VARCHAR(20)) AS CC_VALOR_PARA_CALCULO_COMISSAO,');
  zQryDados.SQL.Add('CAST(v.percentual_sobre_venda AS VARCHAR(20)) AS CC_PERCENTUAL_SOBRE_VENDA,');
  zQryDados.SQL.Add('CAST(v.valor_total_comissao AS VARCHAR(20)) AS CC_VALOR_TOTAL_COMISSAO,');
  zQryDados.SQL.Add('CAST(v.percentual_sobre_comissao AS VARCHAR(20)) AS CC_PERCENTUAL_SOBRE_COMISSAO,');
  zQryDados.SQL.Add('v.observacao,v.data_cancelamento,');
  zQryDados.SQL.Add('const.nome AS NOME_CONSTRUTORA,');
  zQryDados.SQL.Add('i.codigo AS CODIGO_IMOVEL,i.status AS STATUS_IMOVEL,');
  zQryDados.SQL.Add('ti.codigo AS CODIGO_TIPO_IMOVEL,ti.nome AS NOME_TIPO_IMOVEL,');
  zQryDados.SQL.Add('est.codigo AS CODIGO_ESTADO,est.sigla AS SIGLA_ESTADO,');
  zQryDados.SQL.Add('cid.codigo AS CODIGO_CIDADE,cid.nome AS NOME_CIDADE,');
  zQryDados.SQL.Add('bai.codigo AS CODIGO_BAIRRO,bai.nome AS NOME_BAIRRO,');
  zQryDados.SQL.Add('rua.codigo AS CODIGO_RUA,rua.nome AS NOME_RUA,rua.cep AS CEP_RUA,');
  zQryDados.SQL.Add('i.situacao_desejavel,');
  zQryDados.SQL.Add('CAST(i.valor_imovel AS VARCHAR(20)) AS CC_VALOR_IMOVEL_IMOVEL,');
  zQryDados.SQL.Add('i.descricao AS DESCRICAO_IMOVEL ');
  zQryDados.SQL.Add('FROM vendas v ');
  zQryDados.SQL.Add('LEFT JOIN cliente_pessoa_fisica pf ON v.cod_fk_cliente_pessoa_fisica = pf.codigo ');
  zQryDados.SQL.Add('LEFT JOIN cliente_pessoa_juridica pj ON v.cod_fk_cliente_pessoa_juridica = pj.codigo ');
  zQryDados.SQL.Add('LEFT JOIN construtora const ON v.cod_fk_tp_vnd_construtora = const.codigo ');
  zQryDados.SQL.Add('JOIN imovel i ON v.cod_fk_imovel = i.codigo ');
  zQryDados.SQL.Add('JOIN tipo_imovel ti ON i.cod_fk_tipo_imovel = ti.codigo ');
  zQryDados.SQL.Add('JOIN estado est ON i.cod_fk_estado = est.codigo ');
  zQryDados.SQL.Add('JOIN cidade cid ON i.cod_fk_cidade = cid.codigo ');
  zQryDados.SQL.Add('JOIN bairro bai ON i.cod_fk_bairro = bai.codigo ');
  zQryDados.SQL.Add('JOIN rua rua ON i.cod_fk_rua = rua.codigo ');
  zQryDados.SQL.Add(FoFuncoes.inserirCondicaoSelectNaoTrazerRegistroNulo('v'));
  zQryDados.SQL.Add('ORDER BY v.codigo ');
  zQryDados.Open;
  cdsDados.Open;

  lblFiltrosUsados.Caption := STRING_INDEFINIDO;
  lblTotalRegistros.Caption := 'Total de Registros: ' + IntToStr(cdsDados.RecordCount);
end;

procedure TfrmPesquisarVendas.Pesquisar;
var
  nCodigo: Integer;
  dtDataVendaInicio,dtDataVendaFim: TDate;
  dValorTotalInicio,dValorTotalFim: Currency;
  sTipoPessoa: String;
  sNomePessoa: String;
  sTipoVenda: String;
  sImovelDeMeuAgenciamentoMeu,sImovelDeMeuAgenciamentoColegas: String;
  sImovelDePautaConstrutora,sImovelDePautaTerceiros: String;
  nConstrutora: Integer;
  nTipoImovel: Integer;
  nEstado,nCidade,nBairro,nRua: Integer;
  sFiltrosUsados: String;

  procedure CarregarValores;
  begin
    nCodigo := FoFuncoes.formatarValorInteiro(plsEdCodigo.Text);
    dtDataVendaInicio := FoFuncoes.formatarData(plsMedDataVendaInicio.Text);
    dtDataVendaFim := FoFuncoes.formatarData(plsMedDataVendaFinal.Text);
    dValorTotalInicio := FoFuncoes.formatarValorCurrency(plsMedValorVendaInicio.Text,True);
    dValorTotalFim := FoFuncoes.formatarValorCurrency(plsMedValorVendaFim.Text,True);

    case rdGrpTipoPessoa.ItemIndex of
      0: sTipoPessoa := VLR_TP_PESSOA_FISICA;
      1: sTipoPessoa := VLR_TP_PESSOA_JURIDICA;
    else
      sTipoPessoa := STRING_INDEFINIDO;
    end;
    sNomePessoa := Trim(plsEdNomePessoa.Text);

    case plsCbBxTipoVenda.ItemIndex of
      0: sTipoVenda := TIPO_VENDA_MEU_AGENCIAMENTO;
      1: sTipoVenda := TIPO_VENDA_PAUTA;
    else
      sTipoVenda := STRING_INDEFINIDO;
    end;
    sImovelDeMeuAgenciamentoMeu := VLR_NAO;
    sImovelDeMeuAgenciamentoColegas := VLR_NAO;
    sImovelDePautaConstrutora := VLR_NAO;
    sImovelDePautaTerceiros := VLR_NAO;

    case plsCbBxImovelDe.ItemIndex of
      0:
      begin
        case plsCbBxTipoVenda.ItemIndex of
          0: sImovelDeMeuAgenciamentoMeu := VLR_SIM; //tipo venda = meu agenciamento, im�vel de = meu
          1: sImovelDePautaConstrutora := VLR_SIM; //tipo venda = pauta, im�vel de = construtora
        end;
      end;
      1:
      begin
        case plsCbBxTipoVenda.ItemIndex of
          0: sImovelDeMeuAgenciamentoColegas := VLR_SIM; //tipo venda = meu agenciamento, im�vel de = colegas
          1: sImovelDePautaTerceiros := VLR_SIM; //tipo venda = pauta, im�vel de = terceiros
        end;
      end;
    end;

    nConstrutora := FoConstrutora.codigo;
    nTipoImovel := FoTipoImovel.codigo;
    nEstado := FoEstado.codigo;
    nCidade := FoCidade.codigo;
    nBairro := FoBairro.codigo;
    nRua := FoRua.codigo;
  end;

begin
  sFiltrosUsados := STRING_INDEFINIDO;
  CarregarValores;

  cdsDados.Close;
  zQryDados.Close;
  zQryDados.SQL.Clear;
  zQryDados.SQL.Add('SELECT v.codigo,v.data_venda,v.ativo,v.tipo_pessoa,');
  zQryDados.SQL.Add('CASE WHEN v.tipo_pessoa = ''F�SICA'' THEN pf.nome ');
  zQryDados.SQL.Add('WHEN v.tipo_pessoa = ''JUR�DICA'' THEN pj.nome ');
  zQryDados.SQL.Add('ELSE '''' END AS NOME_TIPO_PESSOA,');
  zQryDados.SQL.Add('v.tipo_venda,');
  zQryDados.SQL.Add('CASE WHEN v.venda_meu_agenciamento_meu = ''SIM'' THEN ''MEU'' ');
  zQryDados.SQL.Add('WHEN v.venda_meu_agenciamento_colegas = ''SIM'' THEN ''COLEGAS'' ');
  zQryDados.SQL.Add('WHEN v.venda_pauta_construtora = ''SIM'' THEN ''CONSTRUTORA'' ');
  zQryDados.SQL.Add('WHEN v.venda_pauta_terceiros = ''SIM'' THEN ''TERCEIROS'' ');
  zQryDados.SQL.Add('ELSE '''' END AS IMOVEL_DE,');
  zQryDados.SQL.Add('CAST(v.valor_venda AS VARCHAR(20)) AS CC_VALOR_VENDA,');
  zQryDados.SQL.Add('CAST(v.deducoes AS VARCHAR(20)) AS CC_DEDUCOES,');
  zQryDados.SQL.Add('CAST(v.valor_bem_negociavel AS VARCHAR(20)) AS CC_VALOR_BEM_NEGOCIAVEL,');
  zQryDados.SQL.Add('v.deduzir_bem_negoc_valor_venda,v.tipo_calculo_comissao,');
  zQryDados.SQL.Add('CAST(v.valor_para_calculo_comissao AS VARCHAR(20)) AS CC_VALOR_PARA_CALCULO_COMISSAO,');
  zQryDados.SQL.Add('CAST(v.percentual_sobre_venda AS VARCHAR(20)) AS CC_PERCENTUAL_SOBRE_VENDA,');
  zQryDados.SQL.Add('CAST(v.valor_total_comissao AS VARCHAR(20)) AS CC_VALOR_TOTAL_COMISSAO,');
  zQryDados.SQL.Add('CAST(v.percentual_sobre_comissao AS VARCHAR(20)) AS CC_PERCENTUAL_SOBRE_COMISSAO,');
  zQryDados.SQL.Add('v.observacao,v.data_cancelamento,');
  zQryDados.SQL.Add('const.nome AS NOME_CONSTRUTORA,');
  zQryDados.SQL.Add('i.codigo AS CODIGO_IMOVEL,i.status AS STATUS_IMOVEL,');
  zQryDados.SQL.Add('ti.codigo AS CODIGO_TIPO_IMOVEL,ti.nome AS NOME_TIPO_IMOVEL,');
  zQryDados.SQL.Add('est.codigo AS CODIGO_ESTADO,est.sigla AS SIGLA_ESTADO,');
  zQryDados.SQL.Add('cid.codigo AS CODIGO_CIDADE,cid.nome AS NOME_CIDADE,');
  zQryDados.SQL.Add('bai.codigo AS CODIGO_BAIRRO,bai.nome AS NOME_BAIRRO,');
  zQryDados.SQL.Add('rua.codigo AS CODIGO_RUA,rua.nome AS NOME_RUA,rua.cep AS CEP_RUA,');
  zQryDados.SQL.Add('i.situacao_desejavel,');
  zQryDados.SQL.Add('CAST(i.valor_imovel AS VARCHAR(20)) AS CC_VALOR_IMOVEL_IMOVEL,');
  zQryDados.SQL.Add('i.descricao AS DESCRICAO_IMOVEL ');
  zQryDados.SQL.Add('FROM vendas v ');
  zQryDados.SQL.Add('LEFT JOIN cliente_pessoa_fisica pf ON v.cod_fk_cliente_pessoa_fisica = pf.codigo ');
  zQryDados.SQL.Add('LEFT JOIN cliente_pessoa_juridica pj ON v.cod_fk_cliente_pessoa_juridica = pj.codigo ');
  zQryDados.SQL.Add('LEFT JOIN construtora const ON v.cod_fk_tp_vnd_construtora = const.codigo ');
  zQryDados.SQL.Add('JOIN imovel i ON v.cod_fk_imovel = i.codigo ');
  zQryDados.SQL.Add('JOIN tipo_imovel ti ON i.cod_fk_tipo_imovel = ti.codigo ');
  zQryDados.SQL.Add('JOIN estado est ON i.cod_fk_estado = est.codigo ');
  zQryDados.SQL.Add('JOIN cidade cid ON i.cod_fk_cidade = cid.codigo ');
  zQryDados.SQL.Add('JOIN bairro bai ON i.cod_fk_bairro = bai.codigo ');
  zQryDados.SQL.Add('JOIN rua rua ON i.cod_fk_rua = rua.codigo ');

  if(nCodigo <> NUMERO_INDEFINIDO)then
  begin
    zQryDados.SQL.Add('AND v.codigo = :codigo ');
    zQryDados.ParamByName('codigo').AsInteger := nCodigo;
    FoFuncoes.AdicionarInformacao(sFiltrosUsados,'C�digo');
  end;

  if(dtDataVendaInicio <> NUMERO_INDEFINIDO)and(dtDataVendaFim <> NUMERO_INDEFINIDO)then
  begin
    zQryDados.SQL.Add('AND v.data_venda BETWEEN :dtVendaInicio AND :dtVendaFim ');
    zQryDados.ParamByName('dtVendaInicio').AsDate := dtDataVendaInicio;
    zQryDados.ParamByName('dtVendaFim').AsDate := dtDataVendaFim;
    FoFuncoes.AdicionarInformacao(sFiltrosUsados,'Data da Venda');
  end;

  if(dValorTotalInicio <> NUMERO_INDEFINIDO)and(dValorTotalFim <> NUMERO_INDEFINIDO)then
  begin
    zQryDados.SQL.Add('AND v.valor_venda BETWEEN :valorVendaInicio AND :valorVendaFim ');
    zQryDados.ParamByName('valorVendaInicio').AsCurrency := dValorTotalInicio;
    zQryDados.ParamByName('valorVendaFim').AsCurrency := dValorTotalFim;
    FoFuncoes.AdicionarInformacao(sFiltrosUsados,'Valor da Venda');
  end;

  if(sTipoPessoa <> STRING_INDEFINIDO)then
  begin
    zQryDados.SQL.Add('AND v.tipo_pessoa = :tipo_pessoa ');
    zQryDados.ParamByName('tipo_pessoa').AsString := sTipoPessoa;
    FoFuncoes.AdicionarInformacao(sFiltrosUsados,'Tipo Pessoa');
  end;

  if(sNomePessoa <> STRING_INDEFINIDO)and(
    (sTipoPessoa=VLR_TP_PESSOA_FISICA)or(sTipoPessoa=VLR_TP_PESSOA_JURIDICA))then
  begin
    if(sTipoPessoa=VLR_TP_PESSOA_FISICA)then
      zQryDados.SQL.Add('AND pf.nome=:nomePessoa ')
    else if(sTipoPessoa=VLR_TP_PESSOA_JURIDICA)then
      zQryDados.SQL.Add('AND pj.nome=:nomePessoa ');
    zQryDados.ParamByName('nomePessoa').AsString := sNomePessoa;
    FoFuncoes.AdicionarInformacao(sFiltrosUsados,'Nome da Pessoa');
  end;

  if(sTipoVenda <> STRING_INDEFINIDO)then
  begin
    zQryDados.SQL.Add('AND v.tipo_venda = :tipo_venda ');
    zQryDados.ParamByName('tipo_venda').AsString := sTipoVenda;
    FoFuncoes.AdicionarInformacao(sFiltrosUsados,'Tipo de Venda');
  end;

  if(sImovelDeMeuAgenciamentoMeu = VLR_SIM)then
  begin
    zQryDados.SQL.Add('AND v.venda_meu_agenciamento_meu = :venda_meu_agenciamento_meu ');
    zQryDados.ParamByName('venda_meu_agenciamento_meu').AsString := VLR_SIM;
    FoFuncoes.AdicionarInformacao(sFiltrosUsados,'Im�vel De');
  end;

  if(sImovelDeMeuAgenciamentoColegas = VLR_SIM)then
  begin
    zQryDados.SQL.Add('AND v.venda_meu_agenciamento_colegas = :venda_meu_agenciamento_colegas ');
    zQryDados.ParamByName('venda_meu_agenciamento_colegas').AsString := VLR_SIM;
    FoFuncoes.AdicionarInformacao(sFiltrosUsados,'Im�vel De');
  end;

  if(sImovelDePautaConstrutora = VLR_SIM)then
  begin
    zQryDados.SQL.Add('AND v.venda_pauta_construtora = :venda_pauta_construtora ');
    zQryDados.ParamByName('venda_pauta_construtora').AsString := VLR_SIM;
    FoFuncoes.AdicionarInformacao(sFiltrosUsados,'Im�vel De');
  end;

  if(sImovelDePautaTerceiros = VLR_SIM)then
  begin
    zQryDados.SQL.Add('AND v.venda_pauta_terceiros = :venda_pauta_terceiros ');
    zQryDados.ParamByName('venda_pauta_terceiros').AsString := VLR_SIM;
    FoFuncoes.AdicionarInformacao(sFiltrosUsados,'Im�vel De');
  end;

  if(nConstrutora <> NUMERO_INDEFINIDO)then
  begin
    zQryDados.SQL.Add('AND const.codigo =:codigoConstrutora ');
    zQryDados.ParamByName('codigoConstrutora').AsInteger := nConstrutora;
    FoFuncoes.AdicionarInformacao(sFiltrosUsados,'Construtora');
  end;

  if(nTipoImovel <> NUMERO_INDEFINIDO)then
  begin
    zQryDados.SQL.Add('AND ti.codigo =:codigoTipoImovel ');
    zQryDados.ParamByName('codigoTipoImovel').AsInteger := nTipoImovel;
    FoFuncoes.AdicionarInformacao(sFiltrosUsados,'Tipo de Im�vel');
  end;

  if(nEstado <> NUMERO_INDEFINIDO)then
  begin
    zQryDados.SQL.Add('AND est.codigo =:codigoEstado ');
    zQryDados.ParamByName('codigoEstado').AsInteger := nEstado;
    FoFuncoes.AdicionarInformacao(sFiltrosUsados,'Estado');
  end;

  if(nCidade <> NUMERO_INDEFINIDO)then
  begin
    zQryDados.SQL.Add('AND cid.codigo =:codigoCidade ');
    zQryDados.ParamByName('codigoCidade').AsInteger := nCidade;
    FoFuncoes.AdicionarInformacao(sFiltrosUsados,'Cidade');
  end;

  if(nBairro <> NUMERO_INDEFINIDO)then
  begin
    zQryDados.SQL.Add('AND bai.codigo =:codigoBairro ');
    zQryDados.ParamByName('codigoBairro').AsInteger := nBairro;
    FoFuncoes.AdicionarInformacao(sFiltrosUsados,'Bairro');
  end;

  if(nRua <> NUMERO_INDEFINIDO)then
  begin
    zQryDados.SQL.Add('AND rua.codigo =:codigoRua ');
    zQryDados.ParamByName('codigoRua').AsInteger := nRua;
    FoFuncoes.AdicionarInformacao(sFiltrosUsados,'Rua');
  end;

  zQryDados.SQL.Add('ORDER BY v.codigo');
  zQryDados.Open;
  cdsDados.Open;

  lblFiltrosUsados.Caption := sFiltrosUsados;
  lblTotalRegistros.Caption := 'Total de Registros: ' + IntToStr(cdsDados.RecordCount);  
  VerificaEncontrouRegistros;
end;

procedure TfrmPesquisarVendas.popularComboBoxImovelDe();
begin
  if(Self.FoTipoVenda = [meu_agenciamento])then
  begin
    plsCbBxImovelDe.Clear;
    plsCbBxImovelDe.Items.Add('MEU');
    plsCbBxImovelDe.Items.Add('COLEGAS');
  end
  else if(Self.FoTipoVenda = [pauta])then
  begin
    plsCbBxImovelDe.Clear;
    plsCbBxImovelDe.Items.Add('CONSTRUTORA');
    plsCbBxImovelDe.Items.Add('TERCEIROS');
  end;
  plsCbBxImovelDe.ItemIndex := -1;
end;

procedure TfrmPesquisarVendas.FormatarValores();
var
  sValorMonetario: String;
begin
  if((cdsDados.Active)and(cdsDados.RecordCount>0))then
  begin
    cdsDados.First;
    while(not(cdsDados.Eof))do
    begin
      cdsDados.Edit;

      sValorMonetario :=  cdsDadosCC_VALOR_VENDA.AsString;
      sValorMonetario := StringReplace(sValorMonetario, '.', ',', [rfReplaceAll, rfIgnoreCase]);
      if(sValorMonetario <> STRING_INDEFINIDO)then
        cdsDadosCC_VALOR_VENDA.AsString := Self.FoFuncoes.formatarValorMonetario(sValorMonetario);

      sValorMonetario :=  cdsDadosCC_DEDUCOES.AsString;
      sValorMonetario := StringReplace(sValorMonetario, '.', ',', [rfReplaceAll, rfIgnoreCase]);
      if(sValorMonetario <> STRING_INDEFINIDO)then
        cdsDadosCC_DEDUCOES.AsString := Self.FoFuncoes.formatarValorMonetario(sValorMonetario);

      sValorMonetario :=  cdsDadosCC_VALOR_BEM_NEGOCIAVEL.AsString;
      sValorMonetario := StringReplace(sValorMonetario, '.', ',', [rfReplaceAll, rfIgnoreCase]);
      if(sValorMonetario <> STRING_INDEFINIDO)then
        cdsDadosCC_VALOR_BEM_NEGOCIAVEL.AsString := Self.FoFuncoes.formatarValorMonetario(sValorMonetario);

      sValorMonetario :=  cdsDadosCC_VALOR_PARA_CALCULO_COMISSAO.AsString;
      sValorMonetario := StringReplace(sValorMonetario, '.', ',', [rfReplaceAll, rfIgnoreCase]);
      if(sValorMonetario <> STRING_INDEFINIDO)then
        cdsDadosCC_VALOR_PARA_CALCULO_COMISSAO.AsString := Self.FoFuncoes.formatarValorMonetario(sValorMonetario);

      sValorMonetario :=  cdsDadosCC_PERCENTUAL_SOBRE_VENDA.AsString;
      sValorMonetario := StringReplace(sValorMonetario, '.', ',', [rfReplaceAll, rfIgnoreCase]);
      if(sValorMonetario <> STRING_INDEFINIDO)then
        cdsDadosCC_PERCENTUAL_SOBRE_VENDA.AsString := Self.FoFuncoes.formatarValorMonetario(sValorMonetario);

      sValorMonetario :=  cdsDadosCC_VALOR_TOTAL_COMISSAO.AsString;
      sValorMonetario := StringReplace(sValorMonetario, '.', ',', [rfReplaceAll, rfIgnoreCase]);
      if(sValorMonetario <> STRING_INDEFINIDO)then
        cdsDadosCC_VALOR_TOTAL_COMISSAO.AsString := Self.FoFuncoes.formatarValorMonetario(sValorMonetario);

      sValorMonetario :=  cdsDadosCC_PERCENTUAL_SOBRE_COMISSAO.AsString;
      sValorMonetario := StringReplace(sValorMonetario, '.', ',', [rfReplaceAll, rfIgnoreCase]);
      if(sValorMonetario <> STRING_INDEFINIDO)then
        cdsDadosCC_PERCENTUAL_SOBRE_COMISSAO.AsString := Self.FoFuncoes.formatarValorMonetario(sValorMonetario);

      sValorMonetario :=  cdsDadosCC_VALOR_IMOVEL_IMOVEL.AsString;
      sValorMonetario := StringReplace(sValorMonetario, '.', ',', [rfReplaceAll, rfIgnoreCase]);
      if(sValorMonetario <> STRING_INDEFINIDO)then
        cdsDadosCC_VALOR_IMOVEL_IMOVEL.AsString := Self.FoFuncoes.formatarValorMonetario(sValorMonetario);

      cdsDados.Post;

      cdsDados.Next;
    end;
  end;
end;


procedure TfrmPesquisarVendas.LimparEndereco(nEnderecoChamou: String);
  procedure limparEstado();
  begin
    plsEdEstado.Clear;
    Self.FoEstado.codigo := NUMERO_INDEFINIDO;
    Self.FoEstado.nome := STRING_INDEFINIDO;
  end;
  procedure limparCidade();
  begin
    plsEdCidade.Clear;
    Self.FoCidade.codigo := NUMERO_INDEFINIDO;
    Self.FoCidade.nome := STRING_INDEFINIDO;
  end;
  procedure limparBairro();
  begin
    plsEdBairro.Clear;
    Self.FoBairro.codigo := NUMERO_INDEFINIDO;
    Self.FoBairro.nome := STRING_INDEFINIDO;
  end;
  procedure limparRua();
  begin
    plsEdRua.Clear;
    Self.FoRua.codigo := NUMERO_INDEFINIDO;
    Self.FoRua.nome := STRING_INDEFINIDO;
    Self.FoRua.cep := STRING_INDEFINIDO;
  end;

begin
    if(Self.FbPodeLimparEndereco)then
  begin
    if(nEnderecoChamou = 'ESTADO')then
    begin
      limparEstado();
      limparCidade();
      limparBairro();
      limparRua();
    end
    else if(nEnderecoChamou = 'CIDADE')then
    begin
      limparCidade();
      limparBairro();
      limparRua();
    end
    else if(nEnderecoChamou = 'BAIRRO')then
    begin
      limparBairro();
      limparRua();
    end
    else if(nEnderecoChamou = 'RUA')then
    begin
      limparRua();
    end;
  end;

  Self.FbPodeLimparEndereco := True;
end;

function TfrmPesquisarVendas.ValidarAcessoEndereco(nEnderecoChamou: String): boolean;
var
  bAcesso: Boolean;
begin
  bAcesso := False;

  if(nEnderecoChamou = 'CIDADE')then
  begin
    if(FoEstado.codigo <> NUMERO_INDEFINIDO)then
      bAcesso := True;
  end
  else if(nEnderecoChamou = 'BAIRRO')then
  begin
    if(FoEstado.codigo <> NUMERO_INDEFINIDO)and(FoCidade.codigo <> NUMERO_INDEFINIDO)then
      bAcesso := True;
  end
  else if(nEnderecoChamou = 'RUA')then
  begin
    if(FoEstado.codigo <> NUMERO_INDEFINIDO)and(FoCidade.codigo <> NUMERO_INDEFINIDO)and
      (FoBairro.codigo <> NUMERO_INDEFINIDO)then
      bAcesso := True;
  end;

  Result := bAcesso;
end;

procedure TfrmPesquisarVendas.AbreTelaSelecaoConstrutora(pnTpSelecao:Word);
var
  vParametros: Variant;
begin
  vParametros := VarArrayCreate([0,2],varVariant);
  vParametros[0] := PRM_PESQUISA_NOME;
  vParametros[1] := plsEdTipoImovel.Text;
  vParametros[2] := False;

  case pnTpSelecao of

    fnSELECIONAR_CONSTRUTORA_NORMAL:
    begin
      try
        Application.CreateForm(TfrmSelecionaRegistroConstrutora, frmSelecionaRegistroConstrutora);
        frmSelecionaRegistroConstrutora.passarParametro(PRM_TELA_CHAMOU,FORM_PESQUISAR_VENDA);
        frmSelecionaRegistroConstrutora.passarParametro(PRM_DEFINE_FILTRO_PADRAO_TELA_SELECAO, null);
        if(plsEdConstrutora.Text <> STRING_INDEFINIDO)then
          frmSelecionaRegistroConstrutora.passarParametro(PRM_ENVIA_FILTRO_PESQUISA, vParametros);
        frmSelecionaRegistroConstrutora.passarParametro(PRM_AJUSTAR_LARGURA_GRIDE,null);
        frmSelecionaRegistroConstrutora.passarParametro(PRM_VISIBLE_FALSE_BOTAO_NOVO_FORM_SELECAO,null);
        FoFuncoes.AjustarPosicaoFormCadastroSelecaoRegistro(frmPrincipal,
         frmPesquisarVendas,frmSelecionaRegistroConstrutora,pnlConstrutora);
        frmSelecionaRegistroConstrutora.ShowModal;
      finally
        if(FoConstrutora.codigo <> NUMERO_INDEFINIDO)then
        begin
          plsEdConstrutora.Text := FoConstrutora.nome;
          FoFuncoes.focarComponente(plsEdTipoImovel);
        end;
        FreeAndNil(frmSelecionaRegistroConstrutora);
      end;
    end;

    fnSELECIONAR_CONSTRUTORA_DIGITANDO:
    begin
      try
        Application.CreateForm(TfrmSelecionaRegistroConstrutora, frmSelecionaRegistroConstrutora);
        frmSelecionaRegistroConstrutora.passarParametro(PRM_TELA_CHAMOU,FORM_PESQUISAR_VENDA);
        frmSelecionaRegistroConstrutora.passarParametro(PRM_DEFINE_FILTRO_PADRAO_TELA_SELECAO, null);
        frmSelecionaRegistroConstrutora.passarParametro(PRM_ENVIA_FILTRO_PESQUISA, vParametros);
        frmSelecionaRegistroConstrutora.passarParametro(PRM_AJUSTAR_LARGURA_GRIDE,null);
        frmSelecionaRegistroConstrutora.passarParametro(PRM_VISIBLE_FALSE_BOTAO_NOVO_FORM_SELECAO,null);
        FoFuncoes.AjustarPosicaoFormCadastroSelecaoRegistro(frmPrincipal,
         frmPesquisarVendas,frmSelecionaRegistroConstrutora,pnlConstrutora);
        frmSelecionaRegistroConstrutora.ShowModal;
      finally
        if(FoConstrutora.codigo <> NUMERO_INDEFINIDO)then
        begin
          plsEdConstrutora.Text := FoConstrutora.nome;
          FoFuncoes.focarComponente(plsEdTipoImovel);
        end;
        FreeAndNil(frmSelecionaRegistroConstrutora);
      end;
    end;
  end;
end;

procedure TfrmPesquisarVendas.VerificarConstrutoraExiste;
begin
  if(plsEdConstrutora.Text <> STRING_INDEFINIDO)then
  begin
    FoConjuntoDadosConstrutora.SetFiltro('nome ' + ' LIKE ' + QuotedStr('%' + plsEdConstrutora.Text + '%'));
    FoConjuntoDadosConstrutora.ExecutarFiltrar;

    if(FoConjuntoDadosConstrutora.TotalRegistros = 1)then
    begin
      FoConstrutora.codigo := FoConjuntoDadosConstrutora.GetCodigo;
      FoConstrutora.nome := FoConjuntoDadosConstrutora.GetNome;
      plsEdConstrutora.Text := FoConstrutora.nome;
    end
    else if(FoConjuntoDadosConstrutora.TotalRegistros > 1)then
      AbreTelaSelecaoConstrutora(fnSELECIONAR_CONSTRUTORA_DIGITANDO)
    else
    begin
      MessageDlg('Construtora n�o encontrada.', mtInformation, [mbOK], 0);
      FoFuncoes.focarComponente(plsEdConstrutora);
    end;
  end;
end;

procedure TfrmPesquisarVendas.AbreTelaSelecaoTipoImovel(pnTpSelecao:Word);
var
  vParametros: Variant;
begin
  vParametros := VarArrayCreate([0,2],varVariant);
  vParametros[0] := PRM_PESQUISA_NOME;
  vParametros[1] := plsEdTipoImovel.Text;
  vParametros[2] := False;

  case pnTpSelecao of

    fnSELECIONAR_TIPO_IMOVEL_NORMAL:
    begin
      try
        Application.CreateForm(TfrmSelecionaRegistroTipoImovel, frmSelecionaRegistroTipoImovel);
        frmSelecionaRegistroTipoImovel.passarParametro(PRM_TELA_CHAMOU,FORM_PESQUISAR_VENDA);
        frmSelecionaRegistroTipoImovel.passarParametro(PRM_DEFINE_FILTRO_PADRAO_TELA_SELECAO, null);
        if(plsEdTipoImovel.Text <> STRING_INDEFINIDO)then
          frmSelecionaRegistroTipoImovel.passarParametro(PRM_ENVIA_FILTRO_PESQUISA, vParametros);
        frmSelecionaRegistroTipoImovel.passarParametro(PRM_AJUSTAR_LARGURA_GRIDE,null);
        frmSelecionaRegistroTipoImovel.passarParametro(PRM_VISIBLE_FALSE_BOTAO_NOVO_FORM_SELECAO,null);
        FoFuncoes.AjustarPosicaoFormCadastroSelecaoRegistro(frmPrincipal,
         frmPesquisarVendas,frmSelecionaRegistroTipoImovel,pnlTipoImovel);
        frmSelecionaRegistroTipoImovel.ShowModal;
      finally
        if(FoTipoImovel.codigo <> NUMERO_INDEFINIDO)then
        begin
          plsEdTipoImovel.Text := FoTipoImovel.nome;
          FoFuncoes.focarComponente(plsEdEstado);
        end;
        FreeAndNil(frmSelecionaRegistroTipoImovel);
      end;
    end;

    fnSELECIONAR_TIPO_IMOVEL_DIGITANDO:
    begin
      try
        Application.CreateForm(TfrmSelecionaRegistroTipoImovel, frmSelecionaRegistroTipoImovel);
        frmSelecionaRegistroTipoImovel.passarParametro(PRM_TELA_CHAMOU,FORM_PESQUISAR_VENDA);
        frmSelecionaRegistroTipoImovel.passarParametro(PRM_DEFINE_FILTRO_PADRAO_TELA_SELECAO, null);
        frmSelecionaRegistroTipoImovel.passarParametro(PRM_ENVIA_FILTRO_PESQUISA, vParametros);
        frmSelecionaRegistroTipoImovel.passarParametro(PRM_AJUSTAR_LARGURA_GRIDE,null);
        frmSelecionaRegistroTipoImovel.passarParametro(PRM_VISIBLE_FALSE_BOTAO_NOVO_FORM_SELECAO,null);
        FoFuncoes.AjustarPosicaoFormCadastroSelecaoRegistro(frmPrincipal,
         frmPesquisarVendas,frmSelecionaRegistroTipoImovel,pnlTipoImovel);
        frmSelecionaRegistroTipoImovel.ShowModal;
      finally
        if(FoTipoImovel.codigo <> NUMERO_INDEFINIDO)then
        begin
          plsEdTipoImovel.Text := FoTipoImovel.nome;
          FoFuncoes.focarComponente(plsEdEstado);
        end;
        FreeAndNil(frmSelecionaRegistroTipoImovel);
      end;
    end;
  end;
end;

procedure TfrmPesquisarVendas.VerificarTipoImovelExiste;
begin
  if(plsEdTipoImovel.Text <> STRING_INDEFINIDO)then
  begin
    FoConjuntoDadosTipoImovel.SetFiltro('nome ' + ' LIKE ' + QuotedStr('%' + plsEdTipoImovel.Text + '%'));
    FoConjuntoDadosTipoImovel.ExecutarFiltrar;

    if(FoConjuntoDadosTipoImovel.TotalRegistros = 1)then
    begin
      FoTipoImovel.codigo := FoConjuntoDadosTipoImovel.GetCodigo;
      FoTipoImovel.nome := FoConjuntoDadosTipoImovel.GetNome;
      plsEdTipoImovel.Text := FoTipoImovel.nome;
    end
    else if(FoConjuntoDadosTipoImovel.TotalRegistros > 1)then
      AbreTelaSelecaoTipoImovel(fnSELECIONAR_TIPO_IMOVEL_DIGITANDO)
    else
    begin
      MessageDlg('Tipo de Im�vel n�o encontrado.', mtInformation, [mbOK], 0);
      FoFuncoes.focarComponente(plsEdTipoImovel);
    end;
  end;
end;

procedure TfrmPesquisarVendas.AbreTelaSelecaoEstado(pnTpSelecao:Word);
var
  vParametros: Variant;
begin
  vParametros := VarArrayCreate([0,2],varVariant);
  vParametros[0] := PRM_PESQUISA_NOME;
  vParametros[1] := plsEdEstado.Text;
  vParametros[2] := False;

  case pnTpSelecao of

    fnSELECIONAR_ESTADO_NORMAL:
    begin
      try
        Application.CreateForm(TfrmSelecionaRegistroEstado, frmSelecionaRegistroEstado);
        frmSelecionaRegistroEstado.passarParametro(PRM_TELA_CHAMOU, FORM_PESQUISAR_VENDA);
        frmSelecionaRegistroEstado.passarParametro(PRM_DEFINE_FILTRO_PADRAO_TELA_SELECAO, null);
        if(plsEdEstado.Text <> STRING_INDEFINIDO)then
          frmSelecionaRegistroEstado.passarParametro(PRM_ENVIA_FILTRO_PESQUISA, vParametros);
        frmSelecionaRegistroEstado.passarParametro(PRM_AJUSTAR_LARGURA_GRIDE,null);
        frmSelecionaRegistroEstado.passarParametro(PRM_VISIBLE_FALSE_BOTAO_NOVO_FORM_SELECAO,null);
        FoFuncoes.AjustarPosicaoFormCadastroSelecaoRegistro(frmPrincipal,
         frmPesquisarVendas,frmSelecionaRegistroEstado,pnlEstado,nil,nil,165);
        frmSelecionaRegistroEstado.ShowModal;
      finally
        if(FoEstado.codigo <> NUMERO_INDEFINIDO)then
        begin
          plsEdEstado.Text := FoEstado.nome;
          limparEndereco('CIDADE');
          FoFuncoes.focarComponente(plsEdCidade);
        end;
        FreeAndNil(frmSelecionaRegistroEstado);
      end;
    end;

    fnSELECIONAR_ESTADO_DIGITANDO:
    begin
      try
        Application.CreateForm(TfrmSelecionaRegistroEstado, frmSelecionaRegistroEstado);
        frmSelecionaRegistroEstado.passarParametro(PRM_TELA_CHAMOU, FORM_PESQUISAR_VENDA);
        frmSelecionaRegistroEstado.passarParametro(PRM_DEFINE_FILTRO_PADRAO_TELA_SELECAO, null);
        frmSelecionaRegistroEstado.passarParametro(PRM_ENVIA_FILTRO_PESQUISA, vParametros);
        frmSelecionaRegistroEstado.passarParametro(PRM_AJUSTAR_LARGURA_GRIDE,null);
        frmSelecionaRegistroEstado.passarParametro(PRM_VISIBLE_FALSE_BOTAO_NOVO_FORM_SELECAO,null);
        FoFuncoes.AjustarPosicaoFormCadastroSelecaoRegistro(frmPrincipal,
         frmPesquisarVendas,frmSelecionaRegistroEstado,pnlEstado,nil,nil,165);
        frmSelecionaRegistroEstado.ShowModal;
      finally
        if(FoEstado.codigo <> NUMERO_INDEFINIDO)then
        begin
          plsEdEstado.Text := FoEstado.nome;
          limparEndereco('CIDADE');
          FoFuncoes.focarComponente(plsEdCidade);
        end
        else
          plsEdEstado.Clear;
        FreeAndNil(frmSelecionaRegistroEstado);
      end;
    end;
  end;
end;

procedure TfrmPesquisarVendas.VerificarEstadoExiste;
begin
  if(Trim(plsEdEstado.Text) <> STRING_INDEFINIDO)then
  begin
    FoConjuntoDadosEstado.SetFiltro('nome ' + ' LIKE ' + QuotedStr('%' + plsEdEstado.Text + '%'));
    FoConjuntoDadosEstado.ExecutarFiltrar;

    if(FoConjuntoDadosEstado.TotalRegistros = 1)then
    begin
      FoEstado.codigo := FoConjuntoDadosEstado.GetCodigo;
      FoEstado.nome := FoConjuntoDadosEstado.GetNome;
      plsEdEstado.Text := FoEstado.nome;
    end
    else if(FoConjuntoDadosEstado.TotalRegistros > 1)then
      AbreTelaSelecaoEstado(fnSELECIONAR_ESTADO_DIGITANDO)
    else
    begin
      MessageDlg('Estado n�o encontrado.', mtInformation, [mbOK], 0);
      FoFuncoes.focarComponente(plsEdEstado);
    end;
  end
  else
    limparEndereco('ESTADO');
end;

procedure TfrmPesquisarVendas.AbreTelaSelecaoCidade(pnTpSelecao:Word);
var
  vParametros: Variant;
begin
  vParametros := VarArrayCreate([0,2],varVariant);
  vParametros[0] := PRM_PESQUISA_NOME;
  vParametros[1] := plsEdCidade.Text;
  vParametros[2] := False;

  case pnTpSelecao of

    fnSELECIONAR_CIDADE_NORMAL:
    begin
      try
        Application.CreateForm(TfrmSelecionaRegistroCidade, frmSelecionaRegistroCidade);
        frmSelecionaRegistroCidade.passarParametro(PRM_TELA_CHAMOU, FORM_PESQUISAR_VENDA);
        frmSelecionaRegistroCidade.passarParametro('FK_COD_ESTADO', FoEstado.codigo);
        frmSelecionaRegistroCidade.passarParametro(PRM_DEFINE_FILTRO_PADRAO_TELA_SELECAO, null);
        frmSelecionaRegistroCidade.passarParametro(PRM_ENVIA_FILTRO_PESQUISA, vParametros);
        frmSelecionaRegistroCidade.passarParametro(PRM_AJUSTAR_LARGURA_GRIDE,null);
        FoFuncoes.AjustarPosicaoFormCadastroSelecaoRegistro(frmPrincipal,
         frmPesquisarVendas,frmSelecionaRegistroCidade,pnlCidade,nil,nil,165);
        frmSelecionaRegistroCidade.passarParametro(PRM_VISIBLE_FALSE_BOTAO_NOVO_FORM_SELECAO,null);
        frmSelecionaRegistroCidade.ShowModal;
      finally
        if(FoCidade.codigo <> NUMERO_INDEFINIDO)then
        begin
          plsEdCidade.Text := FoCidade.nome;
          limparEndereco('BAIRRO');
          FoFuncoes.focarComponente(plsEdBairro);
        end;
        FreeAndNil(frmSelecionaRegistroCidade);
      end;
    end;

    fnSELECIONAR_CIDADE_DIGITANDO:
    begin
      try
        Application.CreateForm(TfrmSelecionaRegistroCidade, frmSelecionaRegistroCidade);
        frmSelecionaRegistroCidade.passarParametro(PRM_TELA_CHAMOU, FORM_PESQUISAR_VENDA);
        frmSelecionaRegistroCidade.passarParametro('FK_COD_ESTADO', FoEstado.codigo);
        frmSelecionaRegistroCidade.passarParametro(PRM_DEFINE_FILTRO_PADRAO_TELA_SELECAO, null);
        frmSelecionaRegistroCidade.passarParametro(PRM_ENVIA_FILTRO_PESQUISA, vParametros);
        frmSelecionaRegistroCidade.passarParametro(PRM_AJUSTAR_LARGURA_GRIDE,null);
        FoFuncoes.AjustarPosicaoFormCadastroSelecaoRegistro(frmPrincipal,
         frmPesquisarVendas,frmSelecionaRegistroCidade,pnlCidade,nil,nil,165);
        frmSelecionaRegistroCidade.passarParametro(PRM_VISIBLE_FALSE_BOTAO_NOVO_FORM_SELECAO,null);
        frmSelecionaRegistroCidade.ShowModal;
      finally
        if(FoCidade.codigo <> NUMERO_INDEFINIDO)then
        begin
          plsEdCidade.Text := Self.FoCidade.nome;
          limparEndereco('BAIRRO');
          FoFuncoes.focarComponente(plsEdBairro);
        end
        else
          plsEdCidade.Clear;
        FreeAndNil(frmSelecionaRegistroCidade);
      end;
    end;
  end;
end;

procedure TfrmPesquisarVendas.VerificarCidadeExiste;
var
  sFiltro: String;
begin
  sFiltro := '(nome ' + ' LIKE ' + QuotedStr('%' + plsEdCidade.Text + '%') + ')';
  sFiltro := sFiltro + ' AND cod_fk_estado = ' + QuotedStr(IntToStr(FoEstado.codigo));
  if(plsEdCidade.Text <> STRING_INDEFINIDO)then
  begin
    FoConjuntoDadosCidade.SetFiltro(sFiltro);
    FoConjuntoDadosCidade.ExecutarFiltrar;

    if(FoConjuntoDadosCidade.TotalRegistros = 1)then
    begin
      FoCidade.codigo := FoConjuntoDadosCidade.GetCodigo;
      FoCidade.nome := FoConjuntoDadosCidade.GetNome;
      plsEdCidade.Text := FoCidade.nome;
    end
    else if(FoConjuntoDadosCidade.TotalRegistros > 1)then
      AbreTelaSelecaoCidade(fnSELECIONAR_CIDADE_DIGITANDO)
    else
    begin
      MessageDlg('Cidade n�o encontrada.', mtInformation, [mbOK], 0);
      FoFuncoes.focarComponente(plsEdCidade);
    end;
  end
  else
    limparEndereco('CIDADE');
end;

procedure TfrmPesquisarVendas.AbreTelaSelecaoBairro(pnTpSelecao:Word);
var
  vParametros: Variant;
begin
  vParametros := VarArrayCreate([0,2],varVariant);
  vParametros[0] := PRM_PESQUISA_NOME;
  vParametros[1] := plsEdBairro.Text;
  vParametros[2] := False;

  case pnTpSelecao of

    fnSELECIONAR_BAIRRO_NORMAL:
    begin
      try
        Application.CreateForm(TfrmSelecionaRegistroBairro, frmSelecionaRegistroBairro);
        frmSelecionaRegistroBairro.passarParametro(PRM_TELA_CHAMOU, FORM_PESQUISAR_VENDA);
        frmSelecionaRegistroBairro.passarParametro('FK_COD_CIDADE', FoCidade.codigo);
        frmSelecionaRegistroBairro.passarParametro(PRM_DEFINE_FILTRO_PADRAO_TELA_SELECAO, null);
        if(plsEdBairro.Text <> STRING_INDEFINIDO)then
          frmSelecionaRegistroBairro.passarParametro(PRM_ENVIA_FILTRO_PESQUISA, vParametros);
        frmSelecionaRegistroBairro.passarParametro(PRM_AJUSTAR_LARGURA_GRIDE,null);
        frmSelecionaRegistroBairro.passarParametro(PRM_VISIBLE_FALSE_BOTAO_NOVO_FORM_SELECAO,null);
        FoFuncoes.AjustarPosicaoFormCadastroSelecaoRegistro(frmPrincipal,
         frmPesquisarVendas,frmSelecionaRegistroBairro,pnlBairro,nil,nil,165);
        frmSelecionaRegistroBairro.ShowModal;
      finally
        if(FoBairro.codigo <> NUMERO_INDEFINIDO)then
        begin
          plsEdBairro.Text := FoBairro.nome;
          limparEndereco('RUA');
          Self.FoFuncoes.focarComponente(plsEdRua);
        end;
        FreeAndNil(frmSelecionaRegistroBairro);
      end;
    end;

    fnSELECIONAR_BAIRRO_DIGITANDO:
    begin
      try
        Application.CreateForm(TfrmSelecionaRegistroBairro, frmSelecionaRegistroBairro);
        frmSelecionaRegistroBairro.passarParametro(PRM_TELA_CHAMOU, FORM_PESQUISAR_VENDA);
        frmSelecionaRegistroBairro.passarParametro('FK_COD_CIDADE', Self.FoCidade.codigo);
        frmSelecionaRegistroBairro.passarParametro(PRM_DEFINE_FILTRO_PADRAO_TELA_SELECAO, null);
        frmSelecionaRegistroBairro.passarParametro(PRM_ENVIA_FILTRO_PESQUISA, vParametros);
        frmSelecionaRegistroBairro.passarParametro(PRM_AJUSTAR_LARGURA_GRIDE,null);
        frmSelecionaRegistroBairro.passarParametro(PRM_VISIBLE_FALSE_BOTAO_NOVO_FORM_SELECAO,null);
        FoFuncoes.AjustarPosicaoFormCadastroSelecaoRegistro(frmPrincipal,
         frmPesquisarVendas,frmSelecionaRegistroBairro,pnlBairro,nil,nil,165);
        frmSelecionaRegistroBairro.ShowModal;
      finally
        if(Self.FoBairro.codigo <> NUMERO_INDEFINIDO)then
        begin
          plsEdBairro.Text := Self.FoBairro.nome;
          limparEndereco('RUA');
          Self.FoFuncoes.focarComponente(plsEdRua);
        end
        else
          plsEdBairro.Clear;
        FreeAndNil(frmSelecionaRegistroBairro);
      end;
    end;
  end;
end;

procedure TfrmPesquisarVendas.VerificarBairroExiste;
var
  sFiltro: String;
begin
  sFiltro := '(nome ' + ' LIKE ' + QuotedStr('%' + plsEdBairro.Text + '%') + ')';
  sFiltro := sFiltro + ' AND cod_fk_cidade = ' + QuotedStr(IntToStr(FoCidade.codigo));
  if(plsEdBairro.Text <> STRING_INDEFINIDO)then
  begin
    FoConjuntoDadosBairro.SetFiltro(sFiltro);
    FoConjuntoDadosBairro.ExecutarFiltrar;

    if(FoConjuntoDadosBairro.TotalRegistros = 1)then
    begin
      FoBairro.codigo := FoConjuntoDadosBairro.GetCodigo;
      FoBairro.nome := FoConjuntoDadosBairro.GetNome;
      plsEdBairro.Text := FoBairro.nome;
    end
    else if(FoConjuntoDadosBairro.TotalRegistros > 1)then
      AbreTelaSelecaoBairro(fnSELECIONAR_BAIRRO_DIGITANDO)
    else
    begin
      MessageDlg('Bairro n�o encontrado.', mtInformation, [mbOK], 0);
      FoFuncoes.focarComponente(plsEdBairro);
    end;
  end
  else
    limparEndereco('BAIRRO');
end;

procedure TfrmPesquisarVendas.AbreTelaSelecaoRua(pnTpSelecao:Word);
var
  vParametros: Variant;
begin
  vParametros := VarArrayCreate([0,2],varVariant);
  vParametros[0] := PRM_PESQUISA_NOME;
  vParametros[1] := plsEdRua.Text;
  vParametros[2] := False;

  case pnTpSelecao of

    fnSELECIONAR_RUA_NORMAL:
    begin
      try
        Application.CreateForm(TfrmSelecionaRegistroRua, frmSelecionaRegistroRua);
        frmSelecionaRegistroRua.passarParametro(PRM_TELA_CHAMOU, FORM_PESQUISAR_VENDA);
        frmSelecionaRegistroRua.passarParametro('FK_COD_BAIRRO', Self.FoBairro.codigo);
        frmSelecionaRegistroRua.passarParametro(PRM_DEFINE_FILTRO_PADRAO_TELA_SELECAO, null);
        if(plsEdRua.Text <> STRING_INDEFINIDO)then
          frmSelecionaRegistroRua.passarParametro(PRM_ENVIA_FILTRO_PESQUISA, vParametros);
        frmSelecionaRegistroRua.passarParametro(PRM_AJUSTAR_LARGURA_GRIDE,null);
        frmSelecionaRegistroRua.passarParametro(PRM_VISIBLE_FALSE_BOTAO_NOVO_FORM_SELECAO,null);
        FoFuncoes.AjustarPosicaoFormCadastroSelecaoRegistro(frmPrincipal,
         frmPesquisarVendas,frmSelecionaRegistroRua,pnlRua,nil,nil,165);
        frmSelecionaRegistroRua.ShowModal;
      finally
        if(FoRua.codigo <> NUMERO_INDEFINIDO)then
        begin
          plsEdRua.Text := FoRua.nome;
          Self.FoFuncoes.focarComponente(btBtnPesquisar);
        end;
        FreeAndNil(frmSelecionaRegistroRua);
      end;
    end;

    fnSELECIONAR_RUA_DIGITANDO:
    begin
      try
        Application.CreateForm(TfrmSelecionaRegistroRua, frmSelecionaRegistroRua);
        frmSelecionaRegistroRua.passarParametro(PRM_TELA_CHAMOU, FORM_PESQUISAR_VENDA);
        frmSelecionaRegistroRua.passarParametro('FK_COD_BAIRRO', Self.FoBairro.codigo);
        frmSelecionaRegistroRua.passarParametro(PRM_DEFINE_FILTRO_PADRAO_TELA_SELECAO, null);
        frmSelecionaRegistroRua.passarParametro(PRM_ENVIA_FILTRO_PESQUISA, vParametros);
        frmSelecionaRegistroRua.passarParametro(PRM_AJUSTAR_LARGURA_GRIDE,null);
        frmSelecionaRegistroRua.passarParametro(PRM_VISIBLE_FALSE_BOTAO_NOVO_FORM_SELECAO,null);
        FoFuncoes.AjustarPosicaoFormCadastroSelecaoRegistro(frmPrincipal,
         frmPesquisarVendas,frmSelecionaRegistroRua,pnlRua,nil,nil,165);
        frmSelecionaRegistroRua.ShowModal;
      finally
        if(FoRua.codigo <> NUMERO_INDEFINIDO)then
        begin
          plsEdRua.Text := FoRua.nome;
          Self.FoFuncoes.focarComponente(btBtnPesquisar);
        end
        else
          plsEdRua.Clear;
        FreeAndNil(frmSelecionaRegistroRua);
      end;
    end;
  end;
end;

procedure TfrmPesquisarVendas.VerificarRuaExiste;
var
  sFiltro: String;
begin
  sFiltro := '(nome ' + ' LIKE ' + QuotedStr('%' + plsEdRua.Text + '%') + ')';
  sFiltro := sFiltro + ' AND cod_fk_bairro = ' + QuotedStr(IntToStr(FoBairro.codigo));

  if(plsEdRua.Text <> STRING_INDEFINIDO)then
  begin
    FoConjuntoDadosRua.SetFiltro(sFiltro);
    FoConjuntoDadosRua.ExecutarFiltrar;

    if(FoConjuntoDadosRua.TotalRegistros = 1)then
    begin
      FoRua.codigo := FoConjuntoDadosRua.GetCodigo;
      FoRua.nome := FoConjuntoDadosRua.GetNome;
      FoRua.cep := FoConjuntoDadosRua.GetCEP;
      plsEdRua.Text := FoRua.nome;
    end
    else if(FoConjuntoDadosRua.TotalRegistros > 1)then
      AbreTelaSelecaoRua(fnSELECIONAR_RUA_DIGITANDO)
    else
    begin
      MessageDlg('Rua n�o encontrada.', mtInformation, [mbOK], 0);
      FoFuncoes.focarComponente(plsEdRua);
    end;
  end
  else
    limparEndereco('RUA');
end;

procedure TfrmPesquisarVendas.DetalharVenda(pnCodVenda:Integer);
begin
  try
    Application.CreateForm(TfrmExibeDadosVenda,frmExibeDadosVenda);
    frmExibeDadosVenda.passarParametro(PRM_PESQUISAR_VENDA,pnCodVenda);
    frmExibeDadosVenda.ShowModal;
  finally
    FreeAndNil(frmExibeDadosVenda);
  end;
end;

(* fim - procedimentos de controle *)

procedure TfrmPesquisarVendas.plsCbBxTipoVendaChange(Sender: TObject);
begin
  inherited;
  case plsCbBxTipoVenda.ItemIndex of
    0: Self.FoTipoVenda := [meu_agenciamento];
    1: Self.FoTipoVenda := [pauta];
    else
      Self.FoTipoVenda := [];
  end;
  popularComboBoxImovelDe();
end;

procedure TfrmPesquisarVendas.plsCbBxImovelDeChange(Sender: TObject);
begin
  inherited;
  Self.FoTipoImovelDe := [];
  case plsCbBxImovelDe.ItemIndex of
    0:
    begin
      case plsCbBxTipoVenda.ItemIndex of
        0: Self.FoTipoImovelDe := [meu]; //tipo venda = meu agenciamento, im�vel de = meu
        1: Self.FoTipoImovelDe := [construtora]; //tipo venda = pauta, im�vel de = construtora
      end;
    end;
    1:
    begin
      case plsCbBxTipoVenda.ItemIndex of
        0: Self.FoTipoImovelDe := [colegas]; //tipo venda = meu agenciamento, im�vel de = colegas
        1: Self.FoTipoImovelDe := [terceiros]; //tipo venda = pauta, im�vel de = terceiros
      end;
    end;
  end;

  if(plsCbBxImovelDe.Text = TIPO_IMOVEL_DE_VENDA_PAUTA_CONSTRUTORA)then
    pnlConstrutora.Visible := True
  else
    pnlConstrutora.Visible := False;
end;

procedure TfrmPesquisarVendas.FormCreate(Sender: TObject);
begin
  inherited;
  FoTipoVenda := [];
  FoTipoImovelDe := [];
  FbPodeLimparEndereco := True;
  FoConjuntoDadosConstrutora := TConjuntoDadosConstrutora.CriaObjeto;
  FoConjuntoDadosTipoImovel := TConjuntoDadosTipoImovel.CriaObjeto;
  FoConjuntoDadosEstado := TConjuntoDadosEstado.CriaObjeto;
  FoConjuntoDadosCidade := TConjuntoDadosCidade.CriaObjeto;
  FoConjuntoDadosBairro := TConjuntoDadosBairro.CriaObjeto;
  FoConjuntoDadosRua := TConjuntoDadosRua.CriaObjeto;
end;

procedure TfrmPesquisarVendas.plsEdTipoImovelExit(Sender: TObject);
begin
  inherited;
  VerificarTipoImovelExiste;
end;

procedure TfrmPesquisarVendas.spBtnBuscaTipoImovelClick(Sender: TObject);
begin
  inherited;
  AbreTelaSelecaoTipoImovel(fnSELECIONAR_TIPO_IMOVEL_NORMAL);
end;

procedure TfrmPesquisarVendas.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FoConjuntoDadosConstrutora);
  FreeAndNil(FoConjuntoDadosTipoImovel);
  FreeAndNil(FoConjuntoDadosEstado);
  FreeAndNil(FoConjuntoDadosCidade);
  FreeAndNil(FoConjuntoDadosBairro);
  FreeAndNil(FoConjuntoDadosRua);
end;

procedure TfrmPesquisarVendas.plsEdEstadoExit(Sender: TObject);
begin
  inherited;
  VerificarEstadoExiste;
end;

procedure TfrmPesquisarVendas.spBtnBuscaEstadoClick(Sender: TObject);
begin
  inherited;
  AbreTelaSelecaoEstado(fnSELECIONAR_ESTADO_NORMAL);
end;

procedure TfrmPesquisarVendas.plsEdCidadeExit(Sender: TObject);
begin
  inherited;
  if not(validarAcessoEndereco('CIDADE'))then
  begin
    if(Trim(plsEdCidade.Text) <> STRING_INDEFINIDO)then
    begin
      MessageDlg('Um estado deve estar selecionado.', mtInformation, [mbOK], 0);
      plsEdCidade.Clear;
      FoFuncoes.focarComponente(plsEdEstado);
    end;
  end
  else
    VerificarCidadeExiste;
end;

procedure TfrmPesquisarVendas.spBtnBuscaCidadeClick(Sender: TObject);
begin
  inherited;
  if not(validarAcessoEndereco('CIDADE'))then
  begin
    MessageDlg('Um estado deve estar selecionado.', mtInformation, [mbOK], 0);
    FoFuncoes.focarComponente(plsEdEstado);
  end
  else
    AbreTelaSelecaoCidade(fnSELECIONAR_CIDADE_NORMAL);
end;

procedure TfrmPesquisarVendas.plsEdBairroExit(Sender: TObject);
begin
  inherited;
  if not(validarAcessoEndereco('BAIRRO'))then
  begin
    if(Trim(plsEdBairro.Text) <> STRING_INDEFINIDO)then
    begin
      MessageDlg('Uma cidade deve estar selecionada.', mtInformation, [mbOK], 0);
      plsEdBairro.Clear;
      FoFuncoes.focarComponente(plsEdCidade);
    end;
  end
  else
    VerificarBairroExiste;
end;

procedure TfrmPesquisarVendas.spBtnBuscaBairroClick(Sender: TObject);
begin
  inherited;
  if not(validarAcessoEndereco('BAIRRO'))then
  begin
    MessageDlg('Uma cidade deve estar selecionada.', mtInformation, [mbOK], 0);
    FoFuncoes.focarComponente(plsEdCidade);
  end
  else
    AbreTelaSelecaoBairro(fnSELECIONAR_BAIRRO_NORMAL);
end;

procedure TfrmPesquisarVendas.plsEdRuaExit(Sender: TObject);
begin
  inherited;
  if not(validarAcessoEndereco('RUA'))then
  begin
    if(Trim(plsEdRua.Text) <> STRING_INDEFINIDO)then
    begin
      MessageDlg('Um bairro deve estar selecionado.', mtInformation, [mbOK], 0);
      plsEdRua.Clear;
      FoFuncoes.focarComponente(plsEdBairro);
    end;
  end
  else
    VerificarRuaExiste;
end;

procedure TfrmPesquisarVendas.spBtnBuscaRuaClick(Sender: TObject);
begin
  inherited;
  if not(validarAcessoEndereco('RUA'))then
  begin
    MessageDlg('Um bairro deve estar selecionado.', mtInformation, [mbOK], 0);
    FoFuncoes.focarComponente(plsEdBairro);
  end
  else
    AbreTelaSelecaoRua(fnSELECIONAR_RUA_NORMAL);
end;

procedure TfrmPesquisarVendas.dbGrdDadosPesquisaDblClick(Sender: TObject);
begin
  inherited;
  if(cdsDados.Active)and(cdsDados.RecordCount > NUMERO_INDEFINIDO)then
    DetalharVenda(cdsDadosCODIGO.AsInteger);
end;

procedure TfrmPesquisarVendas.mnItDetalharClick(Sender: TObject);
begin
  inherited;
  if(cdsDados.Active)and(cdsDados.RecordCount > NUMERO_INDEFINIDO)then
    DetalharVenda(cdsDadosCODIGO.AsInteger);
end;

procedure TfrmPesquisarVendas.plsEdConstrutoraExit(Sender: TObject);
begin
  inherited;
  VerificarConstrutoraExiste;
end;

procedure TfrmPesquisarVendas.spBtnBuscaConstrutoraClick(Sender: TObject);
begin
  inherited;
  AbreTelaSelecaoConstrutora(fnSELECIONAR_CONSTRUTORA_NORMAL);
end;

end.
