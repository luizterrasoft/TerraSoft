object frmRenegociarCR: TfrmRenegociarCR
  Left = 419
  Top = 194
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'RENEGOCIAR CONTAS A RECEBER'
  ClientHeight = 360
  ClientWidth = 326
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 139
    Height = 16
    Caption = 'Total '#224' Renegociar:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTotalRenegociar: TLabel
    Left = 252
    Top = 16
    Width = 5
    Height = 16
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 40
    Width = 313
    Height = 9
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 56
    Height = 13
    Caption = 'Cond. Pgto.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblCondicaoPgto: TLabel
    Left = 104
    Top = 72
    Width = 5
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 8
    Top = 135
    Width = 313
    Height = 9
  end
  object edtCodCondPgto: TEdit
    Left = 8
    Top = 72
    Width = 57
    Height = 19
    Color = 13565951
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    OnEnter = edtCodCondPgtoEnter
    OnExit = edtCodCondPgtoExit
  end
  object BtnBuscaCondPgto: TBitBtn
    Left = 72
    Top = 70
    Width = 25
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
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
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Gerar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BtnGerarClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 152
    Width = 185
    Height = 120
    Color = 13565951
    DataSource = dsRenegociar
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taCenter
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENCIMENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Vencimento'
        Width = 77
        Visible = True
      end>
  end
  object PnAlteracao: TPanel
    Left = 8
    Top = 227
    Width = 185
    Height = 80
    Enabled = False
    TabOrder = 4
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
    Left = 200
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 5
    OnClick = BtnAlterarClick
  end
  object PnRodape: TPanel
    Left = 0
    Top = 319
    Width = 326
    Height = 41
    Align = alBottom
    TabOrder = 6
    object BtnConcluir: TBitBtn
      Left = 86
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = BtnConcluirClick
    end
    object btncancelar: TBitBtn
      Left = 166
      Top = 8
      Width = 81
      Height = 25
      Caption = 'Cancelar - ESC'
      TabOrder = 1
      OnClick = btncancelarClick
    end
  end
  object qryRenegociar: TSQLQuery
    DataSource = dsRenegociar
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 176
    Top = 96
  end
  object dsRenegociar: TDataSource
    DataSet = cdsRenegociar
    Left = 208
    Top = 96
  end
  object cdsRenegociar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRenegociar'
    Left = 240
    Top = 96
  end
  object dspRenegociar: TDataSetProvider
    DataSet = qryRenegociar
    Left = 272
    Top = 96
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 208
    Top = 64
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 240
    Top = 64
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Left = 272
    Top = 64
  end
  object qryAux: TSQLQuery
    DataSource = dsAux
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 176
    Top = 64
  end
  object qryAux2: TSQLQuery
    DataSource = dsAux2
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 176
    Top = 32
  end
  object dsAux2: TDataSource
    DataSet = cdsAux2
    Left = 208
    Top = 32
  end
  object cdsAux2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux2'
    Left = 240
    Top = 32
  end
  object dspAux2: TDataSetProvider
    DataSet = qryAux2
    Left = 272
    Top = 32
  end
end
