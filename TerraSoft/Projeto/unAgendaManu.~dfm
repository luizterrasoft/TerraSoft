object frmAgendaManu: TfrmAgendaManu
  Left = 345
  Top = 203
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'AGENDA DE MANUTEN'#199#213'ES'
  ClientHeight = 365
  ClientWidth = 598
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
    Width = 598
    Height = 65
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object lblEquipamento: TLabel
      Left = 96
      Top = 32
      Width = 6
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 87
      Height = 13
      Caption = 'C'#243'd. Equipamento'
    end
    object Label2: TLabel
      Left = 376
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Status'
    end
    object edtCodEquipamento: TEdit
      Left = 8
      Top = 32
      Width = 49
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnEnter = edtCodEquipamentoEnter
      OnExit = edtCodEquipamentoExit
    end
    object BtnBuscaEquipamento: TBitBtn
      Left = 64
      Top = 32
      Width = 25
      Height = 21
      Caption = '...'
      TabOrder = 1
      OnClick = BtnBuscaEquipamentoClick
    end
    object BtnCOnsultar: TBitBtn
      Left = 504
      Top = 12
      Width = 75
      Height = 41
      Caption = 'CONSULTAR'
      TabOrder = 2
      OnClick = BtnCOnsultarClick
    end
    object CbxStatus: TComboBox
      Left = 376
      Top = 32
      Width = 97
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
        'CONCLU'#205'DA'
        'TODAS')
    end
  end
  object PnAgendamentos: TPanel
    Left = 0
    Top = 65
    Width = 598
    Height = 250
    Align = alClient
    TabOrder = 1
    object GrdAgendaments: TDBGrid
      Left = 1
      Top = 1
      Width = 596
      Height = 248
      Align = alClient
      Color = 13565951
      DataSource = dsAgendamentos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = GrdAgendamentsTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 226
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EQUIPAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Equipamento'
          Width = 194
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTDHORAS'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Horas'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'AVISO'
          Title.Alignment = taCenter
          Title.Caption = 'Avisar em '
          Visible = True
        end>
    end
  end
  object PnAcoes: TPanel
    Left = 0
    Top = 315
    Width = 598
    Height = 50
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 2
    object BtnIncluir: TBitBtn
      Left = 24
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = BtnIncluirClick
    end
    object BtnAlterar: TBitBtn
      Left = 104
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = BtnAlterarClick
    end
    object BtnExcluir: TBitBtn
      Left = 184
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BtnExcluirClick
    end
    object BtnConcluir: TBitBtn
      Left = 280
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Concluir'
      TabOrder = 3
      OnClick = BtnConcluirClick
    end
    object BtnSair: TBitBtn
      Left = 504
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Sair - ESC'
      TabOrder = 4
      OnClick = BtnSairClick
    end
  end
  object dsAgendamentos: TDataSource
    DataSet = cdsAgendamentos
    Left = 464
    Top = 281
  end
  object cdsAgendamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgendamentos'
    Left = 496
    Top = 281
  end
  object dspAgendamentos: TDataSetProvider
    DataSet = qryAgendamentos
    Left = 528
    Top = 281
  end
  object qryAgendamentos: TSQLQuery
    DataSource = dsAgendamentos
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 560
    Top = 281
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 464
    Top = 249
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 496
    Top = 249
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Left = 528
    Top = 249
  end
  object qryAux: TSQLQuery
    DataSource = dsAux
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 560
    Top = 249
  end
end
