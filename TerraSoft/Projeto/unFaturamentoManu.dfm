object frmFaturamentoManu: TfrmFaturamentoManu
  Left = 746
  Top = 247
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'FATURAMENTO MANUTEN'#199#195'O'
  ClientHeight = 390
  ClientWidth = 423
  Color = clMoneyGreen
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
  PixelsPerInch = 96
  TextHeight = 13
  object GrpBoxParcelas: TGroupBox
    Left = 232
    Top = 149
    Width = 185
    Height = 232
    Caption = 'Parcelas'
    TabOrder = 1
    object GrdParcelas: TDBGrid
      Left = 2
      Top = 15
      Width = 181
      Height = 215
      Align = alClient
      Color = 13565951
      DataSource = dsContasPagar
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
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Width = 71
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VENCIMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Vencimento'
          Width = 86
          Visible = True
        end>
    end
  end
  object PnAlteracao: TPanel
    Left = 8
    Top = 157
    Width = 217
    Height = 80
    TabOrder = 2
    object lblValor: TLabel
      Left = 8
      Top = 8
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object lblVencimento: TLabel
      Left = 88
      Top = 8
      Width = 56
      Height = 13
      Caption = 'Vencimento'
    end
    object edtValor: TEdit
      Left = 8
      Top = 24
      Width = 73
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 0
      OnExit = edtValorExit
    end
    object mskVencimento: TMaskEdit
      Left = 88
      Top = 24
      Width = 73
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 1
      Text = '  /  /    '
    end
    object BtnGravar: TBitBtn
      Left = 8
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 2
      OnClick = BtnGravarClick
    end
  end
  object BtnAlterar: TBitBtn
    Left = 152
    Top = 261
    Width = 75
    Height = 24
    Caption = 'Alterar -->'
    TabOrder = 3
    OnClick = BtnAlterarClick
  end
  object BtnConfirmar: TBitBtn
    Left = 32
    Top = 349
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 4
    OnClick = BtnConfirmarClick
  end
  object BtnCancelar: TBitBtn
    Left = 112
    Top = 349
    Width = 89
    Height = 25
    Caption = 'Cancelar - ESC'
    TabOrder = 5
    OnClick = BtnCancelarClick
  end
  object PnDados: TPanel
    Left = 8
    Top = 8
    Width = 409
    Height = 136
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 78
      Height = 13
      Caption = 'C'#243'd. Cond. Pgto'
    end
    object lblCondicaoPgto: TLabel
      Left = 96
      Top = 32
      Width = 6
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 328
      Top = 8
      Width = 63
      Height = 13
      Caption = 'Valor Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblVlrTotal: TLabel
      Left = 368
      Top = 24
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodCondPgto: TEdit
      Left = 8
      Top = 32
      Width = 49
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnEnter = edtCodCondPgtoEnter
      OnExit = edtCodCondPgtoExit
    end
    object BtnBuscaCondPgto: TBitBtn
      Left = 64
      Top = 32
      Width = 25
      Height = 19
      TabOrder = 1
      OnClick = BtnBuscaCondPgtoClick
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
    object BtnGerar: TBitBtn
      Left = 8
      Top = 103
      Width = 75
      Height = 25
      Caption = 'Gerar'
      TabOrder = 2
      OnClick = BtnGerarClick
    end
  end
  object qryContasPagar: TSQLQuery
    DataSource = dsContasPagar
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 280
    Top = 56
  end
  object dsContasPagar: TDataSource
    DataSet = cdsContasPagar
    Left = 312
    Top = 56
  end
  object cdsContasPagar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContasPagar'
    Left = 344
    Top = 56
  end
  object dspContasPagar: TDataSetProvider
    DataSet = qryContasPagar
    Left = 376
    Top = 56
  end
  object qryAux: TSQLQuery
    DataSource = dsAux
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 280
    Top = 88
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 312
    Top = 88
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 344
    Top = 88
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Left = 376
    Top = 88
  end
  object dsAux2: TDataSource
    DataSet = cdsAux2
    Left = 312
    Top = 120
  end
  object cdsAux2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux2'
    Left = 344
    Top = 120
  end
  object dspAux2: TDataSetProvider
    DataSet = qryAux2
    Left = 376
    Top = 120
  end
  object qryAux2: TSQLQuery
    DataSource = dsAux2
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 280
    Top = 120
  end
end
