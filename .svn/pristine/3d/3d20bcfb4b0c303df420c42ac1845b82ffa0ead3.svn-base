inherited frmCondicoesPgto: TfrmCondicoesPgto
  Left = 447
  Top = 242
  Caption = 'CONDI'#199#213'ES DE PAGAMENTO'
  ClientWidth = 543
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    Width = 543
    inherited lblTitulo: TLabel
      Left = 42
      Top = 8
      Width = 460
      Caption = 'CONSULTA DE CONDI'#199#213'ES DE PAGAMENTO'
    end
  end
  inherited PnConsulta: TPanel
    Width = 543
    inherited Label2: TLabel
      Left = 507
      Top = 31
    end
    object Bevel1: TBevel [2]
      Left = 134
      Top = 7
      Width = 2
      Height = 50
    end
    inherited edtConsulta: TEdit
      Left = 143
      Top = 29
      Height = 22
      OnKeyPress = edtConsultaKeyPress
    end
    object RdBtnCodigo: TRadioButton
      Left = 16
      Top = 24
      Width = 81
      Height = 17
      Caption = 'C'#243'digo'
      TabOrder = 1
    end
    object RdBtnDescricao: TRadioButton
      Left = 16
      Top = 40
      Width = 81
      Height = 17
      Caption = 'Descri'#231#227'o'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
  inherited PnDados: TPanel
    Width = 543
    object GrdCondicoesPgto: TDBGrid
      Left = 1
      Top = 1
      Width = 541
      Height = 226
      Align = alClient
      Color = 13565951
      DataSource = dsDados
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -10
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = GrdCondicoesPgtoDrawColumnCell
      OnDblClick = GrdCondicoesPgtoDblClick
      OnKeyPress = GrdCondicoesPgtoKeyPress
      OnTitleClick = GrdCondicoesPgtoTitleClick
      Columns = <
        item
          Alignment = taCenter
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
          Width = 287
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTDPARCELAS'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Parcelas'
          Width = 92
          Visible = True
        end>
    end
  end
  inherited PnAcoes: TPanel
    Width = 543
    inherited BtnIncluir: TBitBtn
      Left = 96
    end
    inherited BtnAlterar: TBitBtn
      Left = 192
    end
    inherited BtnExcluir: TBitBtn
      Left = 287
    end
    inherited BtnSair: TBitBtn
      Left = 432
    end
  end
  inherited qryDados: TSQLQuery
    Left = 160
    Top = 33
  end
  inherited dsDados: TDataSource
    Left = 192
    Top = 33
  end
  inherited cdsDados: TClientDataSet
    Left = 224
    Top = 33
  end
  inherited dspDados: TDataSetProvider
    Left = 256
    Top = 33
  end
  object qryAux: TSQLQuery
    DataSource = dsAux
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 160
    Top = 64
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 192
    Top = 64
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 224
    Top = 64
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Left = 256
    Top = 64
  end
end
