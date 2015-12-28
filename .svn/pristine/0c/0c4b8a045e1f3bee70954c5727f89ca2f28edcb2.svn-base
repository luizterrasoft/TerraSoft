object frmConsultas: TfrmConsultas
  Left = 479
  Top = 186
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CONSULTAS'
  ClientHeight = 377
  ClientWidth = 579
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 579
    Height = 40
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 156
      Top = 7
      Width = 88
      Height = 24
      Caption = 'lblTitulo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Reference Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PnConsulta: TPanel
    Left = 0
    Top = 40
    Width = 579
    Height = 66
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 7
      Top = 7
      Width = 119
      Height = 13
      Caption = 'Op'#231#245'es de Consulta:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 539
      Top = 39
      Width = 23
      Height = 13
      Caption = '- F6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtConsulta: TEdit
      Left = 175
      Top = 37
      Width = 358
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object PnDados: TPanel
    Left = 0
    Top = 106
    Width = 579
    Height = 228
    Align = alTop
    TabOrder = 2
  end
  object PnAcoes: TPanel
    Left = 0
    Top = 334
    Width = 579
    Height = 40
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 3
    object BtnIncluir: TBitBtn
      Left = 56
      Top = 7
      Width = 88
      Height = 24
      Caption = 'Incluir - F2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnIncluirClick
    end
    object BtnAlterar: TBitBtn
      Left = 152
      Top = 7
      Width = 88
      Height = 24
      Caption = 'Alterar - F3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnAlterarClick
    end
    object BtnExcluir: TBitBtn
      Left = 247
      Top = 7
      Width = 88
      Height = 24
      Caption = 'Excluir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtnExcluirClick
    end
    object BtnSair: TBitBtn
      Left = 488
      Top = 7
      Width = 73
      Height = 24
      Caption = 'Sair - ESC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BtnSairClick
    end
    object BtnRelatorios: TBitBtn
      Left = 376
      Top = 7
      Width = 81
      Height = 24
      Caption = 'Relat'#243'rios'
      TabOrder = 4
      Visible = False
    end
  end
  object qryDados: TSQLQuery
    DataSource = dsDados
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 8
    Top = 113
  end
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 40
    Top = 113
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDados'
    Left = 72
    Top = 113
  end
  object dspDados: TDataSetProvider
    DataSet = qryDados
    Left = 104
    Top = 113
  end
end
