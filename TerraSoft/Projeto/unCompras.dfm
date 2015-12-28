object frmCompras: TfrmCompras
  Left = 359
  Top = 68
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'COMPRAS'
  ClientHeight = 508
  ClientWidth = 683
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
    Width = 683
    Height = 65
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 77
      Height = 13
      Caption = 'Data de Compra'
    end
    object Label2: TLabel
      Left = 96
      Top = 27
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object Label3: TLabel
      Left = 288
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Fornecedor'
    end
    object lblFornecedor: TLabel
      Left = 376
      Top = 24
      Width = 209
      Height = 20
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 204
      Top = 8
      Width = 54
      Height = 13
      Caption = 'N'#250'mero NF'
    end
    object Bevel1: TBevel
      Left = 197
      Top = 5
      Width = 2
      Height = 55
    end
    object Bevel2: TBevel
      Left = 281
      Top = 5
      Width = 2
      Height = 55
    end
    object mskInicial: TMaskEdit
      Left = 8
      Top = 24
      Width = 81
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 1
      Text = '  /  /    '
    end
    object mskFinal: TMaskEdit
      Left = 112
      Top = 24
      Width = 80
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 2
      Text = '  /  /    '
    end
    object edtCodFornecedor: TEdit
      Left = 288
      Top = 24
      Width = 57
      Height = 19
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      OnEnter = edtCodFornecedorEnter
      OnExit = edtCodFornecedorExit
    end
    object BtnBuscaFornecedor: TBitBtn
      Left = 352
      Top = 24
      Width = 25
      Height = 21
      TabOrder = 5
      OnClick = BtnBuscaFornecedorClick
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
      Width = 83
      Height = 49
      Caption = 'CONSULTAR'
      TabOrder = 0
      OnClick = BtnConsultarClick
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
      Layout = blGlyphTop
    end
    object edtNF: TEdit
      Left = 204
      Top = 24
      Width = 73
      Height = 19
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
  end
  object PnOpcoes: TPanel
    Left = 0
    Top = 467
    Width = 683
    Height = 41
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 2
    object BtnLancar: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Lan'#231'ar'
      TabOrder = 0
      OnClick = BtnLancarClick
    end
    object BtnAlterar: TBitBtn
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 1
    end
    object BtnExcluir: TBitBtn
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 2
    end
    object BtnVisualizar: TBitBtn
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 3
    end
    object BtnRelatorios: TBitBtn
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Relat'#243'rios'
      TabOrder = 4
    end
    object BtnSair: TBitBtn
      Left = 592
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Sair - ESC'
      TabOrder = 5
      OnClick = BtnSairClick
    end
  end
  object PnDados: TPanel
    Left = 0
    Top = 65
    Width = 683
    Height = 402
    Align = alClient
    TabOrder = 1
    object GrdCompras: TDBGrid
      Left = 1
      Top = 1
      Width = 681
      Height = 400
      Align = alClient
      Color = 13565951
      DataSource = dsCompras
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = GrdComprasDrawColumnCell
      OnTitleClick = GrdComprasTitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUMERONF'
          Title.Alignment = taCenter
          Title.Caption = 'NF/Doc.'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORNECEDOR'
          Title.Alignment = taCenter
          Title.Caption = 'Fornecedor'
          Width = 374
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VALORTOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Total'
          Width = 82
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATAEMISSAO'
          Title.Alignment = taCenter
          Title.Caption = 'Data de Emiss'#227'o'
          Width = 87
          Visible = True
        end>
    end
  end
  object dsCompras: TDataSource
    DataSet = cdsCompras
    Left = 416
    Top = 16
  end
  object cdsCompras: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCompras'
    Left = 448
    Top = 16
  end
  object dspCompras: TDataSetProvider
    DataSet = qryCompras
    Left = 480
    Top = 16
  end
  object qryCompras: TSQLQuery
    DataSource = dsCompras
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 512
    Top = 16
  end
end
