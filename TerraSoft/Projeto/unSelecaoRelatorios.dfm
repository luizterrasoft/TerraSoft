object frmSelecaoRelatorios: TfrmSelecaoRelatorios
  Left = 441
  Top = 503
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'RELAT'#211'RIOS'
  ClientHeight = 186
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object BvSeparador1: TBevel
    Left = 368
    Top = 8
    Width = 2
    Height = 150
  end
  object RdGrpRelatorio: TRadioGroup
    Left = 8
    Top = 8
    Width = 161
    Height = 57
    Caption = 'Relat'#243'rio'
    TabOrder = 0
  end
  object RdGrpOrdenacao: TRadioGroup
    Left = 176
    Top = 8
    Width = 185
    Height = 57
    Caption = 'Ordena'#231#227'o'
    TabOrder = 1
  end
  object BtnGerar: TBitBtn
    Left = 104
    Top = 143
    Width = 81
    Height = 33
    Caption = 'GERAR - F5'
    TabOrder = 2
  end
  object BtnSair: TBitBtn
    Left = 192
    Top = 143
    Width = 81
    Height = 33
    Caption = 'SAIR - ESC'
    TabOrder = 3
    OnClick = BtnSairClick
  end
  object RdGrpFiltro: TRadioGroup
    Left = 8
    Top = 72
    Width = 161
    Height = 65
    Caption = 'Filtro'
    TabOrder = 4
  end
  object dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 176
    Top = 72
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 208
    Top = 72
  end
  object dspPadrao: TDataSetProvider
    DataSet = qryPadrao
    Left = 240
    Top = 72
  end
  object qryPadrao: TSQLQuery
    DataSource = dsPadrao
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 272
    Top = 72
  end
end
