object frmIncluirOS: TfrmIncluirOS
  Left = 425
  Top = 138
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'INCLUS'#195'O/ALTERA'#199#195'O O.S.'
  ClientHeight = 519
  ClientWidth = 700
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label12: TLabel
    Left = 302
    Top = 145
    Width = 97
    Height = 24
    Caption = 'Itens O.S.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Reference Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object PnPrincipaisOS: TPanel
    Left = 0
    Top = 0
    Width = 700
    Height = 137
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 13
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 78
      Top = 13
      Width = 66
      Height = 13
      Caption = 'Data Abertura'
    end
    object Label3: TLabel
      Left = 150
      Top = 13
      Width = 53
      Height = 13
      Caption = 'Data Fech.'
    end
    object Label4: TLabel
      Left = 347
      Top = 51
      Width = 46
      Height = 13
      Caption = 'Vendedor'
    end
    object Label6: TLabel
      Left = 13
      Top = 52
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label8: TLabel
      Left = 586
      Top = 13
      Width = 51
      Height = 13
      Caption = 'Valor Total'
    end
    object Label11: TLabel
      Left = 228
      Top = 13
      Width = 30
      Height = 13
      Caption = 'Status'
    end
    object lblCliente: TLabel
      Left = 112
      Top = 65
      Width = 66
      Height = 16
      Caption = 'lblCliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblVendedor: TLabel
      Left = 446
      Top = 64
      Width = 86
      Height = 16
      Caption = 'lblVendedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorTotal: TLabel
      Left = 586
      Top = 26
      Width = 91
      Height = 16
      Caption = 'lblValorTotal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 327
      Top = 13
      Width = 51
      Height = 13
      Caption = 'O.S. Bloco'
    end
    object edtCodigo: TEdit
      Left = 13
      Top = 26
      Width = 59
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
      Text = 'EDTCODIGO'
    end
    object edtCodCliente: TEdit
      Left = 13
      Top = 65
      Width = 59
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      Text = 'EDTCODCLIENTE'
      OnEnter = edtCodClienteEnter
      OnExit = edtCodClienteExit
    end
    object edtCodVendedor: TEdit
      Left = 347
      Top = 64
      Width = 59
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 7
      Text = 'EDTCODVENDEDOR'
      OnEnter = edtCodVendedorEnter
      OnExit = edtCodVendedorExit
    end
    object mskDataAbertura: TMaskEdit
      Left = 78
      Top = 26
      Width = 67
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 1
      Text = '  /  /    '
    end
    object mskFechamento: TMaskEdit
      Left = 150
      Top = 26
      Width = 70
      Height = 19
      Color = 13565951
      Ctl3D = False
      Enabled = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 2
      Text = '  /  /    '
    end
    object CbxStatus: TComboBox
      Left = 228
      Top = 26
      Width = 91
      Height = 21
      Style = csDropDownList
      Color = 13565951
      Ctl3D = False
      ItemHeight = 13
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 3
      Text = 'ABERTA'
      Items.Strings = (
        'ABERTA'
        'FECHADA')
    end
    object BtnBuscaCliente: TBitBtn
      Left = 78
      Top = 65
      Width = 27
      Height = 19
      TabOrder = 6
      OnClick = BtnBuscaClienteClick
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
    object BtnBuscaVendedor: TBitBtn
      Left = 412
      Top = 64
      Width = 29
      Height = 19
      TabOrder = 8
      OnClick = BtnBuscaVendedorClick
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
    object BtnConfirmar: TBitBtn
      Left = 606
      Top = 89
      Width = 72
      Height = 33
      Caption = 'CONFIRMAR'
      TabOrder = 9
      OnClick = BtnConfirmarClick
    end
    object edtOSBloco: TEdit
      Left = 327
      Top = 26
      Width = 62
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      Text = 'EDTOSBLOCO'
    end
  end
  object PnServicos: TPanel
    Left = 0
    Top = 177
    Width = 700
    Height = 342
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 1
    object PnIncluirItem: TPanel
      Left = 1
      Top = 1
      Width = 694
      Height = 162
      Align = alTop
      TabOrder = 0
      object Label16: TLabel
        Left = 8
        Top = 124
        Width = 74
        Height = 13
        Caption = 'Hora/KM Inicial'
      end
      object Label17: TLabel
        Left = 93
        Top = 124
        Width = 69
        Height = 13
        Caption = 'Hora Final/KM'
      end
      object Label18: TLabel
        Left = 288
        Top = 8
        Width = 104
        Height = 13
        Caption = 'Equipamento/Ve'#237'culo'
      end
      object Label19: TLabel
        Left = 8
        Top = 11
        Width = 55
        Height = 13
        Caption = 'Funcion'#225'rio'
      end
      object lblEquipamento: TLabel
        Left = 384
        Top = 26
        Width = 109
        Height = 16
        Caption = 'lblEquipamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFuncionarioItem: TLabel
        Left = 104
        Top = 28
        Width = 128
        Height = 16
        Caption = 'lblFuncionarioItem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 171
        Top = 124
        Width = 72
        Height = 13
        Caption = 'Qtd. Horas/KM'
      end
      object Label13: TLabel
        Left = 250
        Top = 124
        Width = 71
        Height = 13
        Caption = 'Valor Hora/KM'
      end
      object Label15: TLabel
        Left = 336
        Top = 124
        Width = 24
        Height = 13
        Caption = 'Total'
      end
      object lblValorTotalServico: TLabel
        Left = 336
        Top = 140
        Width = 144
        Height = 16
        Caption = 'lblValorTotalServico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 606
        Top = 8
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label5: TLabel
        Left = 8
        Top = 59
        Width = 66
        Height = 13
        Caption = 'Observa'#231#245'es:'
      end
      object edtCodEquipamento: TEdit
        Left = 288
        Top = 24
        Width = 49
        Height = 19
        CharCase = ecUpperCase
        Color = 13565951
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        Text = 'EDTCODEQUIPAMENTO'
        OnEnter = edtCodEquipamentoEnter
        OnExit = edtCodEquipamentoExit
      end
      object BtnBuscaEquipamento: TBitBtn
        Left = 344
        Top = 24
        Width = 33
        Height = 19
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
      object edtCodFuncITem: TEdit
        Left = 8
        Top = 27
        Width = 49
        Height = 19
        CharCase = ecUpperCase
        Color = 13565951
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        Text = 'EDTCODFUNCITEM'
        OnEnter = edtCodFuncITemEnter
        OnExit = edtCodFuncITemExit
      end
      object BtnBuscaFuncionarioItem: TBitBtn
        Left = 64
        Top = 27
        Width = 33
        Height = 19
        TabOrder = 3
        OnClick = BtnBuscaFuncionarioItemClick
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
      object edtHoraInicial: TEdit
        Left = 8
        Top = 140
        Width = 65
        Height = 19
        CharCase = ecUpperCase
        Color = 13565951
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 6
        Text = 'EDTHORAINICIAL'
      end
      object edtHoraFinal: TEdit
        Left = 93
        Top = 140
        Width = 65
        Height = 19
        CharCase = ecUpperCase
        Color = 13565951
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 7
        Text = 'EDTHORAFINAL'
        OnExit = edtHoraFinalExit
      end
      object edtQtdHoras: TEdit
        Left = 171
        Top = 140
        Width = 65
        Height = 19
        CharCase = ecUpperCase
        Color = 13565951
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 8
        Text = 'EDTQTDHORAS'
      end
      object edtValorHora: TEdit
        Left = 250
        Top = 140
        Width = 65
        Height = 19
        CharCase = ecUpperCase
        Color = 13565951
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 9
        Text = 'EDTVALORHORA'
        OnExit = edtValorHoraExit
      end
      object BtnGravar: TBitBtn
        Left = 624
        Top = 101
        Width = 57
        Height = 25
        Caption = 'Gravar'
        TabOrder = 10
        OnClick = BtnGravarClick
      end
      object BtnExcluir: TBitBtn
        Left = 624
        Top = 126
        Width = 57
        Height = 25
        Caption = 'Excluir'
        TabOrder = 11
        OnClick = BtnExcluirClick
      end
      object mskDataItem: TMaskEdit
        Left = 606
        Top = 24
        Width = 73
        Height = 19
        Ctl3D = False
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 4
        Text = '  /  /    '
      end
      object RchEdtObsItem: TRichEdit
        Left = 8
        Top = 72
        Width = 597
        Height = 33
        Color = 13565951
        MaxLength = 800
        TabOrder = 5
      end
      object BtnNovo: TBitBtn
        Left = 624
        Top = 76
        Width = 57
        Height = 25
        Caption = 'Novo'
        TabOrder = 12
        OnClick = BtnNovoClick
      end
    end
    object GrdItens: TDBGrid
      Left = 1
      Top = 163
      Width = 694
      Height = 174
      Align = alClient
      DataSource = dsItens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = GrdItensCellClick
      OnKeyDown = GrdItensKeyDown
      OnKeyPress = GrdItensKeyPress
      OnKeyUp = GrdItensKeyUp
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EQUIPAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Equipamento/Ve'#237'culo'
          Width = 147
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS'
          Title.Alignment = taCenter
          Title.Caption = 'Obs.'
          Width = 147
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'HORAINICIAL'
          Title.Alignment = taCenter
          Title.Caption = 'Hora/KM Inicial'
          Width = 76
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'HORAFINAL'
          Title.Alignment = taCenter
          Title.Caption = 'Hora/KM Final'
          Width = 71
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTDHORAS'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Horas/KM'
          Width = 77
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VALORHORA'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Hora/KM'
          Width = 73
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Total'
          Width = 71
          Visible = True
        end>
    end
  end
  object BtnFechar: TBitBtn
    Left = 616
    Top = 141
    Width = 72
    Height = 33
    Caption = 'FECHAR O.S.'
    Enabled = False
    TabOrder = 2
    OnClick = BtnFecharClick
  end
  object dsOS: TDataSource
    DataSet = cdsOS
    Left = 584
    Top = 8
  end
  object cdsOS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOS'
    Left = 616
    Top = 8
  end
  object dspOS: TDataSetProvider
    DataSet = qryOS
    Left = 648
    Top = 8
  end
  object qryOS: TSQLQuery
    DataSource = dsOS
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 680
    Top = 8
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 553
    Top = 201
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItens'
    Left = 585
    Top = 201
  end
  object dspItens: TDataSetProvider
    DataSet = qryItens
    Left = 617
    Top = 201
  end
  object qryItens: TSQLQuery
    DataSource = dsItens
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 649
    Top = 201
  end
  object qryAux: TSQLQuery
    DataSource = dsAux
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 680
    Top = 40
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 616
    Top = 40
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Left = 648
    Top = 40
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 584
    Top = 40
  end
end
