object frmConsultaLivros: TfrmConsultaLivros
  Left = 318
  Top = 271
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CONSULTA DE LIVROS'
  ClientHeight = 396
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnConsulta: TPanel
    Left = 0
    Top = 0
    Width = 741
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 62
      Height = 13
      Caption = 'Consulta por:'
    end
    object Bevel1: TBevel
      Left = 96
      Top = 8
      Width = 2
      Height = 50
    end
    object Label2: TLabel
      Left = 112
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Digite'
    end
    object RdBtnID: TRadioButton
      Left = 32
      Top = 24
      Width = 49
      Height = 17
      Caption = 'ID'
      TabOrder = 0
    end
    object RdBtnTitulo: TRadioButton
      Left = 32
      Top = 40
      Width = 49
      Height = 17
      Caption = 'T'#237'tulo'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object edtConsulta: TEdit
      Left = 112
      Top = 24
      Width = 297
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 2
    end
    object BtnConsultar: TBitBtn
      Left = 448
      Top = 8
      Width = 75
      Height = 41
      Caption = 'CONSULTAR'
      TabOrder = 3
      OnClick = BtnConsultarClick
    end
  end
  object PnOpcoes: TPanel
    Left = 0
    Top = 352
    Width = 741
    Height = 44
    Align = alBottom
    TabOrder = 1
    object BtnIncluir: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = BtnIncluirClick
    end
    object BtnAlterar: TBitBtn
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = BtnAlterarClick
    end
    object BtnExcluir: TBitBtn
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BtnExcluirClick
    end
    object BtnSair: TBitBtn
      Left = 640
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Sair - Esc'
      TabOrder = 3
      OnClick = BtnSairClick
    end
    object BtnSelecionar: TBitBtn
      Left = 48
      Top = 8
      Width = 105
      Height = 25
      Caption = 'SELECIONAR'
      TabOrder = 4
      OnClick = BtnSelecionarClick
    end
  end
  object PnDados: TPanel
    Left = 0
    Top = 65
    Width = 741
    Height = 287
    Align = alClient
    TabOrder = 2
    object GrdLivros: TDBGrid
      Left = 1
      Top = 1
      Width = 739
      Height = 285
      Align = alClient
      DataSource = dsLivros
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
          FieldName = 'ID_LIVRO'
          Title.Alignment = taCenter
          Title.Caption = 'ID'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Title.Alignment = taCenter
          Title.Caption = 'T'#237'tulo'
          Width = 146
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EXEMPLAR'
          Title.Alignment = taCenter
          Title.Caption = 'Exemplar'
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AUTOR'
          Title.Alignment = taCenter
          Title.Caption = 'Autor'
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EDITORA'
          Title.Alignment = taCenter
          Title.Caption = 'Editora'
          Width = 82
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ANO'
          Title.Alignment = taCenter
          Title.Caption = 'Ano'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AREA_CONHECIMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Area Conhecimento'
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOCALIZACAO'
          Title.Alignment = taCenter
          Title.Caption = 'Localiza'#231#227'o'
          Width = 81
          Visible = True
        end>
    end
  end
  object qryLivros: TSQLQuery
    DataSource = dsLivros
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conexao
    Left = 544
    Top = 16
  end
  object dsLivros: TDataSource
    DataSet = cdsLivros
    Left = 576
    Top = 16
  end
  object cdsLivros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLivros'
    Left = 608
    Top = 16
  end
  object dspLivros: TDataSetProvider
    DataSet = qryLivros
    Left = 640
    Top = 16
  end
end
