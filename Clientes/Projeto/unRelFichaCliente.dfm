object frmRelFichaCliente: TfrmRelFichaCliente
  Left = 319
  Top = 26
  Width = 851
  Height = 812
  Caption = 'frmRelFichaCliente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RlRptFicha: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = frmPrincipal.dsClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object BdnTitulo: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 35
      BandType = btTitle
      object RllblTitulo: TRLLabel
        Left = 266
        Top = 2
        Width = 185
        Height = 22
        Caption = 'FICHA CADASTRAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object BndTitulos: TRLBand
      Left = 38
      Top = 73
      Width = 718
      Height = 704
      object RLLabel1: TRLLabel
        Left = 8
        Top = 8
        Width = 49
        Height = 16
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 72
        Top = 8
        Width = 41
        Height = 16
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 440
        Top = 8
        Width = 78
        Height = 16
        Caption = 'Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 528
        Top = 8
        Width = 113
        Height = 16
        Caption = 'Data de Cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 8
        Top = 56
        Width = 64
        Height = 16
        Caption = 'Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 312
        Top = 56
        Width = 54
        Height = 16
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 392
        Top = 56
        Width = 66
        Height = 16
        Caption = 'Munic'#237'pio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 632
        Top = 56
        Width = 21
        Height = 16
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 8
        Top = 112
        Width = 36
        Height = 16
        Caption = 'Fone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 128
        Top = 112
        Width = 50
        Height = 16
        Caption = 'Celular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 264
        Top = 112
        Width = 30
        Height = 16
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 384
        Top = 112
        Width = 23
        Height = 16
        Caption = 'RG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel13: TRLLabel
        Left = 504
        Top = 112
        Width = 78
        Height = 16
        Caption = 'Estado Civil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel14: TRLLabel
        Left = 600
        Top = 112
        Width = 115
        Height = 16
        Caption = 'Outro Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel15: TRLLabel
        Left = 8
        Top = 160
        Width = 57
        Height = 16
        Caption = 'Conjug'#234
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel16: TRLLabel
        Left = 264
        Top = 160
        Width = 148
        Height = 16
        Caption = 'Empresa que Trabalha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel17: TRLLabel
        Left = 504
        Top = 160
        Width = 104
        Height = 16
        Caption = 'Profiss'#227'o/Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel18: TRLLabel
        Left = 8
        Top = 208
        Width = 25
        Height = 16
        Caption = 'Pai'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel19: TRLLabel
        Left = 264
        Top = 208
        Width = 31
        Height = 16
        Caption = 'M'#227'e'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel20: TRLLabel
        Left = 8
        Top = 256
        Width = 91
        Height = 16
        Caption = 'Valor Aluguel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 128
        Top = 256
        Width = 73
        Height = 16
        Caption = 'Refer'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel22: TRLLabel
        Left = 504
        Top = 256
        Width = 173
        Height = 16
        Caption = 'Fone Respons'#225'vel Aluguel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel23: TRLLabel
        Left = 8
        Top = 302
        Width = 149
        Height = 16
        Caption = #218'ltima compra '#224' prazo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel24: TRLLabel
        Left = 160
        Top = 302
        Width = 175
        Height = 16
        Caption = 'Empresa da '#250'ltima compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel25: TRLLabel
        Left = 344
        Top = 302
        Width = 197
        Height = 16
        Caption = 'Empresas que comrpa '#224' prazo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel26: TRLLabel
        Left = 8
        Top = 400
        Width = 112
        Height = 16
        Caption = 'Valor da Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel27: TRLLabel
        Left = 128
        Top = 400
        Width = 125
        Height = 16
        Caption = 'Valor da Presta'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel28: TRLLabel
        Left = 256
        Top = 400
        Width = 129
        Height = 16
        Caption = 'Tipo de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel29: TRLLabel
        Left = 8
        Top = 456
        Width = 85
        Height = 16
        Caption = 'Observa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CODIGO: TRLDBText
        Left = 8
        Top = 32
        Width = 56
        Height = 16
        DataField = 'CODIGO'
        DataSource = frmPrincipal.dsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object NOME: TRLDBText
        Left = 72
        Top = 32
        Width = 42
        Height = 16
        DataField = 'NOME'
        DataSource = frmPrincipal.dsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object NASCIMENTO: TRLDBText
        Left = 440
        Top = 32
        Width = 89
        Height = 16
        DataField = 'NASCIMENTO'
        DataSource = frmPrincipal.dsClientes
      end
      object DATACADASTRO: TRLDBText
        Left = 528
        Top = 32
        Width = 109
        Height = 16
        DataField = 'DATACADASTRO'
        DataSource = frmPrincipal.dsClientes
      end
      object ENDERECO: TRLDBText
        Left = 8
        Top = 80
        Width = 77
        Height = 16
        DataField = 'ENDERECO'
        DataSource = frmPrincipal.dsClientes
      end
      object NUMERO: TRLDBText
        Left = 312
        Top = 80
        Width = 61
        Height = 16
        DataField = 'NUMERO'
        DataSource = frmPrincipal.dsClientes
      end
      object MUNICIPIO: TRLDBText
        Left = 392
        Top = 80
        Width = 70
        Height = 16
        DataField = 'MUNICIPIO'
        DataSource = frmPrincipal.dsClientes
      end
      object FONE: TRLDBText
        Left = 8
        Top = 136
        Width = 40
        Height = 16
        DataField = 'FONE'
        DataSource = frmPrincipal.dsClientes
      end
      object CELULAR: TRLDBText
        Left = 128
        Top = 136
        Width = 63
        Height = 16
        DataField = 'CELULAR'
        DataSource = frmPrincipal.dsClientes
      end
      object CPF: TRLDBText
        Left = 264
        Top = 136
        Width = 30
        Height = 16
        DataField = 'CPF'
        DataSource = frmPrincipal.dsClientes
      end
      object RG: TRLDBText
        Left = 384
        Top = 136
        Width = 23
        Height = 16
        DataField = 'RG'
        DataSource = frmPrincipal.dsClientes
      end
      object OUTRODOCUMENTO: TRLDBText
        Left = 600
        Top = 136
        Width = 77
        Height = 16
        DataField = 'OUTRODOC'
        DataSource = frmPrincipal.dsClientes
      end
      object CONJUGE: TRLDBText
        Left = 8
        Top = 184
        Width = 66
        Height = 16
        DataField = 'CONJUGE'
        DataSource = frmPrincipal.dsClientes
      end
      object EMPRESATRABALHA: TRLDBText
        Left = 264
        Top = 184
        Width = 137
        Height = 16
        DataField = 'EMPRESATRABALHA'
        DataSource = frmPrincipal.dsClientes
      end
      object PROFISSAOCARGO: TRLDBText
        Left = 504
        Top = 184
        Width = 127
        Height = 16
        DataField = 'PROFISSAOCARGO'
        DataSource = frmPrincipal.dsClientes
      end
      object PAI: TRLDBText
        Left = 8
        Top = 232
        Width = 25
        Height = 16
        DataField = 'PAI'
        DataSource = frmPrincipal.dsClientes
      end
      object MAE: TRLDBText
        Left = 264
        Top = 232
        Width = 33
        Height = 16
        DataField = 'MAE'
        DataSource = frmPrincipal.dsClientes
      end
      object VALORALUGUEL: TRLDBText
        Left = 8
        Top = 280
        Width = 108
        Height = 16
        DataField = 'VALORALUGUEL'
        DataSource = frmPrincipal.dsClientes
      end
      object REFERENCIA: TRLDBText
        Left = 128
        Top = 280
        Width = 87
        Height = 16
        DataField = 'REFERENCIA'
        DataSource = frmPrincipal.dsClientes
      end
      object FONERESPONSAVELALUGUEL: TRLDBText
        Left = 504
        Top = 280
        Width = 198
        Height = 16
        DataField = 'FONERESPONSAVELALUGUEL'
        DataSource = frmPrincipal.dsClientes
      end
      object ULTIMACOMPRAPRAZO: TRLDBText
        Left = 8
        Top = 328
        Width = 151
        Height = 16
        DataField = 'ULTIMACOMPRAPRAZO'
        DataSource = frmPrincipal.dsClientes
      end
      object EMPRESAULTIMACOMPRA: TRLDBText
        Left = 160
        Top = 328
        Width = 172
        Height = 16
        DataField = 'EMPRESAULTIMACOMPRA'
        DataSource = frmPrincipal.dsClientes
      end
      object VALORCOMPRA: TRLDBText
        Left = 8
        Top = 424
        Width = 48
        Height = 16
        DataField = 'VALOR'
        DataSource = frmPrincipal.dsClientes
      end
      object VALORPRESTACAO: TRLDBText
        Left = 128
        Top = 424
        Width = 128
        Height = 16
        DataField = 'VALORPRESTACAO'
        DataSource = frmPrincipal.dsClientes
      end
      object UF: TRLLabel
        Left = 632
        Top = 80
        Width = 21
        Height = 16
      end
      object ESTADOCIVIL: TRLLabel
        Left = 504
        Top = 136
        Width = 88
        Height = 16
      end
      object TIPOPAGAMENTO: TRLLabel
        Left = 256
        Top = 424
        Width = 116
        Height = 16
      end
      object EMPRESASPRAZO: TRLDBRichText
        Left = 344
        Top = 328
        Width = 353
        Height = 57
        Behavior = [beSiteExpander]
        DataField = 'EMPRESASPRAZO'
        DataSource = frmPrincipal.dsClientes
      end
      object OBSERVACOES: TRLDBRichText
        Left = 8
        Top = 480
        Width = 689
        Height = 113
        Behavior = [beSiteExpander]
        DataField = 'OBSERVACOES'
        DataSource = frmPrincipal.dsClientes
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 777
      Width = 718
      Height = 173
      BandType = btColumnFooter
      object ASSINATURACLIENTE: TLabel
        Left = 306
        Top = 54
        Width = 106
        Height = 16
        Caption = 'Assinatura Cliente'
      end
      object RLLabel30: TRLLabel
        Left = 16
        Top = 120
        Width = 119
        Height = 16
        Caption = 'Ficha impressa em:'
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 144
        Top = 120
        Width = 60
        Height = 16
        Info = itFullDate
      end
      object RLDraw1: TRLDraw
        Left = 184
        Top = 48
        Width = 350
        Height = 1
      end
    end
  end
end
