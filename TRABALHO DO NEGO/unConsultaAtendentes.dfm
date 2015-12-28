object frmConsultaAtendentes: TfrmConsultaAtendentes
  Left = 554
  Top = 271
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CONSULTA DE ATENDENTES'
  ClientHeight = 343
  ClientWidth = 539
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
    Width = 539
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
    object RdBtnLogin: TRadioButton
      Left = 32
      Top = 40
      Width = 49
      Height = 17
      Caption = 'Login'
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
    Top = 299
    Width = 539
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
      Left = 440
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
      Width = 97
      Height = 25
      Caption = 'SELECIONAR'
      TabOrder = 4
      Visible = False
      OnClick = BtnSelecionarClick
    end
  end
  object PnDados: TPanel
    Left = 0
    Top = 65
    Width = 539
    Height = 234
    Align = alClient
    TabOrder = 2
    object GrdAtendentes: TDBGrid
      Left = 1
      Top = 1
      Width = 537
      Height = 232
      Align = alClient
      DataSource = dsAtendentes
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
          FieldName = 'ID_ATENDENTE'
          Title.Alignment = taCenter
          Title.Caption = 'ID'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOGIN'
          Title.Alignment = taCenter
          Title.Caption = 'Login'
          Width = 369
          Visible = True
        end>
    end
  end
  object qryAtendentes: TSQLQuery
    DataSource = dsAtendentes
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conexao
    Left = 280
    Top = 8
  end
  object dsAtendentes: TDataSource
    DataSet = cdsAtendentes
    Left = 312
    Top = 8
  end
  object cdsAtendentes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAtendentes'
    Left = 344
    Top = 8
  end
  object dspAtendentes: TDataSetProvider
    DataSet = qryAtendentes
    Left = 376
    Top = 8
  end
end
