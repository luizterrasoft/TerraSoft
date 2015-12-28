object frmCadastroAtendentes: TfrmCadastroAtendentes
  Left = 518
  Top = 334
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CADASTRO DO ATENDENTE'
  ClientHeight = 150
  ClientWidth = 417
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
  object PnDados: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 102
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 37
      Height = 13
      Caption = 'ID Livro'
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 30
      Height = 13
      Caption = 'Login*'
    end
    object Label3: TLabel
      Left = 192
      Top = 56
      Width = 35
      Height = 13
      Caption = 'Senha*'
    end
    object edtIDAtendente: TEdit
      Left = 8
      Top = 24
      Width = 57
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
      Text = 'EDTIDLIVRO'
    end
    object edtLogin: TEdit
      Left = 8
      Top = 72
      Width = 177
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 1
      Text = 'EDTTITULO'
    end
    object edtSenha: TEdit
      Left = 192
      Top = 72
      Width = 201
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 2
      Text = 'EDTEXEMPLAR'
    end
  end
  object PnOpcoes: TPanel
    Left = 0
    Top = 102
    Width = 417
    Height = 48
    Align = alBottom
    TabOrder = 1
    object BtnGravar: TBitBtn
      Left = 120
      Top = 12
      Width = 83
      Height = 25
      Caption = 'GRAVAR'
      TabOrder = 0
      OnClick = BtnGravarClick
    end
    object BtnCancelar: TBitBtn
      Left = 208
      Top = 12
      Width = 97
      Height = 25
      Caption = 'CANCELAR - Esc'
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object qryCadAtendente: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conexao
    Left = 320
    Top = 16
  end
end
