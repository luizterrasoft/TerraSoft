object FTarefa1: TFTarefa1
  Left = 278
  Top = 282
  Width = 244
  Height = 193
  Caption = 'Tarefa 1'
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
  object lblInserirNaFila: TLabel
    Left = 16
    Top = 24
    Width = 62
    Height = 13
    Caption = 'Inserir na Fila'
  end
  object edtInserirFila: TEdit
    Left = 16
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object BtnInserirFIla: TBitBtn
    Left = 144
    Top = 35
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 1
    OnClick = BtnInserirFIlaClick
  end
  object BtnRemoverUltimaItemFila: TBitBtn
    Left = 40
    Top = 88
    Width = 161
    Height = 25
    Caption = 'Remover último item da Fila'
    TabOrder = 2
    OnClick = BtnRemoverUltimaItemFilaClick
  end
  object BtnTotalItensFila: TBitBtn
    Left = 40
    Top = 120
    Width = 161
    Height = 25
    Caption = 'Total Itens da Fila'
    TabOrder = 3
    OnClick = BtnTotalItensFilaClick
  end
end
