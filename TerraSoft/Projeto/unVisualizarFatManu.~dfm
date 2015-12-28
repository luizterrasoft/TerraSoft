object frmVisualizarFatManu: TfrmVisualizarFatManu
  Left = 613
  Top = 250
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FATURAMENTO MANUTEN'#199#195'O'
  ClientHeight = 318
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GrdFaturamento: TDBGrid
    Left = 0
    Top = 0
    Width = 308
    Height = 318
    Align = alClient
    DataSource = dsFaturamento
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = GrdFaturamentoTitleClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VENCIMENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Vencimento'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taCenter
        Title.Caption = 'Valor'
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'STATUS'
        Title.Alignment = taCenter
        Title.Caption = 'Status'
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUMEROPARCELA'
        Title.Alignment = taCenter
        Title.Caption = 'N'#250'mero'
        Width = 47
        Visible = True
      end>
  end
  object BtnConsultar: TBitBtn
    Left = 64
    Top = 152
    Width = 75
    Height = 25
    Caption = 'BtnConsultar'
    TabOrder = 1
    Visible = False
    OnClick = BtnConsultarClick
  end
  object qryFaturamento: TSQLQuery
    DataSource = dsFaturamento
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 96
    Top = 40
  end
  object dsFaturamento: TDataSource
    DataSet = cdsFaturamento
    Left = 128
    Top = 40
  end
  object cdsFaturamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFaturamento'
    Left = 160
    Top = 40
  end
  object dspFaturamento: TDataSetProvider
    DataSet = qryFaturamento
    Left = 192
    Top = 40
  end
end
