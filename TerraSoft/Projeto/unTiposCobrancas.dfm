inherited frmTiposCobrancas: TfrmTiposCobrancas
  Left = 391
  Top = 257
  Caption = 'TIPOS DE COBRAN'#199'A'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    inherited lblTitulo: TLabel
      Left = 99
      Top = 8
      Width = 382
      Caption = 'CONSULTA DE TIPOS DE COBRAN'#199'A'
    end
  end
  inherited PnConsulta: TPanel
    inherited Label2: TLabel
      Left = 523
      Top = 31
    end
    object Bevel1: TBevel [2]
      Left = 136
      Top = 8
      Width = 2
      Height = 50
    end
    inherited edtConsulta: TEdit
      Left = 159
      Top = 29
      Width = 354
      OnKeyPress = edtConsultaKeyPress
    end
    object RdBtnCodigo: TRadioButton
      Left = 16
      Top = 24
      Width = 113
      Height = 17
      Caption = 'C'#243'digo'
      TabOrder = 1
    end
    object RdBtnDescricao: TRadioButton
      Left = 16
      Top = 40
      Width = 113
      Height = 17
      Caption = 'Descri'#231#227'o'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
  inherited PnDados: TPanel
    object GrdTiposCobranca: TDBGrid
      Left = 1
      Top = 1
      Width = 577
      Height = 226
      Align = alClient
      Color = 13565951
      DataSource = dsDados
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -10
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = GrdTiposCobrancaDrawColumnCell
      OnDblClick = GrdTiposCobrancaDblClick
      OnKeyPress = GrdTiposCobrancaKeyPress
      OnTitleClick = GrdTiposCobrancaTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 360
          Visible = True
        end>
    end
  end
  inherited qryDados: TSQLQuery
    Left = 376
    Top = 25
  end
  inherited dsDados: TDataSource
    Left = 408
    Top = 25
  end
  inherited cdsDados: TClientDataSet
    Left = 440
    Top = 25
  end
  inherited dspDados: TDataSetProvider
    Left = 472
    Top = 25
  end
end
