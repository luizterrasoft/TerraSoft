object frmReciboCR: TfrmReciboCR
  Left = 402
  Top = 292
  Width = 1159
  Height = 736
  Caption = 'frmReciboCR'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RlRptReciboCR: TRLReport
    Left = 7
    Top = 7
    Width = 794
    Height = 1123
    AllowedBands = [btTitle, btDetail]
    DataSource = frmContasReceber.dsContasReceber
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = RlRptReciboCRBeforePrint
    object BndTitulo: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 67
      BandType = btTitle
      object VALOREAL: TLabel
        Left = 488
        Top = 15
        Width = 92
        Height = 18
        Caption = 'VALOR REAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel1: TRLLabel
        Left = 253
        Top = 9
        Width = 77
        Height = 22
        Caption = 'RECIBO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RlImgLogo: TRLImage
        Left = 16
        Top = 8
        Width = 105
        Height = 49
        Stretch = True
      end
    end
    object BndDados: TRLBand
      Left = 38
      Top = 105
      Width = 718
      Height = 299
      BandType = btColumnHeader
      object RLLabel2: TRLLabel
        Left = 46
        Top = 13
        Width = 179
        Height = 15
        Caption = 'RECEBI (EMOS) DO(A) '
      end
      object RLLabel3: TRLLabel
        Left = 13
        Top = 37
        Width = 164
        Height = 15
        Caption = 'A IMPORT'#194'NCIA DE '
      end
      object RLLabel4: TRLLabel
        Left = 13
        Top = 60
        Width = 268
        Height = 16
        Caption = 'REFERENTE '#193'  PARCELA N'#218'MERO'
      end
      object RLLabel5: TRLLabel
        Left = 13
        Top = 84
        Width = 436
        Height = 15
        Caption = 'E POR SER VERDADE FIRMO O PRESENTE RECIBO.'
      end
      object RLLabel6: TRLLabel
        Left = 13
        Top = 107
        Width = 73
        Height = 16
        Caption = 'EMITENTE:'
      end
      object DATAEXTENSO: TRLLabel
        Left = 306
        Top = 182
        Width = 367
        Height = 15
        Caption = 'DATA POR EXTENSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 123
        Top = 253
        Width = 325
        Height = 1
      end
      object RLLabel7: TRLLabel
        Left = 258
        Top = 256
        Width = 67
        Height = 15
        Caption = 'Assinatura'
      end
      object VALOREXTENSO: TRLLabel
        Left = 188
        Top = 37
        Width = 501
        Height = 15
        Caption = 'VALOR POR EXTENSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PESSOA: TRLLabel
        Left = 234
        Top = 13
        Width = 463
        Height = 15
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PARCELA: TRLLabel
        Left = 287
        Top = 60
        Width = 410
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EMITENTE: TRLLabel
        Left = 91
        Top = 107
        Width = 278
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
end
