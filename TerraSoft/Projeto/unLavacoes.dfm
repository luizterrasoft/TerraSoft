object frmLavacoes: TfrmLavacoes
  Left = 474
  Top = 281
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'LAVA'#199#213'ES DE VE'#205'CULOS/EQUIPAMENTOS'
  ClientHeight = 373
  ClientWidth = 702
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
    Width = 702
    Height = 57
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 62
      Height = 13
      Caption = 'Consulta por:'
    end
    object Bevel1: TBevel
      Left = 171
      Top = 3
      Width = 2
      Height = 50
    end
    object lblCod: TLabel
      Left = 184
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lblResultado: TLabel
      Left = 272
      Top = 24
      Width = 5
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 462
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Inicial'
    end
    object Label3: TLabel
      Left = 520
      Top = 8
      Width = 22
      Height = 13
      Caption = 'Final'
    end
    object RdBtnTodos: TRadioButton
      Left = 80
      Top = 6
      Width = 49
      Height = 17
      Caption = 'Todos'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RdBtnTodosClick
    end
    object RdBtnEquipamento: TRadioButton
      Left = 80
      Top = 22
      Width = 89
      Height = 17
      Caption = 'Equipamento'
      TabOrder = 1
      OnClick = RdBtnEquipamentoClick
    end
    object RdBtnFornecedor: TRadioButton
      Left = 80
      Top = 38
      Width = 81
      Height = 17
      Caption = 'Fornecedor'
      TabOrder = 2
      OnClick = RdBtnFornecedorClick
    end
    object edtCodigo: TEdit
      Left = 184
      Top = 24
      Width = 49
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      OnExit = edtCodigoExit
    end
    object BtnBusca: TBitBtn
      Left = 240
      Top = 24
      Width = 25
      Height = 19
      TabOrder = 4
      OnClick = BtnBuscaClick
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
      Left = 592
      Top = 8
      Width = 99
      Height = 41
      Caption = 'Consultar'
      TabOrder = 7
      OnClick = BtnConsultarClick
    end
    object mskInicial: TMaskEdit
      Left = 462
      Top = 24
      Width = 58
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 5
      Text = '01/01/2000'
    end
    object mskfInal: TMaskEdit
      Left = 522
      Top = 24
      Width = 58
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 6
      Text = '01/01/2090'
    end
  end
  object PnDados: TPanel
    Left = 0
    Top = 57
    Width = 702
    Height = 263
    Align = alClient
    TabOrder = 1
    object GrdLavacoes: TDBGrid
      Left = 1
      Top = 1
      Width = 700
      Height = 261
      Align = alClient
      Color = 13565951
      DataSource = dsLavacoes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORNECEDOR'
          Title.Alignment = taCenter
          Title.Caption = 'Fornecedor'
          Width = 162
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EQUIPAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Equipamento/Ve'#237'culo'
          Width = 180
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Width = 87
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 205
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Title.Alignment = taCenter
          Title.Caption = 'Status'
          Visible = True
        end>
    end
  end
  object PnRodape: TPanel
    Left = 0
    Top = 320
    Width = 702
    Height = 53
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 2
    object BtnNovo: TBitBtn
      Left = 8
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = BtnNovoClick
    end
    object BtnAlterar: TBitBtn
      Left = 88
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = BtnAlterarClick
    end
    object BtnExcluir: TBitBtn
      Left = 168
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
    end
    object BtnCancelarFaturamento: TBitBtn
      Left = 340
      Top = 16
      Width = 161
      Height = 25
      Caption = 'Cancelar Faturamento'
      TabOrder = 3
    end
    object BtnRelatorio: TBitBtn
      Left = 522
      Top = 16
      Width = 74
      Height = 25
      Caption = 'Relat'#243'rio'
      TabOrder = 4
    end
    object BtnSair: TBitBtn
      Left = 616
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Sair - ESC'
      TabOrder = 5
      OnClick = BtnSairClick
    end
    object BtnFechar: TBitBtn
      Left = 257
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 6
    end
  end
  object dsLavacoes: TDataSource
    DataSet = cdsLavacoes
    Left = 336
    Top = 24
  end
  object cdsLavacoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLavacoes'
    Left = 368
    Top = 24
  end
  object dspLavacoes: TDataSetProvider
    DataSet = qryLavacoes
    Left = 400
    Top = 24
  end
  object qryLavacoes: TSQLQuery
    DataSource = dsLavacoes
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 432
    Top = 24
  end
end
