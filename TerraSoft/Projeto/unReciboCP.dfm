object frmReciboCP: TfrmReciboCP
  Left = 342
  Top = 140
  Width = 878
  Height = 675
  Caption = 'frmReciboCP'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RlRptReciboCP: TRLReport
    Left = 7
    Top = 1
    Width = 794
    Height = 1123
    AllowedBands = [btTitle, btDetail]
    DataSource = frmContasReceber.dsContasReceber
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = RlRptReciboCPBeforePrint
    object BndTitulo: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 59
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
      Top = 97
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
        Width = 156
        Height = 15
        Caption = 'A IMPORT'#194'NCIA DE '
      end
      object RLLabel4: TRLLabel
        Left = 13
        Top = 60
        Width = 260
        Height = 16
        Caption = 'REFERENTE '#193'  PARCELA N'#218'MERO'
      end
      object RLLabel5: TRLLabel
        Left = 13
        Top = 84
        Width = 508
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
        Width = 343
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
        Left = 180
        Top = 37
        Width = 525
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
        Left = 91
        Top = 107
        Width = 526
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PARCELA: TRLLabel
        Left = 335
        Top = 60
        Width = 154
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EMITENTE: TRLLabel
        Left = 232
        Top = 13
        Width = 457
        Height = 15
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
