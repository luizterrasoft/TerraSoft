object frmCadastroDevolucao: TfrmCadastroDevolucao
  Left = 518
  Top = 334
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'DEVOLU'#199#195'O'
  ClientHeight = 150
  ClientWidth = 225
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
  PixelsPerInch = 96
  TextHeight = 13
  object PnDados: TPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 102
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 68
      Height = 13
      Caption = 'ID Empr'#233'stimo'
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 74
      Height = 13
      Caption = 'Data Devolvido'
    end
    object edtIDEmprestimo: TEdit
      Left = 8
      Top = 24
      Width = 57
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
    end
    object mskDataDevolvido: TMaskEdit
      Left = 8
      Top = 72
      Width = 81
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object PnOpcoes: TPanel
    Left = 0
    Top = 102
    Width = 225
    Height = 48
    Align = alBottom
    TabOrder = 1
    object BtnGravar: TBitBtn
      Left = 16
      Top = 12
      Width = 83
      Height = 25
      Caption = 'GRAVAR'
      TabOrder = 0
      OnClick = BtnGravarClick
    end
    object BtnCancelar: TBitBtn
      Left = 104
      Top = 12
      Width = 97
      Height = 25
      Caption = 'CANCELAR - Esc'
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object qryDevolucao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conexao
    Left = 144
    Top = 24
  end
end
