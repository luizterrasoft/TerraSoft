object frmOS: TfrmOS
  Left = 270
  Top = 108
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ORDENS DE SERVI'#199'O'
  ClientHeight = 445
  ClientWidth = 855
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
  object PnConsulta: TPanel
    Left = 0
    Top = 0
    Width = 855
    Height = 72
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 5
      Width = 76
      Height = 13
      Caption = 'Consulta por:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 289
      Top = 7
      Width = 2
      Height = 59
    end
    object lblPessoa: TLabel
      Left = 296
      Top = 33
      Width = 45
      Height = 13
      Caption = 'lblPessoa'
    end
    object lblNomePessoa: TLabel
      Left = 393
      Top = 48
      Width = 208
      Height = 16
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 182
      Top = 5
      Width = 33
      Height = 13
      Caption = 'Filtro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 605
      Top = 4
      Width = 27
      Height = 13
      Caption = 'Inicial'
    end
    object Label4: TLabel
      Left = 676
      Top = 4
      Width = 22
      Height = 13
      Caption = 'Final'
    end
    object Label5: TLabel
      Left = 606
      Top = 36
      Width = 30
      Height = 13
      Caption = 'Status'
    end
    object RdBtnCliente: TRadioButton
      Left = 14
      Top = 40
      Width = 53
      Height = 13
      Caption = 'Cliente'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RdBtnClienteClick
    end
    object RdBtnVendedor: TRadioButton
      Left = 102
      Top = 24
      Width = 65
      Height = 13
      Caption = 'Vendedor'
      TabOrder = 1
      OnClick = RdBtnVendedorClick
    end
    object edtCodPessoa: TEdit
      Left = 296
      Top = 46
      Width = 59
      Height = 19
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      OnEnter = edtCodPessoaEnter
      OnExit = edtCodPessoaExit
    end
    object BtnBuscaPessoa: TBitBtn
      Left = 361
      Top = 46
      Width = 26
      Height = 19
      TabOrder = 3
      OnClick = BtnBuscaPessoaClick
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
    object BtnConsultar: TBitBtn
      Left = 761
      Top = 20
      Width = 78
      Height = 46
      Caption = 'CONSULTAR'
      TabOrder = 9
      OnClick = BtnConsultarClick
    end
    object RdBtnCodigo: TRadioButton
      Left = 14
      Top = 23
      Width = 57
      Height = 17
      Caption = 'C'#243'digo'
      TabOrder = 4
      OnClick = RdBtnCodigoClick
    end
    object ChBxDataAbertura: TCheckBox
      Left = 182
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Data Abertura'
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = ChBxDataAberturaClick
    end
    object ChBxDataFechamento: TCheckBox
      Left = 182
      Top = 40
      Width = 105
      Height = 17
      Caption = 'Data Fechamento'
      TabOrder = 6
      OnClick = ChBxDataFechamentoClick
    end
    object mskInicial: TMaskEdit
      Left = 605
      Top = 17
      Width = 67
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 7
      Text = '01/01/2000'
    end
    object mskFinal: TMaskEdit
      Left = 676
      Top = 17
      Width = 68
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 8
      Text = '01/01/2020'
    end
    object RdBtnTodos: TRadioButton
      Left = 102
      Top = 37
      Width = 73
      Height = 17
      Caption = 'Todos'
      TabOrder = 10
      OnClick = RdBtnTodosClick
    end
    object CbxStatus: TComboBox
      Left = 606
      Top = 49
      Width = 77
      Height = 21
      Style = csDropDownList
      Color = 13565951
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 11
      Text = 'ABERTA'
      Items.Strings = (
        'ABERTA'
        'FECHADA'
        'TODAS')
    end
  end
  object PnAcoes: TPanel
    Left = 0
    Top = 390
    Width = 855
    Height = 55
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 1
    object BtnNova: TBitBtn
      Left = 6
      Top = 14
      Width = 66
      Height = 27
      Caption = 'Nova O.S.'
      TabOrder = 0
      OnClick = BtnNovaClick
    end
    object BtnAlterarOS: TBitBtn
      Left = 77
      Top = 14
      Width = 67
      Height = 27
      Caption = 'Alterar O.S.'
      TabOrder = 1
      OnClick = BtnAlterarOSClick
    end
    object BtnImprimir: TBitBtn
      Left = 491
      Top = 14
      Width = 66
      Height = 27
      Caption = 'Imprimir O.S.'
      TabOrder = 5
      OnClick = BtnImprimirClick
    end
    object BtnCancelarOS: TBitBtn
      Left = 240
      Top = 14
      Width = 67
      Height = 27
      Caption = 'Cancelar O.S.'
      TabOrder = 2
      OnClick = BtnCancelarOSClick
    end
    object BtnExcluirOS: TBitBtn
      Left = 312
      Top = 14
      Width = 66
      Height = 27
      Caption = 'Excluir O.S.'
      TabOrder = 3
      OnClick = BtnExcluirOSClick
    end
    object BtnFecharOS: TBitBtn
      Left = 409
      Top = 14
      Width = 66
      Height = 27
      Caption = 'Fechar O.S.'
      TabOrder = 4
      OnClick = BtnFecharOSClick
    end
    object BtnRelatorio: TBitBtn
      Left = 562
      Top = 14
      Width = 67
      Height = 27
      Caption = 'Relat'#243'rio'
      TabOrder = 6
      OnClick = BtnRelatorioClick
    end
    object BtnSair: TBitBtn
      Left = 772
      Top = 14
      Width = 67
      Height = 27
      Caption = 'Sair - ESC'
      TabOrder = 7
      OnClick = BtnSairClick
    end
    object BtnEstornaLancamentos: TBitBtn
      Left = 648
      Top = 13
      Width = 111
      Height = 27
      Caption = 'Reabrir O.S.'
      TabOrder = 8
      OnClick = BtnEstornaLancamentosClick
    end
    object BtnVisualizar: TBitBtn
      Left = 152
      Top = 14
      Width = 60
      Height = 27
      Caption = 'Visualizar'
      TabOrder = 9
      OnClick = BtnVisualizarClick
    end
  end
  object GrdOrdens: TDBGrid
    Left = 0
    Top = 72
    Width = 855
    Height = 318
    Align = alClient
    Color = 13565951
    DataSource = dsOS
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = GrdOrdensDblClick
    OnTitleClick = GrdOrdensTitleClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 48
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OSBLOCO'
        Title.Alignment = taCenter
        Title.Caption = 'Bloco'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATAABERTURA'
        Title.Alignment = taCenter
        Title.Caption = 'Data Abertura'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATAFECHADA'
        Title.Alignment = taCenter
        Title.Caption = 'Data Fechamento'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Title.Alignment = taCenter
        Title.Caption = 'Cliente'
        Width = 325
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VALORTOTAL'
        Title.Alignment = taCenter
        Title.Caption = 'Total'
        Width = 83
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'STATUS'
        Title.Alignment = taCenter
        Title.Caption = 'Status'
        Width = 66
        Visible = True
      end>
  end
  object dsOS: TDataSource
    DataSet = cdsOS
    Left = 912
    Top = 224
  end
  object cdsOS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOS'
    Left = 944
    Top = 224
  end
  object dspOS: TDataSetProvider
    DataSet = qryOS
    Left = 976
    Top = 224
  end
  object qryOS: TSQLQuery
    DataSource = dsOS
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 1008
    Top = 224
  end
  object dsOSRel: TDataSource
    DataSet = cdsOSRel
    Left = 912
    Top = 96
  end
  object cdsOSRel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOSRel'
    Left = 944
    Top = 96
  end
  object dspOSRel: TDataSetProvider
    DataSet = qryOSRel
    Left = 976
    Top = 96
  end
  object qryOSRel: TSQLQuery
    DataSource = dsOSRel
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 1008
    Top = 96
  end
  object qryAux: TSQLQuery
    DataSource = dsAux
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 1008
    Top = 128
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 912
    Top = 128
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOS'
    Left = 944
    Top = 128
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Left = 976
    Top = 128
  end
  object dsParcelas: TDataSource
    DataSet = cdsParcelas
    Left = 912
    Top = 160
  end
  object cdsParcelas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParcelas'
    Left = 944
    Top = 160
  end
  object dspParcelas: TDataSetProvider
    DataSet = qryParcelas
    Left = 976
    Top = 160
  end
  object qryParcelas: TSQLQuery
    DataSource = dsParcelas
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 1008
    Top = 160
  end
  object dsTotais: TDataSource
    DataSet = cdsTotais
    Left = 912
    Top = 192
  end
  object cdsTotais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTotais'
    Left = 944
    Top = 192
  end
  object dspTotais: TDataSetProvider
    DataSet = qryTotais
    Left = 976
    Top = 192
  end
  object qryTotais: TSQLQuery
    DataSource = dsTotais
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 1008
    Top = 192
  end
  object dsHistorico: TDataSource
    DataSet = cdsHistorico
    Left = 912
    Top = 256
  end
  object cdsHistorico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHistorico'
    Left = 944
    Top = 256
  end
  object dspHistorico: TDataSetProvider
    DataSet = qryHistorico
    Left = 976
    Top = 256
  end
  object qryHistorico: TSQLQuery
    DataSource = dsHistorico
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 1008
    Top = 256
  end
end
