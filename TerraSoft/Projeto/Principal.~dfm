object frmBackup: TfrmBackup
  Left = 390
  Top = 311
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Backup da base de dados'
  ClientHeight = 98
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    422
    98)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 8
    Width = 129
    Height = 13
    Caption = 'Caminho da base de dados'
  end
  object SBLoca: TSpeedButton
    Left = 304
    Top = 24
    Width = 23
    Height = 22
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SBLocaClick
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 39
    Height = 13
    Caption = 'Servidor'
  end
  object BExecBack: TButton
    Left = 72
    Top = 64
    Width = 105
    Height = 25
    Caption = 'Gerar backup'
    TabOrder = 0
    OnClick = BExecBackClick
  end
  object Button3: TButton
    Left = 296
    Top = 64
    Width = 73
    Height = 25
    Caption = 'Sair - ESC'
    TabOrder = 1
    OnClick = Button3Click
  end
  object EBase: TEdit
    Left = 96
    Top = 24
    Width = 209
    Height = 21
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 4
    Top = 56
    Width = 413
    Height = 2
    BevelOuter = bvLowered
    TabOrder = 3
  end
  object EServ: TEdit
    Left = 8
    Top = 24
    Width = 81
    Height = 21
    Enabled = False
    TabOrder = 4
    Text = 'localhost'
  end
  object BRestaurarBackup: TButton
    Left = 184
    Top = 64
    Width = 105
    Height = 25
    Caption = 'Restaurar backup'
    TabOrder = 5
    Visible = False
    OnClick = BRestaurarBackupClick
  end
  object StaticText1: TStaticText
    Left = 281
    Top = 3
    Width = 137
    Height = 17
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = 'TerraSoft'
    Font.Charset = ANSI_CHARSET
    Font.Color = 10987431
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Transparent = False
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'fdb'
    FileName = 'DADOS.FDB'
    Filter = 
      'Base de dados do Firebird(*.fdb)|*.fdb|Base de dados do Interbas' +
      'e(*.gdb)|*.gdb|Todos os arquivos|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'Localizar base de dados'
    Left = 216
    Top = 40
  end
  object XPManifest1: TXPManifest
    Left = 192
    Top = 43
  end
end
