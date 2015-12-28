object frmIncluirCaixa: TfrmIncluirCaixa
  Left = 431
  Top = 393
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'INLUS'#195'O DE LAN'#199'AMENTO NO CAIXA'
  ClientHeight = 209
  ClientWidth = 393
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
  PixelsPerInch = 96
  TextHeight = 13
  object PnDados: TPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 168
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label3: TLabel
      Left = 72
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label4: TLabel
      Left = 96
      Top = 64
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label5: TLabel
      Left = 8
      Top = 112
      Width = 53
      Height = 13
      Caption = 'C'#243'd. Conta'
    end
    object lblConta: TLabel
      Left = 104
      Top = 128
      Width = 6
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 176
      Top = 64
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object BtnBuscaConta: TBitBtn
      Left = 72
      Top = 128
      Width = 25
      Height = 19
      TabOrder = 6
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
    object edtCodConta: TEdit
      Left = 8
      Top = 128
      Width = 57
      Height = 19
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      OnEnter = edtCodContaEnter
      OnExit = edtCodContaExit
    end
    object edtCodigo: TEdit
      Left = 8
      Top = 32
      Width = 57
      Height = 19
      CharCase = ecUpperCase
      Color = clMoneyGreen
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object edtValor: TEdit
      Left = 8
      Top = 80
      Width = 81
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      OnExit = edtValorExit
    end
    object edtDescricao: TEdit
      Left = 72
      Top = 32
      Width = 313
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object mskData: TMaskEdit
      Left = 96
      Top = 80
      Width = 72
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 3
      Text = '  /  /    '
    end
    object CbxTipo: TComboBox
      Left = 176
      Top = 80
      Width = 81
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      Color = 13565951
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = 'ENTRADA'
      Items.Strings = (
        'ENTRADA'
        'SA'#205'DA')
    end
  end
  object PnRodape: TPanel
    Left = 0
    Top = 168
    Width = 393
    Height = 41
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 1
    object BtnGravar: TBitBtn
      Left = 112
      Top = 8
      Width = 83
      Height = 25
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = BtnGravarClick
    end
    object BtnCancelar: TBitBtn
      Left = 200
      Top = 8
      Width = 81
      Height = 25
      Caption = 'Cancelar - ESC'
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object dsCaixa: TDataSource
    DataSet = cdsCaixa
    Left = 184
    Top = 112
  end
  object cdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaixa'
    Left = 216
    Top = 112
  end
  object dspCaixa: TDataSetProvider
    DataSet = qryCaixa
    Left = 248
    Top = 112
  end
  object qryCaixa: TSQLQuery
    DataSource = dsCaixa
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 280
    Top = 112
  end
end
