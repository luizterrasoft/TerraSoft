object frmRelEquipamentos: TfrmRelEquipamentos
  Left = 222
  Top = 183
  Width = 1282
  Height = 588
  Caption = 'frmRelEquipamentos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Rel: TRLReport
    Left = 8
    Top = 8
    Width = 1123
    Height = 794
    DataSource = frmRelatoriosManutencoes.dsRelatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    ExpressionParser = RLExpressionParser1
    BeforePrint = RelBeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 67
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 239
        Top = 24
        Width = 203
        Height = 19
        Caption = 'Relat'#243'rio de Manuten'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel14: TRLLabel
        Left = 535
        Top = 24
        Width = 70
        Height = 19
        Caption = 'Per'#237'odo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblInicial: TRLLabel
        Left = 615
        Top = 24
        Width = 80
        Height = 19
        Caption = 'Inicial        '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel15: TRLLabel
        Left = 703
        Top = 24
        Width = 27
        Height = 19
        Caption = 'at'#233
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFinal: TRLLabel
        Left = 735
        Top = 24
        Width = 73
        Height = 19
        Caption = 'Final        '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RlImgLogo: TRLImage
        Left = 14
        Top = 8
        Width = 105
        Height = 52
        Stretch = True
      end
    end
    object GRUPO1: TRLGroup
      Left = 38
      Top = 105
      Width = 1047
      Height = 176
      DataFields = 'CODEQUIPAMENTO'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 1047
        Height = 25
        BandType = btColumnHeader
        object RLLabel2: TRLLabel
          Left = 24
          Top = 5
          Width = 112
          Height = 19
          Caption = 'Equipamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EQUIPAMENTO: TRLDBText
          Left = 256
          Top = 5
          Width = 123
          Height = 19
          DataField = 'EQUIPAMENTO'
          DataSource = frmRelatoriosManutencoes.dsRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object CODEQUIPAMENTO: TRLDBText
          Left = 200
          Top = 5
          Width = 49
          Height = 16
          AutoSize = False
          DataField = 'CODEQUIPAMENTO'
          DataSource = frmRelatoriosManutencoes.dsRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object GRUPO2: TRLGroup
        Left = 0
        Top = 25
        Width = 1047
        Height = 144
        DataFields = 'CODPLANOCONTA'
        object RLBand4: TRLBand
          Left = 0
          Top = 0
          Width = 1047
          Height = 17
          BandType = btColumnHeader
          object RLLabel3: TRLLabel
            Left = 40
            Top = 1
            Width = 110
            Height = 16
            Caption = 'Plano de Conta: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object PLANOCONTA: TRLDBText
            Left = 256
            Top = 1
            Width = 92
            Height = 16
            DataField = 'PLANOCONTA'
            DataSource = frmRelatoriosManutencoes.dsRelatorio
          end
          object CODPLANOCONTA: TRLDBText
            Left = 200
            Top = 1
            Width = 49
            Height = 16
            AutoSize = False
            DataField = 'CODPLANOCONTA'
            DataSource = frmRelatoriosManutencoes.dsRelatorio
          end
        end
        object GRUPO3: TRLGroup
          Left = 0
          Top = 17
          Width = 1047
          Height = 120
          DataFields = 'CODSUBPLANO'
          object RLBand5: TRLBand
            Left = 0
            Top = 0
            Width = 1047
            Height = 57
            BandType = btColumnHeader
            object RLLabel4: TRLLabel
              Left = 56
              Top = 1
              Width = 135
              Height = 16
              Caption = 'Sub-Plano de Conta:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object SUBPLANOCONTA: TRLDBText
              Left = 256
              Top = 1
              Width = 119
              Height = 16
              DataField = 'SUBPLANOCONTA'
              DataSource = frmRelatoriosManutencoes.dsRelatorio
            end
            object RLLabel5: TRLLabel
              Left = 80
              Top = 40
              Width = 66
              Height = 16
              Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel6: TRLLabel
              Left = 672
              Top = 40
              Width = 38
              Height = 16
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel7: TRLLabel
              Left = 376
              Top = 40
              Width = 77
              Height = 16
              Caption = 'Fornecedor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel8: TRLLabel
              Left = 768
              Top = 40
              Width = 43
              Height = 16
              Caption = 'Status'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel9: TRLLabel
              Left = 816
              Top = 40
              Width = 33
              Height = 16
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel10: TRLLabel
              Left = 896
              Top = 40
              Width = 74
              Height = 16
              Caption = 'Nota Fiscal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object CODSUBPLANO: TRLDBText
              Left = 200
              Top = 1
              Width = 49
              Height = 16
              AutoSize = False
              DataField = 'CODSUBPLANO'
              DataSource = frmRelatoriosManutencoes.dsRelatorio
            end
            object RLLabel13: TRLLabel
              Left = 984
              Top = 40
              Width = 32
              Height = 16
              Caption = 'Tipo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
          end
          object RLBand6: TRLBand
            Left = 0
            Top = 57
            Width = 1047
            Height = 24
            object RLDBText1: TRLDBText
              Left = 80
              Top = 5
              Width = 289
              Height = 16
              AutoSize = False
              DataField = 'DESCRICAO'
              DataSource = frmRelatoriosManutencoes.dsRelatorio
            end
            object RLDBText2: TRLDBText
              Left = 704
              Top = 5
              Width = 52
              Height = 16
              Alignment = taRightJustify
              DataFormula = 'TOTAL'
              DataSource = frmRelatoriosManutencoes.dsRelatorio
              DisplayMask = ',0.00'
            end
            object RLDBText3: TRLDBText
              Left = 376
              Top = 5
              Width = 289
              Height = 16
              AutoSize = False
              DataField = 'RAZAOSOCIAL'
              DataSource = frmRelatoriosManutencoes.dsRelatorio
            end
            object STATUS: TRLDBText
              Left = 768
              Top = 5
              Width = 54
              Height = 16
              DataField = 'STATUS'
              DataSource = frmRelatoriosManutencoes.dsRelatorio
            end
            object DATAABERTURA: TRLDBText
              Left = 816
              Top = 5
              Width = 108
              Height = 16
              DataField = 'DATAABERTURA'
              DataSource = frmRelatoriosManutencoes.dsRelatorio
            end
            object RLDBText4: TRLDBText
              Left = 896
              Top = 5
              Width = 78
              Height = 16
              DataField = 'NUMERONF'
              DataSource = frmRelatoriosManutencoes.dsRelatorio
            end
          end
          object RLBand7: TRLBand
            Left = 0
            Top = 81
            Width = 1047
            Height = 32
            BandType = btFooter
            object RLLabel11: TRLLabel
              Left = 80
              Top = 7
              Width = 36
              Height = 16
              Caption = 'Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBResult1: TRLDBResult
              Left = 664
              Top = 7
              Width = 96
              Height = 16
              Alignment = taRightJustify
              DataFormula = 'TOTAL'
              DataSource = frmRelatoriosManutencoes.dsRelatorio
              DisplayMask = ',0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Info = riSum
              ParentFont = False
            end
            object RLDraw3: TRLDraw
              Left = 12
              Top = 24
              Width = 1020
              Height = 1
            end
          end
        end
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 281
      Width = 1047
      Height = 41
      BandType = btColumnFooter
      object RLLabel16: TRLLabel
        Left = 664
        Top = 16
        Width = 121
        Height = 16
        Caption = 'Data/Hora Emiss'#227'o:'
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 792
        Top = 16
        Width = 60
        Height = 16
        Info = itFullDate
      end
      object RLLabel12: TRLLabel
        Left = 32
        Top = 16
        Width = 79
        Height = 16
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult2: TRLDBResult
        Left = 136
        Top = 16
        Width = 96
        Height = 16
        Alignment = taRightJustify
        DataFormula = 'TOTAL'
        DataSource = frmRelatoriosManutencoes.dsRelatorio
        DisplayMask = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
      end
    end
  end
  object RLExpressionParser1: TRLExpressionParser
    Left = 384
    Top = 432
  end
end