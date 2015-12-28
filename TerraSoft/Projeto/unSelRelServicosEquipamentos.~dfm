object frmSelRelServicosEquipamentos: TfrmSelRelServicosEquipamentos
  Left = 749
  Top = 209
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Servi'#231'os por Equipamento'
  ClientHeight = 218
  ClientWidth = 436
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
  PixelsPerInch = 96
  TextHeight = 13
  object PnTopo: TPanel
    Left = 0
    Top = 0
    Width = 436
    Height = 161
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 62
      Height = 13
      Caption = 'Equipamento'
    end
    object lblEquipamento: TLabel
      Left = 112
      Top = 24
      Width = 313
      Height = 16
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 38
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object Label3: TLabel
      Left = 88
      Top = 77
      Width = 6
      Height = 13
      Caption = #224
    end
    object Label4: TLabel
      Left = 8
      Top = 104
      Width = 30
      Height = 13
      Caption = 'Status'
    end
    object edtCodEquipamento: TEdit
      Left = 8
      Top = 24
      Width = 65
      Height = 19
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnExit = edtCodEquipamentoExit
    end
    object BtnBuscaEquipamento: TBitBtn
      Left = 80
      Top = 22
      Width = 25
      Height = 21
      TabOrder = 1
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
    object mskInicial: TMaskEdit
      Left = 8
      Top = 72
      Width = 73
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 2
      Text = '  /  /    '
    end
    object mskFinal: TMaskEdit
      Left = 104
      Top = 72
      Width = 73
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 3
      Text = '  /  /    '
    end
    object CbxStatus: TComboBox
      Left = 8
      Top = 120
      Width = 73
      Height = 21
      Style = csDropDownList
      Color = 13565951
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = 'ABERTA'
      Items.Strings = (
        'ABERTA'
        'FECHADA'
        'TODOS')
    end
  end
  object PnBotoes: TPanel
    Left = 0
    Top = 168
    Width = 436
    Height = 50
    Align = alBottom
    TabOrder = 1
    object BtnGerar: TBitBtn
      Left = 140
      Top = 11
      Width = 75
      Height = 25
      Caption = 'GERAR'
      TabOrder = 0
      OnClick = BtnGerarClick
    end
    object BtnSair: TBitBtn
      Left = 220
      Top = 11
      Width = 75
      Height = 25
      Caption = 'SAIR - Esc'
      TabOrder = 1
      OnClick = BtnSairClick
    end
  end
  object qryRel: TSQLQuery
    DataSource = dsRel
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 224
    Top = 24
  end
  object dsRel: TDataSource
    DataSet = cdsRel
    Left = 256
    Top = 24
  end
  object cdsRel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel'
    Left = 288
    Top = 24
  end
  object dspRel: TDataSetProvider
    DataSet = qryRel
    Left = 320
    Top = 24
  end
end
