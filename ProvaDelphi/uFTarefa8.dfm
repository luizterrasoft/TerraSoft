object FTarefa8: TFTarefa8
  Left = 192
  Top = 114
  Width = 495
  Height = 235
  Caption = 'Tarefa 8'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblThread1: TLabel
    Left = 16
    Top = 8
    Width = 43
    Height = 13
    Caption = 'Thread 1'
  end
  object lblThread2: TLabel
    Left = 16
    Top = 80
    Width = 43
    Height = 13
    Caption = 'Thread 2'
  end
  object lblThread1Milisegundos: TLabel
    Left = 16
    Top = 152
    Width = 113
    Height = 13
    Caption = 'Thread 1 (Milisegundos)'
  end
  object lblThread2Milisegundos: TLabel
    Left = 144
    Top = 152
    Width = 113
    Height = 13
    Caption = 'Thread 2 (Milisegundos)'
  end
  object pbThread2: TProgressBar
    Left = 16
    Top = 96
    Width = 457
    Height = 41
    TabOrder = 0
  end
  object pbThread1: TProgressBar
    Left = 16
    Top = 24
    Width = 457
    Height = 41
    TabOrder = 1
  end
  object edtThread1Milisegundos: TEdit
    Left = 16
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'edtThread1Milisegundos'
  end
  object edtThread2Milisegundos: TEdit
    Left = 144
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'edtThread2Milisegundos'
  end
  object BtnIniciar: TBitBtn
    Left = 296
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 4
    OnClick = BtnIniciarClick
  end
end