object frmQuitarContaPagar: TfrmQuitarContaPagar
  Left = 413
  Top = 222
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'QUITA'#199#195'O CONTA A PAGAR'
  ClientHeight = 258
  ClientWidth = 412
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
    Width = 412
    Height = 41
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 39
      Top = 8
      Width = 309
      Height = 24
      Caption = 'QUITA'#199#195'O - CONTA '#193' PAGAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Reference Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PnDados: TPanel
    Left = 0
    Top = 41
    Width = 412
    Height = 176
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label3: TLabel
      Left = 88
      Top = 8
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label4: TLabel
      Left = 8
      Top = 45
      Width = 101
      Height = 13
      Caption = 'Forma de Pagamento'
    end
    object Label5: TLabel
      Left = 8
      Top = 117
      Width = 22
      Height = 13
      Caption = 'Obs.'
    end
    object lblFormaPgto: TLabel
      Left = 104
      Top = 58
      Width = 5
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 81
      Width = 28
      Height = 13
      Caption = 'Conta'
    end
    object lblConta: TLabel
      Left = 104
      Top = 92
      Width = 5
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblRestante: TLabel
      Left = 352
      Top = 24
      Width = 29
      Height = 16
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNovoVencimento: TLabel
      Left = 176
      Top = 8
      Width = 85
      Height = 13
      Caption = 'Novo Vencimento'
      Visible = False
    end
    object mskData: TMaskEdit
      Left = 8
      Top = 24
      Width = 73
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 0
      Text = '  /  /    '
    end
    object edtValor: TEdit
      Left = 88
      Top = 24
      Width = 81
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Text = '0,00'
      OnExit = edtValorExit
    end
    object edtCodFormaPgto: TEdit
      Left = 8
      Top = 59
      Width = 57
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      OnEnter = edtCodFormaPgtoEnter
      OnExit = edtCodFormaPgtoExit
    end
    object BtnBuscaFormaPgto: TBitBtn
      Left = 72
      Top = 59
      Width = 25
      Height = 19
      TabOrder = 4
      OnClick = BtnBuscaFormaPgtoClick
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
    object RchEdtObs: TRichEdit
      Left = 8
      Top = 130
      Width = 393
      Height = 41
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
    end
    object edtCodConta: TEdit
      Left = 8
      Top = 94
      Width = 57
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
      OnEnter = edtCodContaEnter
      OnExit = edtCodContaExit
    end
    object BtnBuscaConta: TBitBtn
      Left = 72
      Top = 94
      Width = 25
      Height = 19
      TabOrder = 7
      OnClick = BtnBuscaContaClick
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
    object mskNovoVencimento: TMaskEdit
      Left = 176
      Top = 24
      Width = 89
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 2
      Text = '  /  /    '
      Visible = False
    end
  end
  object PnRodape: TPanel
    Left = 0
    Top = 217
    Width = 412
    Height = 41
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 2
    object BtnConfirmar: TBitBtn
      Left = 104
      Top = 8
      Width = 91
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = BtnConfirmarClick
    end
    object BtnCancelar: TBitBtn
      Left = 208
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Cancelar - ESC'
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object dsQuitar: TDataSource
    DataSet = cdsQuitar
    Left = 184
    Top = 185
  end
  object cdsQuitar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuitar'
    Left = 216
    Top = 185
  end
  object dspQuitar: TDataSetProvider
    DataSet = qryQuitar
    Left = 248
    Top = 185
  end
  object qryQuitar: TSQLQuery
    DataSource = dsQuitar
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 280
    Top = 185
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 288
    Top = 129
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 320
    Top = 129
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Left = 352
    Top = 129
  end
  object qryAux: TSQLQuery
    DataSource = dsAux
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 384
    Top = 129
  end
  object dsAux2: TDataSource
    DataSet = cdsAux2
    Left = 112
    Top = 105
  end
  object cdsAux2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux2'
    Left = 144
    Top = 105
  end
  object dspAux2: TDataSetProvider
    DataSet = qryAux2
    Left = 176
    Top = 105
  end
  object qryAux2: TSQLQuery
    DataSource = dsAux2
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 208
    Top = 105
  end
  object dsParcial: TDataSource
    DataSet = cdsParcial
    Left = 256
    Top = 97
  end
  object cdsParcial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParcial'
    Left = 288
    Top = 97
  end
  object dspParcial: TDataSetProvider
    DataSet = qryParcial
    Left = 320
    Top = 97
  end
  object qryParcial: TSQLQuery
    DataSource = dsParcial
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 352
    Top = 97
  end
end
