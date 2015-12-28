object frmRelacaoOS: TfrmRelacaoOS
  Left = 393
  Top = 154
  Width = 884
  Height = 629
  Caption = 'frmRelacaoOS'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RlRpt: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    AllowedBands = [btTitle, btColumnHeader, btDetail, btFooter]
    DataSource = frmOS.dsOS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ExpressionParser = RLExpressionParser1
    BeforePrint = RlRptBeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 59
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 145
        Top = 21
        Width = 237
        Height = 18
        Caption = 'Relat'#243'rio de Ordens de Servi'#231'os'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 448
        Top = 5
        Width = 64
        Height = 18
        Caption = 'Per'#237'odo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Inicial: TRLLabel
        Left = 520
        Top = 5
        Width = 64
        Height = 18
        Caption = 'Per'#237'odo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 600
        Top = 5
        Width = 26
        Height = 18
        Caption = 'at'#233
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Final: TRLLabel
        Left = 640
        Top = 5
        Width = 64
        Height = 18
        Caption = 'Per'#237'odo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RlImgLogo: TRLImage
        Left = 8
        Top = 8
        Width = 105
        Height = 49
        Stretch = True
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 97
      Width = 718
      Height = 16
      BandType = btColumnHeader
      object RLLabel2: TRLLabel
        Left = 448
        Top = -2
        Width = 40
        Height = 18
        Caption = 'Tipo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Tipo: TRLLabel
        Left = 520
        Top = -2
        Width = 40
        Height = 18
        Caption = 'Tipo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 32
      BandType = btColumnHeader
      object RLLabel3: TRLLabel
        Left = 8
        Top = 6
        Width = 28
        Height = 15
        Caption = 'C'#243'd.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 88
        Top = 6
        Width = 53
        Height = 15
        Caption = 'Abertura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 160
        Top = 6
        Width = 33
        Height = 15
        Caption = 'Fech.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 232
        Top = 6
        Width = 42
        Height = 15
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 616
        Top = 6
        Width = 33
        Height = 15
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 672
        Top = 6
        Width = 40
        Height = 15
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 413
        Top = 6
        Width = 58
        Height = 15
        Caption = 'Vendedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = -20
        Top = 4
        Width = 736
        Height = 1
      end
      object RLDraw2: TRLDraw
        Left = -20
        Top = 22
        Width = 736
        Height = 1
      end
      object RLLabel17: TRLLabel
        Left = 48
        Top = 6
        Width = 35
        Height = 15
        Caption = 'Bloco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 145
      Width = 718
      Height = 16
      object CODIGO: TRLDBText
        Left = 8
        Top = 0
        Width = 51
        Height = 15
        DataSource = frmOS.dsOS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object ABERTURA: TRLDBText
        Left = 88
        Top = 0
        Width = 67
        Height = 15
        DataSource = frmOS.dsOS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object FECHAMENTO: TRLDBText
        Left = 160
        Top = 0
        Width = 85
        Height = 15
        DataSource = frmOS.dsOS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object CLIENTE: TRLDBText
        Left = 232
        Top = 0
        Width = 177
        Height = 14
        AutoSize = False
        DataSource = frmOS.dsOS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object VALOR: TRLDBText
        Left = 616
        Top = 0
        Width = 42
        Height = 15
        DataSource = frmOS.dsOS
        DisplayMask = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object STATUS: TRLDBText
        Left = 672
        Top = 0
        Width = 49
        Height = 15
        DataSource = frmOS.dsOS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object VENDEDOR: TRLDBText
        Left = 413
        Top = 0
        Width = 196
        Height = 14
        AutoSize = False
        DataSource = frmOS.dsOS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object OSBLOCO: TRLDBText
        Left = 48
        Top = 0
        Width = 62
        Height = 15
        DataSource = frmOS.dsOS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 193
      Width = 718
      Height = 32
      BandType = btColumnFooter
      object RLLabel13: TRLLabel
        Left = 336
        Top = 15
        Width = 127
        Height = 16
        Caption = 'Relat'#243'rio emitido em:'
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 471
        Top = 15
        Width = 37
        Height = 16
        Info = itNow
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 161
      Width = 718
      Height = 32
      BandType = btColumnFooter
      object RLDraw3: TRLDraw
        Left = 3
        Top = 4
        Width = 713
        Height = 1
      end
      object RLLabel14: TRLLabel
        Left = 231
        Top = 8
        Width = 77
        Height = 16
        Caption = 'Abertas (A):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel15: TRLLabel
        Left = 8
        Top = 8
        Width = 103
        Height = 16
        Caption = 'Canceladas (C):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel16: TRLLabel
        Left = 393
        Top = 8
        Width = 89
        Height = 16
        Caption = 'Fechadas (F):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CANCELADAS: TRLDBText
        Left = 120
        Top = 8
        Width = 92
        Height = 16
        DisplayMask = ',0.00'
      end
      object ABERTAS: TRLDBText
        Left = 313
        Top = 8
        Width = 65
        Height = 16
        DisplayMask = ',0.00'
      end
      object FECHADAS: TRLDBText
        Left = 488
        Top = 8
        Width = 74
        Height = 16
        DisplayMask = ',0.00'
      end
    end
  end
  object RLExpressionParser1: TRLExpressionParser
    Left = 728
    Top = 208
  end
end
