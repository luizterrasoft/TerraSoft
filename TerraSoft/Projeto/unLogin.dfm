object frmLogin: TfrmLogin
  Left = 438
  Top = 331
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ACESSO AO SISTEMA - TerraplenSoft'
  ClientHeight = 240
  ClientWidth = 485
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 159
    Top = 14
    Width = 320
    Height = 20
    Caption = 'CONTROLE PARA TERRAPLENAGEM'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 320
    Top = 40
    Width = 111
    Height = 20
    Caption = 'TerraplenSoft'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 102
    Top = 119
    Width = 59
    Height = 16
    Caption = 'Usu'#225'rio:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 102
    Top = 151
    Width = 49
    Height = 16
    Caption = 'Senha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 72
    Width = 433
    Height = 9
  end
  object edtUsuario: TEdit
    Left = 166
    Top = 109
    Width = 217
    Height = 22
    CharCase = ecUpperCase
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 166
    Top = 143
    Width = 217
    Height = 22
    CharCase = ecUpperCase
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object BtnEntrar: TBitBtn
    Left = 126
    Top = 194
    Width = 113
    Height = 33
    Caption = 'ENTRAR - Enter'
    TabOrder = 2
    OnClick = BtnEntrarClick
  end
  object BtnCancelar: TBitBtn
    Left = 246
    Top = 194
    Width = 113
    Height = 33
    Caption = 'CANCELAR - Esc'
    TabOrder = 3
    OnClick = BtnCancelarClick
  end
  object dsLogin: TDataSource
    DataSet = cdsLogin
    Left = 8
    Top = 88
  end
  object cdsLogin: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLogin'
    Left = 40
    Top = 88
  end
  object dspLogin: TDataSetProvider
    DataSet = qryLogin
    Left = 72
    Top = 88
  end
  object qryLogin: TSQLQuery
    DataSource = dsLogin
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 104
    Top = 88
  end
  object qryTentativas: TSQLQuery
    DataSource = dsTentativas
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 104
    Top = 120
  end
  object dspTentativas: TDataSetProvider
    DataSet = qryTentativas
    Left = 72
    Top = 120
  end
  object cdsTentativas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTentativas'
    Left = 40
    Top = 120
  end
  object dsTentativas: TDataSource
    DataSet = cdsTentativas
    Left = 8
    Top = 120
  end
end
