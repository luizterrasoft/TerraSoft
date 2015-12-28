object frmCadastros: TfrmCadastros
  Left = 441
  Top = 134
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CADASTROS'
  ClientHeight = 436
  ClientWidth = 507
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 507
    Height = 40
    Align = alTop
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 137
      Top = 7
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
  object PnDados: TPanel
    Left = 0
    Top = 40
    Width = 507
    Height = 345
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 1
  end
  object PnAcoes: TPanel
    Left = 0
    Top = 385
    Width = 507
    Height = 49
    Align = alTop
    TabOrder = 2
    object BtnGravar: TBitBtn
      Left = 163
      Top = 4
      Width = 98
      Height = 29
      Caption = 'GRAVAR - F5'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnGravarClick
    end
    object BtnCancelar: TBitBtn
      Left = 267
      Top = 4
      Width = 98
      Height = 29
      Caption = 'CANCELAR - ESC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 225
  end
  object cdsPadrao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 416
    Top = 257
  end
  object dspAux: TDataSetProvider
    Left = 448
    Top = 225
  end
  object dspPadrao: TDataSetProvider
    DataSet = qryPadrao
    Left = 448
    Top = 257
  end
  object dsAux: TDataSource
    Left = 480
    Top = 225
  end
  object dsPadrao: TDataSource
    DataSet = cdsPadrao
    Left = 480
    Top = 257
  end
  object qryAux: TSQLQuery
    Params = <>
    Left = 384
    Top = 225
  end
  object qryPadrao: TSQLQuery
    DataSource = dsPadrao
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 384
    Top = 257
  end
end
