object frmLogin: TfrmLogin
  Left = 359
  Top = 290
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ACESSO AO SISTEMA'
  ClientHeight = 166
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 10
    Width = 304
    Height = 20
    Caption = 'GERENCIAMENTO DE BIBLIOTECA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 32
    Width = 337
    Height = 9
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 39
    Height = 16
    Caption = 'Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 96
    Width = 45
    Height = 16
    Caption = 'Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtLogin: TEdit
    Left = 80
    Top = 56
    Width = 177
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 80
    Top = 88
    Width = 177
    Height = 21
    CharCase = ecUpperCase
    PasswordChar = '*'
    TabOrder = 1
  end
  object BtnEntrar: TBitBtn
    Left = 103
    Top = 127
    Width = 75
    Height = 25
    Caption = 'ENTRAR'
    TabOrder = 2
    OnClick = BtnEntrarClick
  end
  object BtnCancelar: TBitBtn
    Left = 183
    Top = 127
    Width = 75
    Height = 25
    Caption = 'CANCELAR'
    TabOrder = 3
    OnClick = BtnCancelarClick
  end
  object qryLogin: TSQLQuery
    DataSource = dsLogin
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conexao
    Left = 208
    Top = 8
  end
  object dsLogin: TDataSource
    DataSet = cdsLogin
    Left = 240
    Top = 8
  end
  object cdsLogin: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLogin'
    Left = 272
    Top = 8
  end
  object dspLogin: TDataSetProvider
    DataSet = qryLogin
    Left = 304
    Top = 8
  end
end
