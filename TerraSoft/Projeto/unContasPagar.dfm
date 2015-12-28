object frmContasPagar: TfrmContasPagar
  Left = 293
  Top = 239
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CONTAS A PAGAR'
  ClientHeight = 536
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnTopo: TPanel
    Left = 0
    Top = 0
    Width = 850
    Height = 85
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 3
      Width = 52
      Height = 13
      Caption = 'Busca Por:'
    end
    object Label2: TLabel
      Left = 253
      Top = 3
      Width = 79
      Height = 13
      Caption = 'C'#243'd. Fornecedor'
    end
    object lblFornecedor: TLabel
      Left = 350
      Top = 16
      Width = 5
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 253
      Top = 40
      Width = 41
      Height = 13
      Caption = 'Per'#237'odo '
    end
    object Label4: TLabel
      Left = 330
      Top = 55
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object lblFiltro: TLabel
      Left = 128
      Top = 3
      Width = 46
      Height = 13
      Caption = 'Filtrar por:'
    end
    object RdBtnNaoQuitadas: TRadioButton
      Left = 27
      Top = 16
      Width = 88
      Height = 17
      Caption = 'N'#227'o Quitadas'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RdBtnNaoQuitadasClick
    end
    object RdBtnVencidas: TRadioButton
      Left = 27
      Top = 32
      Width = 65
      Height = 17
      Caption = 'Vencidas'
      TabOrder = 1
      OnClick = RdBtnVencidasClick
    end
    object RdBtnQuitadas: TRadioButton
      Left = 27
      Top = 48
      Width = 65
      Height = 17
      Caption = 'Quitadas'
      TabOrder = 2
      OnClick = RdBtnQuitadasClick
    end
    object RdBtnTodas: TRadioButton
      Left = 27
      Top = 64
      Width = 49
      Height = 17
      Caption = 'Todas'
      TabOrder = 3
      OnClick = RdBtnTodasClick
    end
    object edtCodFornecedor: TEdit
      Left = 253
      Top = 16
      Width = 58
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      OnEnter = edtCodFornecedorEnter
      OnExit = edtCodFornecedorExit
    end
    object BtnBuscaForn: TBitBtn
      Left = 317
      Top = 16
      Width = 26
      Height = 19
      TabOrder = 5
      OnClick = BtnBuscaFornClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7070
        705050508F888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF7070705F5850A0808F6F7080A0A8A0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7070705F5850AF88
        8F6F70A03F80DF80A8C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF7070705F5850AF888F7070A03F80D04FB0FFBFE0FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9090905F5850AF888F7070A03F80
        D04FB0FFA0D0FFFFFFFFFFFFFFFFFFFF8F888F5F605F5050505050506F686F9F
        989F7F787F90787F7070A04080D04FB0FF8FC8FFFFFFFFFFFFFFFFFFFF8F888F
        505050807070CFB0A0DFC0AFCFA890BF98808070708F888F5088CF4FB0FF8FC8
        FFFFFFFFFFFFFFFFFFFF8F888F5050509F807FF0E8DFFFF8D0FFF8D0FFF8D0FF
        F0BFEFC8A0AF888FC0C8D0A0D0FFFFFFFFFFFFFFFFFFFFFFFFFF6F686F70585F
        EFE8D0FFF8FFFFF8FFFFF8E0FFF8D0FFF0BFFFF0BFEFC0A0DFC8CFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF505050B0988FFFF8D0FFF8F0FFF8FFFFF8E0FFF8D0FF
        F0C0FFE0AFFFF0BFDFB8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF505050CFB090
        FFF8D0FFF8E0FFF8E0FFF8E0FFF8D0FFF0BFFFD8A0FFF0C0E0B8A0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF6F686FCFA88FFFF8D0FFF8D0FFF8D0FFF8D0FFF8CFFF
        E8BFFFE0B0FFF0C0E0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F888FB0907F
        FFF0BFFFF0BFFFF0C0FFF0BFFFE8BFFFE0B0FFF0D0FFF0C0DFB8B0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF8F7070EFD0A0FFE8BFFFE0AFFFD8A0FFE8BFFF
        F0E0FFF8FFEFD8BFDFC0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        B09080F0C8A0FFF0BFFFE8BFFFF8CFFFF8E0EFE0DFD0B8B0FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F888FDFB09FDFB09FCFA08FCF
        A89FDFC0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object mskInicial: TMaskEdit
      Left = 253
      Top = 53
      Width = 72
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 6
      Text = '01/01/2000'
    end
    object mskFInal: TMaskEdit
      Left = 342
      Top = 53
      Width = 71
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 7
      Text = '01/01/2050'
    end
    object BtnConsultar: TBitBtn
      Left = 757
      Top = 6
      Width = 82
      Height = 27
      Caption = 'CONSULTAR'
      TabOrder = 8
      OnClick = BtnConsultarClick
    end
    object BtnRelatorio: TBitBtn
      Left = 757
      Top = 39
      Width = 82
      Height = 28
      Caption = 'RELAT'#211'RIO'
      TabOrder = 9
      OnClick = BtnRelatorioClick
    end
    object ChBxDataOriginal: TCheckBox
      Left = 136
      Top = 24
      Width = 89
      Height = 17
      Caption = 'Data Original'
      Checked = True
      State = cbChecked
      TabOrder = 10
    end
    object ChBxDataOperacao: TCheckBox
      Left = 136
      Top = 40
      Width = 97
      Height = 17
      Caption = 'Data Opera'#231#227'o'
      TabOrder = 11
    end
  end
  object PnDados: TPanel
    Left = 0
    Top = 85
    Width = 850
    Height = 402
    Align = alClient
    TabOrder = 1
    object GrdContasPagar: TDBGrid
      Left = 1
      Top = 1
      Width = 848
      Height = 400
      Align = alClient
      Color = 13565951
      DataSource = dsContasPagar
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -10
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = GrdContasPagarDrawColumnCell
      OnTitleClick = GrdContasPagarTitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 43
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'LANCAMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Lan'#231'amento'
          Width = 69
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VENCIMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Vencimento'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 234
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORNECEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Fornecedor'
          Width = 183
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATAPAGAMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Pagamento'
          Width = 81
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VALORPAGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Pago'
          Visible = True
        end>
    end
  end
  object PnRodape: TPanel
    Left = 0
    Top = 487
    Width = 850
    Height = 49
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 2
    object BtnIncluir: TBitBtn
      Left = 10
      Top = 12
      Width = 69
      Height = 28
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = BtnIncluirClick
    end
    object BtnAlterar: TBitBtn
      Left = 83
      Top = 12
      Width = 67
      Height = 28
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = BtnAlterarClick
    end
    object BtnQuitar: TBitBtn
      Left = 235
      Top = 12
      Width = 65
      Height = 28
      Caption = 'Quitar '#218'nica'
      TabOrder = 2
      OnClick = BtnQuitarClick
    end
    object BtnHistorico: TBitBtn
      Left = 396
      Top = 12
      Width = 57
      Height = 28
      Caption = 'Hist'#243'rico'
      TabOrder = 3
      OnClick = BtnHistoricoClick
    end
    object BtnRecibo: TBitBtn
      Left = 456
      Top = 12
      Width = 62
      Height = 28
      Caption = 'Recibo'
      TabOrder = 4
      OnClick = BtnReciboClick
    end
    object BtnSair: TBitBtn
      Left = 776
      Top = 6
      Width = 69
      Height = 22
      Caption = 'Sair - ESC'
      TabOrder = 5
      OnClick = BtnSairClick
    end
    object BtnMarcar: TBitBtn
      Left = 698
      Top = 4
      Width = 61
      Height = 20
      Hint = 'Clique aqui para marcar a conta selecionada a ser renegociada.'
      Caption = 'Marcar'
      TabOrder = 6
      OnClick = BtnMarcarClick
    end
    object BtnDesmarcar: TBitBtn
      Left = 698
      Top = 24
      Width = 61
      Height = 21
      Hint = 
        'Clique aqui para remover a conta marcada que n'#227'o deseja mais ren' +
        'egociar.'
      Caption = 'Desmarcar'
      TabOrder = 7
      OnClick = BtnDesmarcarClick
    end
    object BtnRenegociar: TBitBtn
      Left = 616
      Top = 4
      Width = 75
      Height = 25
      Hint = 'Marque as contas que deseja renegociar e depois clique aqui!'
      Caption = 'Renegociar'
      TabOrder = 8
      OnClick = BtnRenegociarClick
    end
    object BtnQuitarMarcadas: TBitBtn
      Left = 304
      Top = 12
      Width = 89
      Height = 28
      Caption = 'Quitar Marcadas'
      TabOrder = 9
      OnClick = BtnQuitarMarcadasClick
    end
    object BtnExcluir: TBitBtn
      Left = 153
      Top = 12
      Width = 67
      Height = 28
      Caption = 'Excluir'
      TabOrder = 10
      OnClick = BtnExcluirClick
    end
    object BtnOrigem: TBitBtn
      Left = 520
      Top = 12
      Width = 75
      Height = 28
      Caption = 'Origem'
      TabOrder = 11
      OnClick = BtnOrigemClick
    end
  end
  object dsContasPagar: TDataSource
    DataSet = cdsContasPagar
    Left = 472
    Top = 8
  end
  object cdsContasPagar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContasPagar'
    Left = 504
    Top = 8
  end
  object dspContasPagar: TDataSetProvider
    DataSet = qryContasPagar
    Left = 536
    Top = 8
  end
  object qryContasPagar: TSQLQuery
    DataSource = dsContasPagar
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 568
    Top = 8
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 472
    Top = 40
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 504
    Top = 40
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Left = 536
    Top = 40
  end
  object qryAux: TSQLQuery
    DataSource = dsAux
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 568
    Top = 40
  end
end
