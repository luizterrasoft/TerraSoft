object frmIncluirCompra: TfrmIncluirCompra
  Left = 257
  Top = 67
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'COMPRA'
  ClientHeight = 597
  ClientWidth = 761
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
  object PnDadosCompra: TPanel
    Left = 0
    Top = 0
    Width = 761
    Height = 129
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 42
      Height = 13
      Caption = 'NF/Doc.'
    end
    object Label2: TLabel
      Left = 88
      Top = 24
      Width = 54
      Height = 13
      Caption = 'Fornecedor'
    end
    object lblFornecedor: TLabel
      Left = 184
      Top = 40
      Width = 297
      Height = 20
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 488
      Top = 24
      Width = 39
      Height = 13
      Caption = 'Emiss'#227'o'
    end
    object Label4: TLabel
      Left = 568
      Top = 24
      Width = 37
      Height = 13
      Caption = 'Entrada'
    end
    object Label5: TLabel
      Left = 648
      Top = 24
      Width = 51
      Height = 13
      Caption = 'Valor Total'
    end
    object Label6: TLabel
      Left = 8
      Top = 64
      Width = 63
      Height = 13
      Caption = 'Observa'#231#245'es'
    end
    object Label7: TLabel
      Left = 8
      Top = 4
      Width = 195
      Height = 13
      Caption = 'DADOS PRINCIPAIS DA COMPRA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 488
      Top = 64
      Width = 89
      Height = 13
      Caption = 'Valor dos Produtos'
    end
    object edtNFDoc: TEdit
      Left = 8
      Top = 40
      Width = 73
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtCodFornecedor: TEdit
      Left = 88
      Top = 40
      Width = 57
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnEnter = edtCodFornecedorEnter
      OnExit = edtCodFornecedorExit
    end
    object BtnBuscaFornecedor: TBitBtn
      Left = 152
      Top = 40
      Width = 25
      Height = 21
      TabOrder = 2
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
    object mskEmissao: TMaskEdit
      Left = 488
      Top = 40
      Width = 73
      Height = 19
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 3
      Text = '  /  /    '
    end
    object mskEntrada: TMaskEdit
      Left = 568
      Top = 40
      Width = 72
      Height = 19
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 4
      Text = '  /  /    '
    end
    object edtValorTotalNF: TEdit
      Left = 648
      Top = 40
      Width = 81
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      OnExit = edtValorTotalNFExit
    end
    object RchEdtObs: TRichEdit
      Left = 8
      Top = 80
      Width = 337
      Height = 41
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object BtnConfirmar: TBitBtn
      Left = 632
      Top = 80
      Width = 97
      Height = 41
      Caption = 'CONFIRMAR'
      TabOrder = 8
      OnClick = BtnConfirmarClick
    end
    object edtValorProdutos: TEdit
      Left = 488
      Top = 80
      Width = 73
      Height = 19
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
      OnExit = edtValorProdutosExit
    end
  end
  object PnItens: TPanel
    Left = 0
    Top = 129
    Width = 761
    Height = 416
    Align = alTop
    Color = clMoneyGreen
    Enabled = False
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 8
      Top = 8
      Width = 745
      Height = 401
      ActivePage = TbShtItens
      TabOrder = 0
      object TbShtItens: TTabSheet
        Caption = 'Itens da Compra'
        object Label9: TLabel
          Left = 8
          Top = 8
          Width = 37
          Height = 13
          Caption = 'Produto'
        end
        object Label10: TLabel
          Left = 528
          Top = 8
          Width = 55
          Height = 13
          Caption = 'Quantidade'
        end
        object Label11: TLabel
          Left = 592
          Top = 8
          Width = 63
          Height = 13
          Caption = 'Valor Unit'#225'rio'
        end
        object Label12: TLabel
          Left = 664
          Top = 8
          Width = 51
          Height = 13
          Caption = 'Valor Total'
        end
        object Label13: TLabel
          Left = 464
          Top = 8
          Width = 56
          Height = 13
          Caption = 'Un. Compra'
        end
        object Label14: TLabel
          Left = 40
          Top = 56
          Width = 555
          Height = 13
          Caption = 
            'Se desejar vincular o item '#224' um equipamento, dever'#225' selecionar o' +
            ' equipamento no campo abaixo.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEquipamento: TLabel
          Left = 96
          Top = 88
          Width = 6
          Height = 20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 8
          Top = 80
          Width = 62
          Height = 13
          Caption = 'Equipamento'
        end
        object Bevel1: TBevel
          Left = -8
          Top = 135
          Width = 721
          Height = 2
        end
        object Label16: TLabel
          Left = 322
          Top = 115
          Width = 108
          Height = 13
          Alignment = taCenter
          Caption = 'ITENS LAN'#199'ADOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 376
          Top = 8
          Width = 21
          Height = 13
          Caption = 'Tipo'
        end
        object edtCodProduto: TEdit
          Left = 8
          Top = 24
          Width = 49
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          OnEnter = edtCodProdutoEnter
          OnExit = edtCodProdutoExit
        end
        object BtnBuscaProduto: TBitBtn
          Left = 61
          Top = 23
          Width = 25
          Height = 21
          TabOrder = 0
          OnClick = BtnBuscaProdutoClick
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
        object edtQuantidade: TEdit
          Left = 528
          Top = 24
          Width = 57
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 5
          Text = '0,00'
        end
        object edtValorUnitario: TEdit
          Left = 592
          Top = 24
          Width = 65
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 6
          Text = '0,00'
          OnExit = edtValorUnitarioExit
        end
        object edtValorTotal: TEdit
          Left = 664
          Top = 24
          Width = 73
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 7
          Text = '0,00'
          OnExit = edtValorTotalExit
        end
        object edtUnCompra: TEdit
          Left = 464
          Top = 24
          Width = 57
          Height = 19
          CharCase = ecUpperCase
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
        end
        object edtCodEquipamento: TEdit
          Left = 8
          Top = 96
          Width = 49
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 10
          OnEnter = edtCodEquipamentoEnter
          OnExit = edtCodEquipamentoExit
        end
        object BtnBuscaEquipamento: TBitBtn
          Left = 62
          Top = 94
          Width = 25
          Height = 21
          TabOrder = 9
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
        object PnItensLancados: TPanel
          Left = 0
          Top = 132
          Width = 729
          Height = 233
          BorderStyle = bsSingle
          Color = clSilver
          TabOrder = 11
          object grdItens: TDBGrid
            Left = 2
            Top = 2
            Width = 641
            Height = 225
            Color = 13565951
            DataSource = dsItens
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
                FieldName = 'CODPRODUTO'
                Title.Alignment = taCenter
                Title.Caption = 'C'#243'd. Produto'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Alignment = taCenter
                Title.Caption = 'Descri'#231#227'o'
                Width = 279
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'UN_COMPRA'
                Title.Alignment = taCenter
                Title.Caption = 'Un.'
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'VALORUNITARIO'
                Title.Alignment = taCenter
                Title.Caption = 'Vlr Unitario'
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'QUANTIDADE'
                Title.Alignment = taCenter
                Title.Caption = 'Qtd.'
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'VALORTOTAL'
                Title.Alignment = taCenter
                Title.Caption = 'Vlr Total'
                Width = 65
                Visible = True
              end>
          end
          object BtnExcluir: TBitBtn
            Left = 648
            Top = 8
            Width = 75
            Height = 25
            Caption = 'Excluir Item'
            TabOrder = 1
            OnClick = BtnExcluirClick
          end
        end
        object edtDescricaoProduto: TEdit
          Left = 96
          Top = 24
          Width = 273
          Height = 19
          CharCase = ecUpperCase
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 3
        end
        object BtnIncluirItem: TBitBtn
          Left = 632
          Top = 48
          Width = 81
          Height = 33
          Caption = 'Incluir Item'
          TabOrder = 8
          OnClick = BtnIncluirItemClick
        end
        object CbxTipo: TComboBox
          Left = 376
          Top = 23
          Width = 81
          Height = 21
          Style = csDropDownList
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 1
          Text = 'PRODUTO'
          Items.Strings = (
            'PRODUTO'
            'SERVI'#199'O')
        end
      end
      object TbShtFaturamento: TTabSheet
        Caption = 'Faturamento'
        ImageIndex = 1
      end
    end
  end
  object PnOpcoes: TPanel
    Left = 0
    Top = 546
    Width = 761
    Height = 51
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 2
    object BtnConcluir: TBitBtn
      Left = 276
      Top = 13
      Width = 91
      Height = 25
      Caption = 'Concluir - F5'
      TabOrder = 0
      OnClick = BtnConcluirClick
    end
    object BtnSair: TBitBtn
      Left = 372
      Top = 13
      Width = 91
      Height = 25
      Caption = 'Sair - ESC'
      TabOrder = 1
      OnClick = BtnSairClick
    end
  end
  object dsCompra: TDataSource
    DataSet = cdsCompra
    Left = 272
    Top = 8
  end
  object cdsCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCompra'
    Left = 304
    Top = 8
  end
  object dspCompra: TDataSetProvider
    DataSet = qryCompra
    Left = 336
    Top = 8
  end
  object qryCompra: TSQLQuery
    DataSource = dsCompra
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 368
    Top = 8
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 272
    Top = 48
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItens'
    Left = 304
    Top = 48
  end
  object dspItens: TDataSetProvider
    DataSet = qryItens
    Left = 336
    Top = 48
  end
  object qryItens: TSQLQuery
    DataSource = dsItens
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 368
    Top = 48
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 272
    Top = 80
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 304
    Top = 80
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Left = 336
    Top = 80
  end
  object qryAux: TSQLQuery
    DataSource = dsAux
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 368
    Top = 80
  end
end
