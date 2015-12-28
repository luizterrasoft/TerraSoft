object frmTarefa7: TfrmTarefa7
  Left = 479
  Top = 124
  Width = 322
  Height = 290
  Caption = 'Tarefa 7'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblValor1: TLabel
    Left = 144
    Top = 20
    Width = 33
    Height = 13
    Caption = 'Valor 1'
  end
  object lblValor2: TLabel
    Left = 144
    Top = 76
    Width = 33
    Height = 13
    Caption = 'Valor 2'
  end
  object lblResultado: TLabel
    Left = 120
    Top = 184
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object rgOperacao: TRadioGroup
    Left = 32
    Top = 16
    Width = 105
    Height = 105
    Caption = 'Operacao'
    Items.Strings = (
      'Somar'
      'Subtrair'
      'Multiplicar'
      'Dividir')
    TabOrder = 0
  end
  object edValor1: TEdit
    Left = 144
    Top = 44
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edValor2: TEdit
    Left = 144
    Top = 100
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnCalcular: TButton
    Left = 88
    Top = 136
    Width = 121
    Height = 25
    Caption = 'Calcular'
    TabOrder = 3
    OnClick = btnCalcularClick
  end
  object edResultado: TEdit
    Left = 88
    Top = 200
    Width = 121
    Height = 21
    TabOrder = 4
  end
end
