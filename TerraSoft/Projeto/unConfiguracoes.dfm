object frmConfiguracoes: TfrmConfiguracoes
  Left = 390
  Top = 186
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CONFIGURA'#199#213'ES'
  ClientHeight = 359
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnTopo: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 53
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 168
      Top = 13
      Width = 146
      Height = 19
      Caption = 'CONFIGURA'#199#213'ES'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Reference Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PnConfigs: TPanel
    Left = 0
    Top = 53
    Width = 626
    Height = 259
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 7
      Top = 13
      Width = 22
      Height = 13
      Caption = 'C'#243'd.'
    end
    object Label2: TLabel
      Left = 137
      Top = 52
      Width = 55
      Height = 13
      Caption = 'Exige Login'
    end
    object Label3: TLabel
      Left = 7
      Top = 52
      Width = 28
      Height = 13
      Caption = 'Ramo'
    end
    object Label4: TLabel
      Left = 224
      Top = 52
      Width = 65
      Height = 13
      Caption = 'Tipo de Caixa'
    end
    object Label5: TLabel
      Left = 8
      Top = 88
      Width = 68
      Height = 13
      Caption = 'Caminho Logo'
    end
    object ImgLogo: TImage
      Left = 480
      Top = 8
      Width = 137
      Height = 89
      Stretch = True
    end
    object edtCodigo: TEdit
      Left = 7
      Top = 26
      Width = 39
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = '1'
    end
    object CbxExigeLogin: TComboBox
      Left = 137
      Top = 65
      Width = 78
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      Color = 13565951
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'SIM'
      Items.Strings = (
        'SIM'
        'N'#195'O')
    end
    object CbxRamo: TComboBox
      Left = 7
      Top = 65
      Width = 124
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      Color = 13565951
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'TERRAPLENAGEM'
      Items.Strings = (
        'TERRAPLENAGEM'
        'TRANSPORTES'
        'TURISMO')
    end
    object CbxTipoCaixa: TComboBox
      Left = 224
      Top = 64
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = 'DATA ORIGINAL '
      Items.Strings = (
        'DATA ORIGINAL '
        'DATA QUITA'#199#195'O ')
    end
    object edtCaminhoLogo: TEdit
      Left = 8
      Top = 104
      Width = 297
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
    end
    object BtnBuscaLogo: TBitBtn
      Left = 312
      Top = 102
      Width = 25
      Height = 21
      TabOrder = 5
      OnClick = BtnBuscaLogoClick
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
  end
  object PnRodape: TPanel
    Left = 0
    Top = 312
    Width = 626
    Height = 47
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 2
    object BtnGravar: TBitBtn
      Left = 212
      Top = 7
      Width = 96
      Height = 33
      Caption = 'GRAVAR'
      TabOrder = 0
      OnClick = BtnGravarClick
    end
    object BtnCancelar: TBitBtn
      Left = 314
      Top = 7
      Width = 100
      Height = 33
      Caption = 'CANCELAR - Esc'
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object dsConfiguracoes: TDataSource
    DataSet = cdsConfiguracoes
    Left = 376
    Top = 81
  end
  object cdsConfiguracoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfiguracoes'
    Left = 408
    Top = 81
  end
  object dspConfiguracoes: TDataSetProvider
    DataSet = qryConfiguracoes
    Left = 440
    Top = 81
  end
  object qryConfiguracoes: TSQLQuery
    DataSource = dsConfiguracoes
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 472
    Top = 81
  end
  object OpPicDlgLogo: TOpenPictureDialog
    Filter = 
      'All (*.png;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf)|*.png;*.jpg;*.j' +
      'peg;*.bmp;*.ico;*.emf;*.wmf|Portable Network Graphics (*.png)|*.' +
      'png|JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpe' +
      'g|Bitmaps (*.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles (' +
      '*.emf)|*.emf|Metafiles (*.wmf)|*.wmf|Portable Network Graphics (' +
      '*.png)|*.png'
    Left = 344
    Top = 157
  end
end
