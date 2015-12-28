object frmOrdensParcelaOrigem: TfrmOrdensParcelaOrigem
  Left = 370
  Top = 199
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Origem da Parcela'
  ClientHeight = 328
  ClientWidth = 325
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
  object Label1: TLabel
    Left = 80
    Top = 72
    Width = 157
    Height = 20
    Caption = 'Ordens de Servi'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 271
    Height = 13
    Caption = 'Essa parcela '#233' resultado de uma renegocia'#231#227'o,'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 24
    Width = 302
    Height = 13
    Caption = 'abaixo est'#225' sendo exibido as O.S. que correspondem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 40
    Width = 132
    Height = 13
    Caption = 'a parcela renegociada.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GrdOrdens: TDBGrid
    Left = 80
    Top = 96
    Width = 97
    Height = 185
    DataSource = dsOrdens
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
        FieldName = 'CODOS'
        Title.Alignment = taCenter
        Title.Caption = 'OS'
        Visible = True
      end>
  end
  object BtnSair: TBitBtn
    Left = 135
    Top = 293
    Width = 75
    Height = 25
    Caption = 'Sair - ESC'
    TabOrder = 1
    OnClick = BtnSairClick
  end
  object BtnVisualizar: TBitBtn
    Left = 184
    Top = 101
    Width = 65
    Height = 25
    Caption = 'Visualizar'
    TabOrder = 2
    OnClick = BtnVisualizarClick
  end
  object dsOrdens: TDataSource
    DataSet = cdsOrdens
    Left = 16
    Top = 136
  end
  object cdsOrdens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrdens'
    Left = 112
    Top = 168
  end
  object dspOrdens: TDataSetProvider
    DataSet = qryOrdens
    Left = 144
    Top = 168
  end
  object qryOrdens: TSQLQuery
    DataSource = dsOrdens
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 176
    Top = 168
  end
end
