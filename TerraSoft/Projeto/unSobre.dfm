object frmSobre: TfrmSobre
  Left = 631
  Top = 279
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sobre o sistema...'
  ClientHeight = 259
  ClientWidth = 415
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lblSistema: TLabel
    Left = 122
    Top = 31
    Width = 136
    Height = 24
    Caption = 'TERRASOFT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 13
    Top = 98
    Width = 395
    Height = 13
    Caption = 
      'Sistema para gerenciamento de terraplenagens/transportes e turis' +
      'mo.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 150
    Top = 202
    Width = 221
    Height = 13
    Caption = 'Desenvolvido por SoftHard Inform'#225'tica'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 13
    Top = 130
    Width = 49
    Height = 13
    Caption = 'Contato:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 13
    Top = 150
    Width = 79
    Height = 13
    Caption = '49 3555-6497'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 13
    Top = 176
    Width = 178
    Height = 13
    Caption = 'E-mail: comercial@shinf.com.br'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 13
    Top = 163
    Width = 79
    Height = 13
    Caption = '49 9926-1999'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BtnSair: TBitBtn
    Left = 156
    Top = 223
    Width = 72
    Height = 27
    Caption = 'SAIR - ESC'
    TabOrder = 0
    OnClick = BtnSairClick
  end
end