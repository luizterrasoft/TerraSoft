inherited frmSelecaoRelFornecedores: TfrmSelecaoRelFornecedores
  Left = 355
  Top = 206
  Caption = 'RELAT'#211'RIOS DE FORNECEDORES'
  ClientHeight = 168
  ClientWidth = 701
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited BvSeparador1: TBevel
    Left = 312
    Top = 0
  end
  object PnFiltroData: TPanel [1]
    Left = 328
    Top = 8
    Width = 361
    Height = 145
    TabOrder = 5
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Inicial'
    end
    object Label2: TLabel
      Left = 88
      Top = 8
      Width = 22
      Height = 13
      Caption = 'Final'
    end
    object mskInicial: TMaskEdit
      Left = 8
      Top = 24
      Width = 73
      Height = 19
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 0
      Text = '  /  /    '
    end
    object mskFInal: TMaskEdit
      Left = 88
      Top = 24
      Width = 73
      Height = 19
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object PnFiltroFicha: TPanel [2]
    Left = 320
    Top = 16
    Width = 361
    Height = 145
    TabOrder = 6
    object label123: TLabel
      Left = 8
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Fornecedor'
    end
    object lblFornecedor: TLabel
      Left = 104
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
    object edtCodFornecedor: TEdit
      Left = 8
      Top = 24
      Width = 57
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnEnter = edtCodFornecedorEnter
      OnExit = edtCodFornecedorExit
    end
    object BtnBuscaFornecedor: TBitBtn
      Left = 72
      Top = 23
      Width = 25
      Height = 21
      TabOrder = 1
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
  end
  inherited RdGrpRelatorio: TRadioGroup
    ItemIndex = 0
    Items.Strings = (
      'Rela'#231#227'o de Fornecedores'
      'Ficha Cadastral')
    OnClick = RdGrpRelatorioClick
  end
  inherited RdGrpOrdenacao: TRadioGroup
    Width = 121
    Height = 73
    ItemIndex = 0
    Items.Strings = (
      'C'#243'digo'
      'Raz'#227'o Social'
      'Fantasia'
      'Data de Cadastro')
  end
  inherited BtnGerar: TBitBtn
    Left = 80
    Top = 119
  end
  inherited BtnSair: TBitBtn
    Left = 168
    Top = 119
  end
  inherited RdGrpFiltro: TRadioGroup
    Height = 33
    ItemIndex = 0
    Items.Strings = (
      'Data de Cadastro')
  end
  inherited dsPadrao: TDataSource
    Left = 328
    Top = 128
  end
  inherited cdsPadrao: TClientDataSet
    Left = 360
    Top = 128
  end
  inherited dspPadrao: TDataSetProvider
    Left = 392
    Top = 128
  end
  inherited qryPadrao: TSQLQuery
    Left = 424
    Top = 128
  end
end
