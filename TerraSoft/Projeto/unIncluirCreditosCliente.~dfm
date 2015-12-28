object frmIncluirCreditosCliente: TfrmIncluirCreditosCliente
  Left = 510
  Top = 287
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'MOVIMENTA'#199#195'O CR'#201'DITO CLIENTE'
  ClientHeight = 188
  ClientWidth = 448
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
  PixelsPerInch = 96
  TextHeight = 13
  object PnTopo: TPanel
    Left = 0
    Top = 0
    Width = 448
    Height = 137
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label3: TLabel
      Left = 16
      Top = 88
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object edtDescricao: TEdit
      Left = 16
      Top = 24
      Width = 393
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtValor: TEdit
      Left = 16
      Top = 64
      Width = 81
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnExit = edtValorExit
    end
    object CbxTipo: TComboBox
      Left = 16
      Top = 104
      Width = 81
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      Ctl3D = False
      ItemHeight = 13
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 2
      Text = 'ENTRADA'
      Items.Strings = (
        'ENTRADA'
        'SAIDA')
    end
  end
  object PnBotoes: TPanel
    Left = 0
    Top = 138
    Width = 448
    Height = 50
    Align = alBottom
    TabOrder = 1
    object BtnGravar: TBitBtn
      Left = 134
      Top = 13
      Width = 75
      Height = 25
      Caption = 'GRAVAR'
      TabOrder = 0
      OnClick = BtnGravarClick
    end
    object BtnCancelar: TBitBtn
      Left = 214
      Top = 13
      Width = 100
      Height = 25
      Caption = 'CANCELAR - ESC'
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object dsMovimentar: TDataSource
    DataSet = cdsMovimentar
    Left = 280
    Top = 48
  end
  object cdsMovimentar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovimentar'
    Left = 312
    Top = 48
  end
  object dspMovimentar: TDataSetProvider
    DataSet = qryMovimentar
    Left = 344
    Top = 48
  end
  object qryMovimentar: TSQLQuery
    DataSource = dsMovimentar
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 376
    Top = 48
  end
end
