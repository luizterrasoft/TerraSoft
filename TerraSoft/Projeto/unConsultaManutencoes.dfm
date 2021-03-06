object frmConsultaManutencoes: TfrmConsultaManutencoes
  Left = 452
  Top = 134
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'MANUTEN'#199#213'ES/DESPESAS'
  ClientHeight = 501
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
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
    Height = 105
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Inicial: TLabel
      Left = 8
      Top = 0
      Width = 27
      Height = 13
      Caption = 'Inicial'
    end
    object Final: TLabel
      Left = 8
      Top = 33
      Width = 22
      Height = 13
      Caption = 'Final'
    end
    object Label2: TLabel
      Left = 87
      Top = 5
      Width = 43
      Height = 13
      Caption = 'Filtro por:'
    end
    object Bevel1: TBevel
      Left = 297
      Top = 3
      Width = 2
      Height = 50
    end
    object Label1: TLabel
      Left = 415
      Top = 10
      Width = 62
      Height = 13
      Caption = 'Equipamento'
    end
    object lblEquipamento: TLabel
      Left = 515
      Top = 24
      Width = 6
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel2: TBevel
      Left = 161
      Top = 5
      Width = 1
      Height = 54
      HelpContext = 2
    end
    object Label3: TLabel
      Left = 168
      Top = 7
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object Label4: TLabel
      Left = 166
      Top = 46
      Width = 169
      Height = 13
      Caption = '*Deixar em branco para todos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNotaFiscal: TLabel
      Left = 8
      Top = 66
      Width = 53
      Height = 13
      Caption = 'Nota Fiscal'
    end
    object Label5: TLabel
      Left = 304
      Top = 8
      Width = 62
      Height = 13
      Caption = 'Consulta por:'
    end
    object mskInicial: TMaskEdit
      Left = 8
      Top = 12
      Width = 73
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 0
      Text = '01/01/2000'
    end
    object mskFinal: TMaskEdit
      Left = 8
      Top = 46
      Width = 73
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 1
      Text = '31/12/2020'
    end
    object BtnConsultar: TBitBtn
      Left = 760
      Top = 8
      Width = 80
      Height = 41
      Caption = 'CONSULTAR'
      TabOrder = 2
      OnClick = BtnConsultarClick
    end
    object RdBtnAberta: TRadioButton
      Left = 95
      Top = 17
      Width = 57
      Height = 17
      Caption = 'Aberta'
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object RdBtnFaturada: TRadioButton
      Left = 95
      Top = 31
      Width = 65
      Height = 17
      Caption = 'Faturada'
      TabOrder = 4
    end
    object edtCodEquipamento: TEdit
      Left = 415
      Top = 26
      Width = 65
      Height = 19
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      OnEnter = edtCodEquipamentoEnter
      OnExit = edtCodEquipamentoExit
    end
    object BtnBuscaEquipamento: TBitBtn
      Left = 485
      Top = 25
      Width = 25
      Height = 21
      TabOrder = 6
      OnClick = BtnBuscaEquipamentoClick
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
    object CbxTipo: TComboBox
      Left = 168
      Top = 24
      Width = 124
      Height = 21
      Style = csDropDownList
      Color = 13565951
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 7
      Text = 'GERAL'
      Items.Strings = (
        ''
        'GERAL'
        'ABASTECIMENTOS'
        'TROCAS DE '#211'LEO'
        'LAVA'#199#213'ES')
    end
    object RdBtnTodos: TRadioButton
      Left = 95
      Top = 47
      Width = 65
      Height = 14
      Caption = 'Todos'
      TabOrder = 8
    end
    object edtNotaFiscal: TEdit
      Left = 8
      Top = 80
      Width = 89
      Height = 19
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 9
    end
    object BtnRelatorios: TBitBtn
      Left = 762
      Top = 56
      Width = 79
      Height = 25
      Caption = 'RELAT'#211'RIOS'
      TabOrder = 10
      OnClick = BtnRelatoriosClick
    end
    object CbxConsultapor: TComboBox
      Left = 304
      Top = 24
      Width = 105
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      Color = 13565951
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 11
      Text = 'EQUIPAMENTO'
      OnExit = CbxConsultaporExit
      Items.Strings = (
        'EQUIPAMENTO'
        'FORNECEDOR')
    end
  end
  object PnDados: TPanel
    Left = 0
    Top = 105
    Width = 850
    Height = 356
    Align = alClient
    TabOrder = 1
    object GrdManutencoes: TDBGrid
      Left = 1
      Top = 1
      Width = 848
      Height = 354
      Align = alClient
      Color = 13565951
      DataSource = dsManu
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = GrdManutencoesDblClick
      OnTitleClick = GrdManutencoesTitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 277
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EQUIPAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Equipamento'
          Width = 247
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Total'
          Width = 72
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'STATUS'
          Title.Alignment = taCenter
          Title.Caption = 'Status'
          Width = 36
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATAABERTURA'
          Title.Alignment = taCenter
          Title.Caption = 'Lan'#231'amento'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERONF'
          Title.Alignment = taCenter
          Title.Caption = 'Nota Fiscal'
          Width = 65
          Visible = True
        end>
    end
  end
  object PnRodape: TPanel
    Left = 0
    Top = 461
    Width = 850
    Height = 40
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 2
    object BtnIncluir: TBitBtn
      Left = 13
      Top = 8
      Width = 68
      Height = 25
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = BtnIncluirClick
    end
    object BtnAlterar: TBitBtn
      Left = 85
      Top = 8
      Width = 68
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = BtnAlterarClick
    end
    object BtnExcluir: TBitBtn
      Left = 157
      Top = 8
      Width = 68
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BtnExcluirClick
    end
    object BtnSair: TBitBtn
      Left = 752
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Sair - ESC'
      TabOrder = 3
      OnClick = BtnSairClick
    end
    object BtnFaturar: TBitBtn
      Left = 598
      Top = 8
      Width = 74
      Height = 25
      Caption = 'Faturar'
      TabOrder = 4
      OnClick = BtnFaturarClick
    end
    object BtnCancelarFaturamento: TBitBtn
      Left = 476
      Top = 8
      Width = 117
      Height = 25
      Caption = 'Reabrir Manut./Desp.'
      TabOrder = 5
      OnClick = BtnCancelarFaturamentoClick
    end
    object BtnVisualizar: TBitBtn
      Left = 314
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Visualizar'
      TabOrder = 6
      OnClick = BtnVisualizarClick
    end
    object BtnFaturamento: TBitBtn
      Left = 394
      Top = 8
      Width = 73
      Height = 25
      Caption = 'Faturamento'
      TabOrder = 7
      OnClick = BtnFaturamentoClick
    end
  end
  object dsManu: TDataSource
    DataSet = cdsManu
    Left = 8
    Top = 177
  end
  object cdsManu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspManu'
    Left = 40
    Top = 177
  end
  object dspManu: TDataSetProvider
    DataSet = qryManu
    Left = 72
    Top = 177
  end
  object qryManu: TSQLQuery
    DataSource = dsManu
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 104
    Top = 177
  end
  object dsParcelas: TDataSource
    DataSet = cdsParcelas
    Left = 8
    Top = 214
  end
  object cdsParcelas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParcelas'
    Left = 40
    Top = 214
  end
  object dspParcelas: TDataSetProvider
    DataSet = qryParcelas
    Left = 72
    Top = 214
  end
  object qryParcelas: TSQLQuery
    DataSource = dsParcelas
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 104
    Top = 214
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 8
    Top = 248
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 40
    Top = 246
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Left = 72
    Top = 246
  end
  object qryAux: TSQLQuery
    DataSource = dsAux
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 104
    Top = 246
  end
  object dsHistorico: TDataSource
    DataSet = cdsHistorico
    Left = 8
    Top = 286
  end
  object cdsHistorico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHistorico'
    Left = 40
    Top = 286
  end
  object dspHistorico: TDataSetProvider
    DataSet = qryHistorico
    Left = 72
    Top = 286
  end
  object qryHistorico: TSQLQuery
    DataSource = dsHistorico
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 104
    Top = 286
  end
end
