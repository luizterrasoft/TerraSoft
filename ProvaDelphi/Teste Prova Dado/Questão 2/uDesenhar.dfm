object frmDesenhar: TfrmDesenhar
  Left = 433
  Top = 363
  Width = 536
  Height = 194
  Caption = 'Tarefa 2'
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 344
    Top = 16
    Width = 169
    Height = 121
  end
  object GrBxQuadrado: TGroupBox
    Left = 8
    Top = 8
    Width = 161
    Height = 137
    Caption = 'Quadrado'
    TabOrder = 0
    object lblLarguraQuadrado: TLabel
      Left = 16
      Top = 16
      Width = 36
      Height = 13
      Caption = 'Largura'
    end
    object edtLargQuadrado: TEdit
      Left = 16
      Top = 32
      Width = 137
      Height = 21
      TabOrder = 0
    end
    object BtnQuadrado: TBitBtn
      Left = 43
      Top = 104
      Width = 75
      Height = 25
      Caption = 'Quadrado'
      TabOrder = 1
      OnClick = BtnQuadradoClick
    end
  end
  object GrBxRetangulo: TGroupBox
    Left = 176
    Top = 8
    Width = 161
    Height = 137
    Caption = 'Ret'#226'ngulo'
    TabOrder = 1
    object lblLargRetangulo: TLabel
      Left = 16
      Top = 16
      Width = 36
      Height = 13
      Caption = 'Largura'
    end
    object lblAltRetangulo: TLabel
      Left = 16
      Top = 56
      Width = 27
      Height = 13
      Caption = 'Altura'
    end
    object edtLargRetangulo: TEdit
      Left = 16
      Top = 32
      Width = 137
      Height = 21
      TabOrder = 0
    end
    object edtAltRetangulo: TEdit
      Left = 16
      Top = 72
      Width = 137
      Height = 21
      TabOrder = 1
    end
    object BtnRetangulo: TBitBtn
      Left = 40
      Top = 104
      Width = 75
      Height = 25
      Caption = 'Ret'#226'ngulo'
      TabOrder = 2
    end
  end
end
