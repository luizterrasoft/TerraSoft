object frmTarefa2: TfrmTarefa2
  Left = 271
  Top = 210
  Width = 928
  Height = 480
  Caption = 'Tarefa 2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox: TPaintBox
    Left = 432
    Top = 32
    Width = 160
    Height = 160
  end
  object grpBxQuadrado: TGroupBox
    Left = 16
    Top = 24
    Width = 185
    Height = 161
    Caption = 'Quadrado'
    TabOrder = 0
    object ldlLargura: TLabel
      Left = 16
      Top = 24
      Width = 39
      Height = 13
      Caption = 'Largura:'
    end
    object edLarguraQuadrado: TEdit
      Left = 32
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object btnQuadrado: TButton
      Left = 32
      Top = 80
      Width = 121
      Height = 25
      Caption = 'Quadrado'
      TabOrder = 1
      OnClick = btnQuadradoClick
    end
  end
  object grpBxRetangulo: TGroupBox
    Left = 224
    Top = 24
    Width = 185
    Height = 161
    Caption = 'Ret'#226'ngulo'
    TabOrder = 1
    object lblLargura: TLabel
      Left = 16
      Top = 24
      Width = 39
      Height = 13
      Caption = 'Largura:'
    end
    object lblAltura: TLabel
      Left = 16
      Top = 80
      Width = 30
      Height = 13
      Caption = 'Altura:'
    end
    object edLarguraRetangulo: TEdit
      Left = 32
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edAlturaRetangulo: TEdit
      Left = 32
      Top = 104
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object btnRetangulo: TButton
      Left = 32
      Top = 128
      Width = 121
      Height = 25
      Caption = 'Ret'#226'ngulo'
      TabOrder = 2
      OnClick = btnRetanguloClick
    end
  end
end