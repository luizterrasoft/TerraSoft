object frmIncluirAgendamento: TfrmIncluirAgendamento
  Left = 392
  Top = 228
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'AGENDAMENTO DE MANUTEN'#199#195'O PERI'#211'DICA'
  ClientHeight = 347
  ClientWidth = 446
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
  object PnTopo: TPanel
    Left = 0
    Top = 0
    Width = 446
    Height = 41
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 2
    object lblTitulo: TLabel
      Left = 107
      Top = 8
      Width = 243
      Height = 24
      Caption = 'INCLUS'#195'O/ALTERA'#199#195'O'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Reference Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PnRdape: TPanel
    Left = 0
    Top = 306
    Width = 446
    Height = 41
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 1
    object BtnGravar: TBitBtn
      Left = 136
      Top = 8
      Width = 97
      Height = 25
      Caption = 'GRAVAR - F5'
      TabOrder = 0
      OnClick = BtnGravarClick
    end
    object BtnCancelar: TBitBtn
      Left = 240
      Top = 8
      Width = 97
      Height = 25
      Caption = 'CANCELAR - ESC'
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object PnDados: TPanel
    Left = 0
    Top = 41
    Width = 446
    Height = 265
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
      Top = 56
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label4: TLabel
      Left = 8
      Top = 206
      Width = 62
      Height = 13
      Caption = 'Equipamento'
    end
    object lblEquipamento: TLabel
      Left = 104
      Top = 221
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
      Left = 72
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Status'
    end
    object Label8: TLabel
      Left = 8
      Top = 96
      Width = 63
      Height = 13
      Caption = 'Tipo Controle'
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
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object edtDescricao: TEdit
      Left = 8
      Top = 72
      Width = 353
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object edtCodEquipamento: TEdit
      Left = 8
      Top = 222
      Width = 57
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      OnEnter = edtCodEquipamentoEnter
      OnExit = edtCodEquipamentoExit
    end
    object BtnBuscaEquipamento: TBitBtn
      Left = 72
      Top = 222
      Width = 25
      Height = 19
      TabOrder = 3
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
    object CbxStatus: TComboBox
      Left = 72
      Top = 32
      Width = 73
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      Enabled = False
      ItemHeight = 13
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 4
      Text = 'ABERTO'
      Items.Strings = (
        'ABERTO'
        'CONCLUIDO')
    end
    object CbxTipoControl: TComboBox
      Left = 8
      Top = 112
      Width = 81
      Height = 21
      Style = csDropDownList
      Color = 13565951
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = 'HORA/KM'
      Items.Strings = (
        'HORA/KM'
        'DATA')
    end
    object GrBxPorHoraKM: TGroupBox
      Left = 8
      Top = 142
      Width = 193
      Height = 60
      Caption = 'Controle por Hora ou KM'
      Enabled = False
      TabOrder = 6
      object Label3: TLabel
        Left = 8
        Top = 20
        Width = 51
        Height = 13
        Caption = 'Qtd. Horas'
      end
      object Label6: TLabel
        Left = 96
        Top = 20
        Width = 49
        Height = 13
        Caption = 'Avisar em '
      end
      object Label7: TLabel
        Left = 158
        Top = 38
        Width = 29
        Height = 13
        Caption = 'horas.'
      end
      object edtQtdHoras: TEdit
        Left = 8
        Top = 35
        Width = 81
        Height = 19
        CharCase = ecUpperCase
        Color = 13565951
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object edtAvisar: TEdit
        Left = 96
        Top = 35
        Width = 57
        Height = 19
        CharCase = ecUpperCase
        Color = 13565951
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
      end
    end
    object GrBxControlePorData: TGroupBox
      Left = 208
      Top = 142
      Width = 105
      Height = 60
      Caption = 'Controle por Data'
      Enabled = False
      TabOrder = 7
      object Label9: TLabel
        Left = 8
        Top = 20
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object mskData: TMaskEdit
        Left = 8
        Top = 35
        Width = 73
        Height = 19
        Color = 13565951
        Ctl3D = False
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 0
        Text = '  /  /    '
      end
    end
  end
  object qryAgenda: TSQLQuery
    DataSource = dsAgenda
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 264
    Top = 73
  end
  object qryAux: TSQLQuery
    DataSource = dsAux
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 400
    Top = 73
  end
  object dsAgenda: TDataSource
    DataSet = cdsAgenda
    Left = 296
    Top = 73
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 432
    Top = 73
  end
  object cdsAgenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgenda'
    Left = 328
    Top = 73
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 464
    Top = 73
  end
  object dspAgenda: TDataSetProvider
    DataSet = qryAgenda
    Left = 360
    Top = 73
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Left = 496
    Top = 73
  end
end
